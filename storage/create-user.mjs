// create-user.mjs
import "dotenv/config";

import CryptoJS from "crypto-js";
import moment from "moment";
import mysql from "mysql2/promise";
import readline from "readline";

const db_config = {
  host:
    process.env.NODE_ENV == "development" ? process?.env?.DB_HOST_DEV : process?.env?.DB_HOST_PROD, //'58.84.143.251',

  port:
    process.env.NODE_ENV == "development" ? process?.env?.DB_PORT_DEV : process?.env?.DB_PORT_PROD,

  user:
    process.env.NODE_ENV == "development" ? process?.env?.DB_USER_DEV : process?.env?.DB_USER_PROD,

  password:
    process.env.NODE_ENV == "development" ? process?.env?.DB_PASS_DEV : process?.env?.DB_PASS_PROD,

  database:
    process.env.NODE_ENV == "development" ? process?.env?.DB_NAME_DEV : process?.env?.DB_NAME_PROD,
};

// 🔌 Helper umum buat koneksi
const getConn = async () => {
  return await mysql?.createConnection(db_config);
};

// ➕ INSERT data + auto id v7 + balikin row barunya
const insert = async (table, data, single = false) => {
  const conn = await getConn();
  const keys = Object.keys(data);
  const values = Object.values(data);

  // gabung field jadi query
  const placeholders = keys.map(() => "?").join(", ");
  const sql = `INSERT INTO ${table} (${keys.join(", ")}) VALUES (${placeholders})`;

  await conn.execute(sql, [...values]);

  // ambil data baru
  const [rows] = await conn.execute(`SELECT * FROM ${table} ORDER BY id DESC`);
  await conn.end();
  return single ? rows[0] || null : rows;
};

// 🔒 Encrypt plain text or JSON using AES
export const encrypt = async (_key, _type = "text") => {
  const __key = _type === "json" ? JSON.stringify(_key) : String(_key);
  const encrypted = CryptoJS.AES.encrypt(
    __key,
    process.env.SECRET_KEY || "default-secret-key"
  ).toString();
  return encrypted;
};

// CLI input
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function ask(q) {
  return new Promise((resolve) => rl.question(q, resolve));
}

(async () => {
  try {
    console.log("=== Create Super Admin User ===");

    const name = await ask("Nama Lengkap: ");
    const email = await ask("Email: ");
    const passwordRaw = await ask("Password: ");
    const wa_number = await ask("No WA (angka saja, optional): ");
    const api_key = await ask("Sidobe API Key (optional): ");

    const password = await encrypt(passwordRaw);
    const now = moment().format("YYYY-MM-DD HH:mm:ss");

    const values = {
      name,
      email,
      password,
      role: "super_admin",

      wa_number: wa_number || null,
      api_key: api_key || null,

      email_verified_at: now,
      created_at: now,
      updated_at: now,
    };

    console.log("\n📦 Data yang dikirim:", values);

    const response = await insert("users", values, true);

    response.password_unencrypted = passwordRaw;

    const data = response;
    console.log("✅ Response:", data);
  } catch (err) {
    console.error("❌ Error:", err);
  } finally {
    rl.close();
  }
})();
