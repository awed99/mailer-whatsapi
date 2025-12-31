import { sendEmail } from "@/lib/email-sender";
import { NextResponse } from "next/server";

export async function POST(req) {
  try {
    const body = await req.json();
    const { emailDestination, subject, message } = body;

    if (!emailDestination || !subject || !message) {
      return NextResponse.json(
        {
          success: false,
          message: "emailDestination, subject, message required",
        },
        { status: 400 }
      );
    }

    const res = await sendEmail({
      emailDestination,
      subject,
      message,
    });

    // console.log(">> MAILER API RESPONSE:", res);

    return NextResponse.json({
      success: true,
      message: "Email sent successfully",
    });
  } catch (err) {
    console.error("MAILER API ERROR:", err);

    return NextResponse.json(
      {
        success: false,
        message: err.message || "Failed to send email",
      },
      { status: 500 }
    );
  }
}
