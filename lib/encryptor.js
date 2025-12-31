import CryptoJS from "crypto-js";
import pako from "pako";
import { getHost } from "./getHost";

const PRIVATE_KEY = process.env.SECRET_KEY || "default-secret-key";

// 🔒 Encrypt plain text or JSON using AES
export const encrypt = async (_key, _type = "text") => {
  const __key = _type === "json" ? JSON.stringify(_key) : String(_key);
  const encrypted = CryptoJS.AES.encrypt(__key, PRIVATE_KEY).toString();
  return encrypted;
};

// 🔓 Decrypt AES string back to text or JSON
export const decrypt = async (_key, _type = "text") => {
  const decrypted = CryptoJS?.AES?.decrypt(_key, PRIVATE_KEY)?.toString(CryptoJS.enc.Utf8);
  return _type === "json" ? JSON?.parse(decrypted) : decrypted;
};

// 🔒 Encrypt plain text or JSON using AES
export const encrypt2 = async (_key, _type = "text", secretKey) => {
  const __key = _type === "json" ? JSON.stringify(_key) : String(_key);
  return CryptoJS.AES.encrypt(__key, secretKey).toString();
};

// 🔓 Decrypt AES string back to text or JSON
export const decrypt2 = async (_key, _type = "text", secretKey) => {
  const decrypted = CryptoJS.AES.decrypt(_key, secretKey).toString(CryptoJS.enc.Utf8);
  return _type === "json" ? JSON.parse(decrypted) : decrypted;
};

// 🧱 AES-256-CBC Encryption
export const encryptAES = (plaintext) => {
  const key = CryptoJS.SHA256(PRIVATE_KEY);
  const iv = CryptoJS.lib.WordArray.random(16);

  const encrypted = CryptoJS.AES.encrypt(plaintext, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });

  return {
    ciphertext: encrypted.ciphertext.toString(CryptoJS.enc.Base64),
    iv: iv.toString(CryptoJS.enc.Hex),
  };
};

// 🧩 AES-256-CBC Decryption
export const decryptAES = (ciphertext, ivHex) => {
  const key = CryptoJS.SHA256(PRIVATE_KEY);
  const iv = CryptoJS.enc.Hex.parse(ivHex);
  const encrypted = CryptoJS.enc.Base64.parse(ciphertext);

  const cipherParams = CryptoJS.lib.CipherParams.create({
    ciphertext: encrypted,
  });

  const decrypted = CryptoJS.AES.decrypt(cipherParams, key, {
    iv,
    mode: CryptoJS.mode.CBC,
    padding: CryptoJS.pad.Pkcs7,
  });

  return decrypted.toString(CryptoJS.enc.Utf8);
};

// 🗜️ Compress state into base64 string
export function compress(state) {
  const saltedState = {
    __salt: PRIVATE_KEY,
    data: state,
  };
  const json = JSON.stringify(saltedState);
  const deflated = pako.deflate(json);
  const base64 = btoa(String.fromCharCode(...deflated));
  return base64;
}

// 💨 Decompress base64 string back into state
export function decompress(base64) {
  try {
    const binaryStr = atob(base64);
    const charData = Uint8Array.from(binaryStr, (c) => c.charCodeAt(0));
    const inflated = pako.inflate(charData, { to: "string" });
    const parsed = JSON.parse(inflated);

    if (parsed.__salt !== PRIVATE_KEY) {
      console.warn("❌ Salt mismatch, decompression aborted.");
      return null;
    }

    return parsed.data;
  } catch (err) {
    console.error("❌ Failed to decompress:", err);
    return null;
  }
}

/**
   === 💥 AUTO GENERATE X-SIGNATURE (AES, secretKey = srcHost) 💥 ===
**/
export async function generateSignature(privateKey, domain, uri) {
  // === BASE DATA ===
  const secretKey = privateKey;
  const srcHost = getHost(domain || "https://dewapulsa.com");
  const path = uri;
  const timestamp = Date.now();

  const payload = { srcHost, path, timestamp };

  const signature = await encrypt2(payload, "json", secretKey);

  return {
    signature: signature,
    timestamp: timestamp,
    origin: domain,
  };
}
