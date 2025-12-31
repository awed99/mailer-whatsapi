import fs from "fs";
import path from "path";

export async function GET(req, { params }) {
  const { filename } = await params;
  const filePath = path.join(process.cwd(), "storage/uploads", filename);

  if (!fs.existsSync(filePath)) {
    return new Response("File not found", { status: 404 });
  }

  const fileBuffer = fs.readFileSync(filePath);

  const ext = filename.split(".").pop().toLowerCase();
  const mime =
    ext === "png"
      ? "image/png"
      : ext === "jpg" || ext === "jpeg"
        ? "image/jpeg"
        : ext === "webp"
          ? "image/webp"
          : ext === "gif"
            ? "image/gif"
            : ext === "bmp"
              ? "image/bmp"
              : ext === "svg"
                ? "image/svg+xml"
                : ext === "ico" || ext === "cur"
                  ? "image/x-icon"
                  : "application/octet-stream";

  return new Response(fileBuffer, {
    status: 200,
    headers: {
      "Content-Type": mime,
      "Cache-Control": "public, max-age=31536000",
    },
  });
}
