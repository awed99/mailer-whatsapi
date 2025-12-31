import mysql from "mysql2/promise";
import db_config from "./db_config";

/**
 * Ambil domain/host (tanpa protokol, tanpa path)
 * Contoh:
 *  - https://dewapulsa.com/api -> dewapulsa.com
 *  - http://23.65.133.32:3000 -> 23.65.133.32:3000
 */

export function getHost(url) {
  if (!url) return null;

  try {
    // Tambahkan protokol jika belum ada
    if (!/^https?:\/\//i.test(url)) {
      url = "http://" + url;
    }

    const parsed = new URL(url);
    return parsed.host?.split(":")[0]; // => domain + optional :port
  } catch (err) {
    console.error("getHost() error:", err);
    return null;
  }
}

/**
 * Ambil host lokal dari browser (origin)
 */
export function getCurrentHost() {
  if (typeof window === "undefined") return null;
  return window.location.host; // domain + port
}

export const getHostData = async (domain) => {
  // koneksi ke database
  const connection = await mysql.createConnection(db_config);

  // query data
  const [[row]] = await connection.execute("SELECT * FROM users WHERE domain = ? LIMIT 1", [
    domain,
  ]);

  // tutup koneksi
  await connection.end();

  // respon balik ke client
  return row || {};
};
export const getHostDataFromHeader = async (req) => {
  const headers = Object.fromEntries(req.headers);
  const origin = headers["origin"] || headers["referer"] || "";
  const sourceHost = getHost(origin);

  return await getHostData(sourceHost);
};

export async function safeFetch(url, options = {}, timeout = 2000) {
  const controller = new AbortController();
  const id = setTimeout(() => controller.abort(), timeout);

  try {
    const res = await fetch(url, {
      ...options,
      mode: "no-cors", // ⬅️ penting: bypass browser CORS check
      signal: controller.signal,
    });

    clearTimeout(id);

    // mode: 'no-cors' gak bisa baca response body
    return { ok: res.ok, status: res.status || 200, message: "Request sent" };
  } catch (err) {
    clearTimeout(id);
    console.warn("⚠️ SafeFetch failed:", err.message);
    return { ok: false, error: err.message };
  }
}
