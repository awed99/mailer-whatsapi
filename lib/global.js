import CryptoJS from "crypto-js";
// import ModalNotif from "../components/Custom/modal-notif";

export const detectProvider = (nomor) => {
  const operatorDict = {
    "0813": "Telkomsel",
    "0812": "Telkomsel",
    "0811": "Telkomsel",
    "0852": "Telkomsel",
    "0853": "Telkomsel",
    "0855": "Telkomsel",
    "0821": "Telkomsel",
    "0822": "Telkomsel",
    "0823": "Telkomsel",
    "0851": "by.u",
    "0817": "XL",
    "0818": "XL",
    "0819": "XL",
    "0859": "XL",
    "0878": "XL",
    "0877": "XL",
    "0814": "Indosat",
    "0815": "Indosat",
    "0816": "Indosat",
    "0856": "Indosat",
    "0857": "Indosat",
    "0858": "Indosat",
    "0881": "Smartfren",
    "0882": "Smartfren",
    "0883": "Smartfren",
    "0884": "Smartfren",
    "0885": "Smartfren",
    "0893": "Three",
    "0894": "Three",
    "0895": "Three",
    "0896": "Three",
    "0897": "Three",
    "0898": "Three",
    "0899": "Three",
    "0831": "Axis",
    "0838": "Axis",
    "0839": "Axis",
    "0832": "Axis",
    "0833": "Axis",
    "0834": "Axis",
    "0835": "Axis",
    "0836": "Axis",
    "0837": "Axis",
  };

  nomor = nomor.replace(/\s+/g, "").replace(/-/g, "");

  if (!/^\d+$/.test(nomor) || nomor.length < 10) {
    return false;
  }

  for (const kode in operatorDict) {
    if (nomor.startsWith(kode)) {
      return operatorDict[kode];
    }
  }

  return false;
};

export const randomString = (length, _type = "alphanumeric") => {
  let chars = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  if (_type === "numeric") {
    chars = "0123456789";
  } else if (_type === "alpha") {
    chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  }

  let result = "";
  for (let i = length; i > 0; --i) {
    result += chars[Math.floor(Math.random() * chars.length)];
  }

  return result;
};

export const formatCurrency = (_amount, _decimal = 2) => {
  const amount = parseFloat(_amount);
  if (isNaN(amount)) return "Rp 0";

  return new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
    minimumFractionDigits: _decimal,
    maximumFractionDigits: _decimal,
  })
    .format(amount)
    .replace("IDR", "Rp");
};

export function compactFormat(value) {
  const formatter = new Intl.NumberFormat("id-ID", {
    notation: "compact",
    compactDisplay: "short",
  });
  return formatter.format(value);
}

export function standardFormat(value) {
  return value.toLocaleString("id-ID", {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  });
}

export const formatPhoneNumber = (number) => {
  return number?.match(/.{1,4}/g)?.join(" ") || "";
};

export const base64Encode = (myString) => {
  const encodedWord = CryptoJS.enc.Utf8.parse(myString);
  return CryptoJS.enc.Base64.stringify(encodedWord);
};

export const base64Decode = (encoded) => {
  const encodedWord = CryptoJS.enc.Base64.parse(encoded);
  return CryptoJS.enc.Utf8.stringify(encodedWord);
};

// export const notification = (
//   type = "success",
//   message = "",
// ) => {
//   return <ModalNotif type={type} message={message} />;
// };

export const formatMobileNo = (rawNumber) => {
  if (!rawNumber) return "";

  let digits = rawNumber.toString().replace(/\D/g, "");

  if (digits.startsWith("0")) {
    digits = "62" + digits.slice(1);
  } else if (!digits.startsWith("62")) {
    digits = "62" + digits;
  }

  return "+" + digits;
};

export const validatePassword = (pw, { minLength = 12, banned = [], userHints = [] } = {}) => {
  const issues = [];
  if (!pw || pw.length === 0)
    return {
      score: 0,
      level: "empty",
      issues: ["Password belum diisi"],
      percent: 0,
    };

  // aturan dasar
  if (pw.length < minLength) issues.push(`Minimal ${minLength} karakter`);
  if (!/[a-z]/.test(pw)) issues.push("Harus ada huruf kecil (a–z)");
  if (!/[A-Z]/.test(pw)) issues.push("Harus ada huruf besar (A–Z)");
  if (!/[0-9]/.test(pw)) issues.push("Harus ada angka (0–9)");
  if (!/[^A-Za-z0-9\s]/.test(pw)) issues.push("Harus ada simbol (!@#$% dsb.)");
  if (/\s/.test(pw)) issues.push("Tidak boleh ada spasi");

  // pola lemah umum
  const weakPatterns = [
    "password",
    "qwerty",
    "admin",
    "letmein",
    "welcome",
    "iloveyou",
    "abc123",
    "123456",
    "654321",
  ];
  const lowered = pw.toLowerCase();
  if (weakPatterns.some((w) => lowered.includes(w)))
    issues.push("Hindari kata sandi umum (mis. 'password', '123456')");

  // hindari info user (email/username/nama)
  userHints
    .filter(Boolean)
    .map((s) => String(s).toLowerCase())
    .forEach((h) => {
      if (h.length >= 3 && lowered.includes(h))
        issues.push("Jangan pakai nama/email/username di password");
    });

  // hindari kata dilarang custom
  banned
    .filter(Boolean)
    .map((s) => String(s).toLowerCase())
    .forEach((b) => {
      if (b.length >= 3 && lowered.includes(b)) issues.push("Mengandung kata yang dilarang");
    });

  // deteksi repetisi
  if (/(.)\1{2,}/.test(pw)) issues.push("Hindari pengulangan karakter beruntun (aaa, 111, !!!)");
  if (/([A-Za-z]{3,})\1/.test(lowered)) issues.push("Hindari pengulangan kata/pola");

  // hitung skor
  const checks = [
    pw.length >= minLength,
    /[a-z]/.test(pw),
    /[A-Z]/.test(pw),
    /[0-9]/.test(pw),
    /[^A-Za-z0-9\s]/.test(pw),
  ];
  let score = checks.reduce((a, ok) => a + (ok ? 1 : 0), 0);

  if (issues.length >= 2) score = Math.max(0, score - 1);

  const mapLevel = (s) => {
    if (s <= 1) return "very-weak";
    if (s === 2) return "weak";
    if (s === 3) return "fair";
    if (s === 4) return "strong";
    return "very-strong";
  };

  const level = mapLevel(score);
  const percent = Math.min(100, Math.max(0, score * 20 + (pw.length >= minLength + 4 ? 10 : 0)));

  return { score, level, issues, percent };
};

export const safeJSONParse = (value) => {
  try {
    if (!value) return [];
    if (typeof value === "object") return value; // udah object, langsung pakai
    return JSON.parse(value); // string → parse
  } catch (err) {
    console.error("JSON parse error:", err);
    return [];
  }
};
