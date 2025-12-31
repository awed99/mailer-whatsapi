// store/appState.js
"use client";

import { compress, decompress } from "@/lib/encryptor";
import { proxy, subscribe } from "valtio";

export const appState = proxy({});

if (typeof window !== "undefined") {
  const saved = localStorage.getItem("app");

  if (saved) {
    try {
      const restored = decompress(saved);
      if (restored) Object.assign(appState, restored);
    } catch (err) {
      console.error("❌ Failed to restore state:", err);
    }
  }

  // Otomatis simpan setiap ada perubahan
  subscribe(appState, () => {
    try {
      const compressed = compress(appState);
      localStorage.setItem("app", compressed);
    } catch (err) {
      console.error("❌ Failed to persist state:", err);
    }
  });
}

// // store/appState.js
// import { proxy, subscribe } from 'valtio'

// // 1. Buat state dinamis
// export const appState = proxy({})

// if (typeof window !== 'undefined') {
//   // 2. Restore dulu dari localStorage (saat pertama dijalankan)
//   const saved = localStorage.getItem('app')
//   if (saved) {
//     try {
//       Object.assign(appState, JSON.parse(saved))
//     } catch (err) {
//       console.error('Failed to parse saved state:', err)
//     }
//   }

//   // 3. Subscribe otomatis untuk persist setiap ada perubahan
//   subscribe(appState, () => {
//     localStorage.setItem('app', JSON.stringify(appState))
//   })
// }

/*

import { appState } from '@/db/store'

✅ Set atau tambah key
export function setState(key, value) {
  appState[key] = value
}

✅ Get (langsung dari state)
export function getState(key) {
  return appState[key]
}

✅ Remove key tertentu
export function removeState(key) {
  delete appState[key]
}

✅ Clear semua key (reset kosong)
export function clearState() {
  Object.keys(appState).forEach((key) => {
    delete appState[key]
  })
}

---------------------------------------------------------------------------------------

📌 Contoh Pemakaian di Komponen React:

'use client'
import { useSnapshot } from 'valtio'
import { appState } from '@/store/appState'
import { setState, getState, removeState, clearState } from '@/utils/appStateUtils'

export default function Dashboard() {
  const snap = useSnapshot(appState)

  return (
    <div>
      <p>Username: {snap.username || 'Belum di-set'}</p>

      <button onClick={() => setState('username', 'bayardp')}>Set Username</button>
      <button onClick={() => alert(getState('username'))}>Get Username</button>
      <button onClick={() => removeState('username')}>Remove Username</button>
      <button onClick={clearState}>Clear Semua</button>
    </div>
  )
}

/*

/*

📦 Cara pakai di file mana pun:
js
Copy
Edit
// misalnya di page atau komponen
import { useSnapshot } from 'valtio'
import { appState } from '@/store/appState'

const snap = useSnapshot(appState)

return <div>{snap.username}</div>

*/

/*

🔥 Contoh: Valtio Dynamic Proxy (gaya localStorage tapi reactive)
1. store.js cukup kosongin proxy({}) aja
js
Copy
Edit
// store.js
import { proxy } from 'valtio'

export const appState = proxy({}) // kosong, bebas key!
2. Set key dinamis di mana aja
js
Copy
Edit
import { appState } from './store'

// Mirip localStorage.setItem('username', 'Danu')
appState.username = 'Danu'
appState.token = '123456'
appState['customKey'] = 'bebas isi'

// Bisa juga nested
appState.settings = { theme: 'dark', lang: 'id' }
3. Get value (auto reactive)
js
Copy
Edit
import { useSnapshot } from 'valtio'
import { appState } from './store'

export default function Profile() {
  const snap = useSnapshot(appState)

  return (
    <div>
      <p>User: {snap.username}</p>
      <p>Theme: {snap.settings?.theme}</p>
    </div>
  )
}
4. Delete key (mirip removeItem)
js
Copy
Edit
delete appState.token
delete appState['username']

*/
