"use server";

import nodemailer from "nodemailer";
import { query } from "./db";

export const sendEmail = async ({ emailDestination = null, subject = "", message = "" }) => {
  // const dbConfig = await query("users", "id = ?", [1], true);
    const smtpList = await query(
    "users",
    "1 = ?",
    [1]
  );

  if (!smtpList || smtpList.length === 0) {
    return { success: false, error: "No SMTP config available" };
  }

  // 🎯 RANDOM PICK
  const dbConfig = smtpList[Math.floor(Math.random() * smtpList.length)];

  // Ambil config dari database
  const smtpName = dbConfig?.smtp_name;
  const smtpUser = dbConfig?.smtp_user;
  const smtpPass = dbConfig?.smtp_pass;
  const smtpDest = emailDestination || dbConfig?.smtp_dest;

  const smtpHost = dbConfig?.smtp_host || null;
  const smtpPort = dbConfig?.smtp_port || null;
  const smtpSecure = dbConfig?.smtp_secure === 1 || dbConfig?.smtp_secure === "1";

  // Validasi config utama
  if (!smtpUser || !smtpPass) {
    console.error("[sendEmail] SMTP config missing");
    return { success: false, error: "SMTP config missing" };
  }

  if (!smtpDest || !subject || !message) {
    console.error("[sendEmail] Missing email input");
    return { success: false, error: "Missing email input fields" };
  }

  // ==== AUTO-DETECT GMAIL ====
  const isGmail = smtpUser.endsWith("@gmail.com") || smtpUser.endsWith("@googlemail.com");

  let transporterConfig = {};

  if (isGmail) {
    // Gmail mode
    // transporterConfig = {
    //   service: "gmail",
    //   auth: {
    //     user: smtpUser,
    //     pass: smtpPass,
    //   },
    // };
    transporterConfig = {
      host: "smtp.gmail.com",
      port: 587,
      secure: false,
      auth: { user: smtpUser, pass: smtpPass },
      requireTLS: true,
      dns: { family: 4 },
      connectionTimeout: 20000,
      greetingTimeout: 20000,
      socketTimeout: 20000,
    };
  } else {
    // Custom SMTP mode
    if (!smtpHost || !smtpPort) {
      return {
        success: false,
        error: "Custom SMTP requires smtp_host and smtp_port in database",
      };
    }

    transporterConfig = {
      host: smtpHost,
      port: Number(smtpPort),
      secure: Boolean(smtpSecure),
      dns: { family: 4 },
      auth: {
        user: smtpUser,
        pass: smtpPass,
      },
      connectionTimeout: 20000,
      greetingTimeout: 20000,
      socketTimeout: 20000,
    };
  }

  // Create transporter
  let transporter;
  try {
    transporter = nodemailer.createTransport(transporterConfig);
  } catch (error) {
    console.error("[sendEmail] Failed to create transporter", error);
    return { success: false, error: error.message };
  }

  // Email data
  const mailOptions = {
    from: `${smtpName} <${smtpUser}>`,
    to: smtpDest,
    subject,
    html: `<div style="font-family:Arial,sans-serif;font-size:14px">${message}</div>`,
  };

  // Send
  try {
    const info = await transporter.sendMail(mailOptions);
    console.log("[sendEmail] Email sent:", info.response);
    return { success: true };
  } catch (error) {
    console.error("[sendEmail] Error sending email:", error);
    return { success: false, error: error.message || "Unknown error" };
  }
};
