import "server-only";

import mysql from "mysql2/promise";
import db_config from "./db_config";

// 🔌 Helper umum buat koneksi
async function getConn() {
  return await mysql?.createConnection(db_config);
}

// 🧭 QUERY umum (bisa ambil 1 data atau banyak)
export async function query(table, where = "", params = [], single = false, orderBy = "") {
  const conn = await getConn();
  let sql = `SELECT * FROM ${table}`;
  if (where) sql += ` WHERE ${where}`;
  if (!single && !sql.toLowerCase().includes("limit")) sql += " " + orderBy + " LIMIT 1000"; // batas aman default

  const [rows] = await conn.execute(sql, params);
  await conn.end();
  return single ? rows[0] || null : rows;
}

// ➕ INSERT data + auto id v7 + balikin row barunya
export async function insert(table, data, single = false) {
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
}

// ✏️ UPDATE data + balikin row terupdate
export async function update(table, data, keyField = "id", keyValue = 1, single = false) {
  const conn = await getConn();

  const setClause = Object.keys(data)
    .map((k) => `${k} = ?`)
    .join(", ");

  const values = Object.values(data);
  const sql = `UPDATE ${table} SET ${setClause} WHERE ${keyField} = ?`;
  await conn.execute(sql, [...values, keyValue]);

  // ambil data baru
  const [rows] = await conn.execute(`SELECT * FROM ${table}  ORDER BY id DESC`);
  const [[row]] = await conn.execute(`SELECT * FROM ${table} WHERE ${keyField} = ? LIMIT 1`, [
    keyValue,
  ]);
  await conn.end();
  return single ? row || {} : rows;
}

// ❌ DELETE data + balikan row terakhir sebelum delete
export async function remove(table, keyField = "id", keyValue) {
  const conn = await getConn();

  // console.log(">> Query : ", `SELECT * FROM ${table} WHERE ${keyField} = ? LIMIT 1`, keyValue);
  await conn.execute(`DELETE FROM ${table} WHERE ${keyField} = ?`, [keyValue]);
  const [before] = await conn.execute(
    `SELECT * FROM ${table} order by ${keyField} DESC LIMIT 1000`
  );

  await conn.end();
  return before || { deleted: true, [keyField]: keyValue };
}

/*

⚡ Contoh pemakaian di API route
import { insert, update, remove, query } from "@/lib/db";

export const POST = async (req) => {
  const body = await req.json();
  const result = await insert("users", {
    name: body.name,
    email: body.email,
  });
  return Response.json({ msg: "✅ User added", result });
};

export const PUT = async (req) => {
  const body = await req.json();
  const result = await update("users", {
    name: body.name,
    email: body.email,
  }, "id", body.id);
  return Response.json({ msg: "✏️ User updated", result });
};

export const DELETE = async (req) => {
  const body = await req.json();
  const result = await remove("users", "id", body.id);
  return Response.json({ msg: "🗑️ User deleted", result });
};

// 📦 ambil semua data
export const GET = async () => {
  const users = await query("users"); // default ambil semua (limit 1000)
  return Response.json({ msg: "All users", data: users });
};

🔍 Contoh query fleksibel
// Ambil 1 data user by email
const user = await query("users", "email = ?", ["danu@gmail.com"], true);

// Ambil semua user aktif
const allActive = await query("users", "status = ?", ["active"]);

✅ 1️⃣ Contoh pemakaian multi-where
// ambil semua user aktif dengan role admin
const users = await query(
  "users",
  ["status = ?", "role = ?"],        // bisa array kondisi
  ["active", "admin"]                // value-nya urut sesuai posisi
);

atau kalau cuma satu kondisi:

const user = await query("users", "email = ?", ["danu@gmail.com"], true);

✅ 2️⃣ Implementasi fungsi query() fleksibel

Pastikan di /lib/db.js kamu ubah ke versi ini:

export async function query(table, where = "", values = [], single = false, limit = 1000) {
  const conn = await getConn();

  let sql = `SELECT * FROM ${table}`;
  let params = [];

  // 🧩 handle multi kondisi (array)
  if (Array.isArray(where) && where.length > 0) {
    sql += ` WHERE ` + where.join(" AND ");
    params = values;
  } else if (typeof where === "string" && where.trim() !== "") {
    sql += ` WHERE ${where}`;
    params = values;
  }

  if (!single) sql += ` LIMIT ${limit}`;

  const [rows] = await conn.execute(sql, params);
  await conn.end();

  if (single) return rows[0] || null;
  return rows;
}

✅ 3️⃣ Contoh hasil real
// Ambil semua user aktif role "admin"
const data = await query("users", ["status = ?", "role = ?"], ["active", "admin"]);
console.log(data);

// Ambil 1 user by email
const single = await query("users", "email = ?", ["danu@gmail.com"], true);
console.log(single);

*/
