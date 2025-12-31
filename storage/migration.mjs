import dotenv from "dotenv";
dotenv.config();

import fs from "fs/promises";
import moment from "moment";
import mysql from "mysql2/promise";
import path from "path";

export const POST = async () => {
  const logsFile = "./storage/logs.json";
  const filesDir = "./storage";

  const config = {
    host:
      process.env.NODE_ENV == "development" ? process.env.DB_HOST_DEV : process.env.DB_HOST_PROD,
    port:
      process.env.NODE_ENV == "development" ? process.env.DB_PORT_DEV : process.env.DB_PORT_PROD,
    user:
      process.env.NODE_ENV == "development" ? process.env.DB_USER_DEV : process.env.DB_USER_PROD,
    password:
      process.env.NODE_ENV == "development" ? process.env.DB_PASS_DEV : process.env.DB_PASS_PROD,
  };

  const database =
    process.env.NODE_ENV == "development" ? process.env.DB_NAME_DEV : process.env.DB_NAME_PROD;
  console.log("Database:", database);

  const connection = await mysql.createConnection(config);

  // Langkah 1: Buat database kalau belum ada
  await connection.query(`CREATE DATABASE IF NOT EXISTS \`${database}\``);
  await connection.query(`USE \`${database}\``);

  // Langkah 2: Pastikan logs.json ada
  try {
    await fs.access(logsFile);
  } catch (err) {
    console.warn("⚠️ logs.json belum ada, bikin baru");
    await fs.writeFile(logsFile, "[]", "utf8");
  }

  let _logs = [];
  try {
    const logs = await fs.readFile(logsFile, "utf8");
    _logs = JSON.parse(logs);
  } catch (err) {
    console.warn("⚠️ logs.json corrupt atau kosong, reset jadi []");
    _logs = [];
    await fs.writeFile(logsFile, "[]", "utf8");
  }

  console.log("✅ Reading file...");

  // 🔑 Ambil semua file .sql beserta modified time
  let filesInDIR = await fs.readdir(filesDir);
  let sqlFiles = [];

  for (const file of filesInDIR) {
    if (path.extname(file) === ".sql") {
      const stat = await fs.stat(path.join(filesDir, file));
      sqlFiles.push({ file, mtime: stat.mtimeMs });
    }
  }

  // Sort descending by modified time
  sqlFiles.sort((a, b) => a.mtime - b.mtime);
  console.log("✅ Sorting file: ", sqlFiles);
  // return;

  for (const { file } of sqlFiles) {
    const isLogged = _logs.some((log) => log?.file === file);
    if (isLogged) continue;

    const _rawSql = await fs.readFile(path.join(filesDir, file), "utf8");
    let cleaned = _rawSql.replace(/^--.*$/gm, ""); // hapus komentar `--`
    cleaned = cleaned.replace(/\/\*[\s\S]*?\*\//g, ""); // hapus komentar blok

    const queries = cleaned
      .split(";")
      .map((q) => q.trim())
      .filter((q) => q.length > 0);

    console.log(`📄 File: ${file}, 📄>> Jumlah query: ${queries.length}`);

    for (const q of queries) {
      try {
        console.log(">> Menjalankan query:", q);
        await connection.query(q);
      } catch (err) {
        console.error(`⚠️ Query failed:\n${q}\n⚠️>> Reason:`, err.message);
      }
    }

    // update logs
    _logs.push({
      file,
      date: moment().format("YYYY-MM-DD HH:mm:ss"),
      status: "success",
    });
    await fs.writeFile(logsFile, JSON.stringify(_logs, null, 2), "utf8");

    console.log(`✅ File ${file} selesai diproses & dicatat di logs.json`);
  }

  // ✅ koneksi ditutup terakhir
  await connection.end();
};

POST()
  .then(() => console.log("✅ Migration success!"))
  .catch((err) => console.error("❌ Migration failed:", err));
