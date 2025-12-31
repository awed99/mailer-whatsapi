"use server";

import "server-only";

import { update } from "@/lib/db";
import { sendEmail } from "./email-sender";
import { encrypt } from "./encryptor";

// =========================
// SIMPLE IN-MEMORY STORE
// =========================
if (!globalThis.__otpStore) {
  globalThis.__otpStore = new Map();
}

const OTP_EXPIRES = 5 * 60 * 1000; // 5 menit

// =========================
// 1. SEND OTP EMAIL
// =========================
export async function sendOtpEmail(email) {
  try {
    // generate OTP 6 digit
    const otp = Math.floor(100000 + Math.random() * 900000).toString();

    // simpan ke memory
    globalThis.__otpStore.set(email, {
      otp,
      expires: Date.now() + OTP_EXPIRES,
    });

    // EMAIL TEMPLATE
    const htmlMessage = `
      <div style="max-width:480px;margin:auto;padding:20px;border-radius:12px;
        background:#ffffff;color:#333;font-family:'Arial';border:1px solid #eee">

        <h2 style="text-align:center;color:#4A8CFF;margin-top:0">
          🔐 OTP Code Verification – WhastAPI
        </h2>

        <p style="font-size:15px">
          You have requested to OTP Code Verification.
          Please use the OTP code below to continue the process:
        </p>

        <div style="
          text-align:center;
          font-size:32px;
          letter-spacing:8px;
          font-weight:bold;
          color:#4A8CFF;
          margin:28px 0;">
          ${otp}
        </div>

        <p style="font-size:14px;color:#555">
          This code is valid for <b>5 minutes</b>.
          If you did not request a password reset, please ignore this email.
        </p>

        <hr style="margin:24px 0;border:none;border-top:1px solid #eee" />

        <p style="font-size:12px;text-align:center;color:#888">
          © ${new Date().getFullYear()} WhastAPI Mailer System
        </p>
      </div>
    `;

    // send email
    const res = await sendEmail({
      emailDestination: email,
      subject: "WhastAPI — OTP Code Verification",
      message: htmlMessage,
    });

    return res.success;
  } catch (err) {
    console.error("sendOtpEmail error:", err);
    return false;
  }
}

// =========================
// 2. VERIFY OTP
// =========================
export async function verifyOtpCode(email, otp) {
  const data = globalThis.__otpStore.get(email);

  if (!data) return false;

  // expired
  if (Date.now() > data.expires) {
    globalThis.__otpStore.delete(email);
    return false;
  }

  if (data.otp !== otp) return false;

  // OTP benar → hapus supaya tidak bisa dipakai dua kali
  globalThis.__otpStore.delete(email);

  return true;
}

// =========================
// 3. UPDATE USER PASSWORD
// =========================
export async function updateUserPassword(email, newPassword) {
  try {
    // contoh mock (hapus dan ganti nanti)
    const hashedPass = await encrypt(newPassword);

    await update("users", { password: hashedPass }, "email", email, true);

    // console.log("Password updated for:", email);
    // console.log("New hashed pass:", hashedPass);

    // TODO — implement DB update real di sini

    return true;
  } catch (err) {
    console.error("updateUserPassword error:", err);
    return false;
  }
}
