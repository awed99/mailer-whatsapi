"use client";

import { compress, decompress } from "@/lib/encryptor";
import { proxy, subscribe, useSnapshot } from "valtio";

// --- 🧩 State global utama ---
export const appState = proxy({});

// --- 💾 Restore dari localStorage (hanya di client) ---
if (typeof window !== "undefined") {
  const saved = localStorage.getItem("app");
  if (saved) {
    try {
      const _restored = decompress(saved);
      const restored = JSON.parse(_restored);
      if (restored && typeof restored === "object") {
        Object.assign(appState, restored);
      }
    } catch (err) {
      console.error("❌ Failed to restore state:", err);
    }
  }

  // --- 🔁 Auto persist ke localStorage ---
  let timeout;
  subscribe(appState, () => {
    clearTimeout(timeout);
    timeout = setTimeout(() => {
      try {
        const _appState = JSON.stringify(appState);
        const _current = compress(_appState);
        const current = _current;
        const prev = localStorage.getItem("app");
        if (current !== prev) localStorage.setItem("app", current);
      } catch (err) {
        console.error("❌ Failed to persist state:", err);
      }
    }, 200); // debounce kecil biar gak sering nulis
  });

  // --- 🌐 Cross-tab sync (optional tapi keren) ---
  window.addEventListener("storage", (e) => {
    if (e.key === "app" && e.newValue) {
      try {
        const restored = decompress(e.newValue);
        if (restored && typeof restored === "object") {
          Object.assign(appState, restored);
        }
      } catch (err) {
        console.error("❌ Failed to sync state across tabs:", err);
      }
    }
  });
}

// --- 🔥 custom hook reaktif ---
export function useAppState() {
  return useSnapshot(appState); // ✅ sekarang reactive di mana pun kamu panggil
}

/*

CARA PAKAI :

"use client";
import { useAppState } from "@/storage/store-client";

export default function Example() {
  const appState = useAppState();

  return (
    <div>
      <p>Nama: {appState.name || "Belum ada"}</p>
      <button onClick={() => (appState.name = "Tes Akun")}>Ubah</button>
    </div>
  );
}

*/
