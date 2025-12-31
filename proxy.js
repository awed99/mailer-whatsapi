import { decrypt } from "@/lib/encryptor";
import moment from "moment";
import { NextResponse } from "next/server";

export default async function proxy(request) {
  const url = new URL(request.url);

  // 🚫 REDIRECT GET KE LANDING PAGE
  if (request.method === "GET") {
    return NextResponse.redirect(
      "https://whatsapi.io",
      307
    );
  }

  const signature = request.headers.get("x-signature");

  if (!signature) {
    return NextResponse.json(
      { success: false, reason: "missing signature" },
      { status: 401 }
    );
  }

  let decryptedText;
  try {
    decryptedText = await decrypt(signature);
  } catch {
    return NextResponse.json(
      { success: false, reason: "signature not valid" },
      { status: 401 }
    );
  }

  if (Math.abs(moment().diff(moment(decryptedText), "seconds")) > 5) {
    return NextResponse.json(
      { success: false, reason: "signature expired" },
      { status: 401 }
    );
  }

  const res = NextResponse.next();
  res.headers.set("x-pathname", url.pathname);

  return res;
}

export const config = {
  matcher: "/:path*",
};
