export default function otpTemplate(otp) {
  return `<!DOCTYPE html>
<html lang="id">
  <head>
    <meta charset="UTF-8" />
    <title>OTP - ${otp}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f5f5f5;
        margin: 0;
        padding: 0;
      }
      .email-container {
        max-width: 480px;
        margin: auto;
        background: #ffffff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      }
      .header {
        background-color: #764ba2;
        color: white;
        text-align: center;
        padding: 20px 0;
      }
      .header h2 {
        margin: 0;
        font-size: 20px;
      }
      .content {
        padding: 24px;
        text-align: center;
      }
      .otp-box {
        font-size: 32px;
        font-weight: bold;
        letter-spacing: 6px;
        margin: 20px auto;
        padding: 16px;
        background: #f3f3f3;
        border-radius: 10px;
        width: fit-content;
      }
      .info {
        margin-top: 10px;
        font-size: 14px;
        color: #555;
      }
      .footer {
        font-size: 12px;
        color: #999;
        padding: 20px;
        text-align: center;
      }
      .brand {
        font-weight: bold;
        color: #333;
      }
    </style>
  </head>
  <body>
    <div class="email-container">
      <div class="header">
        <h2>WhatsAPI.io</h2>
        <div style="font-size: 14px;">Verifikasi Kode OTP</div>
      </div>
      <div class="content">
        <p>Halo,</p>
        <p>Gunakan kode berikut untuk melanjutkan verifikasi akun Anda:</p>
        <div class="otp-box"><b>${otp}</b></div>
        <p class="info">Kode ini berlaku selama <strong>5 menit</strong>.</p>
        <p class="info">Jangan berikan kode ini kepada siapa pun, termasuk pihak yang mengaku dari WhatsAPI.io.</p>
      </div>
      <div class="footer">
        Terima kasih telah menggunakan layanan <span class="brand">WhatsAPI.io</span><br />
        https://WhatsAPI.io/
      </div>
    </div>
  </body>
</html>
    `;
}
