const getSidobeKey = async (waNumber) => {
  const response = await fetch(process.env.NEXTAUTH_URL + "/api/post/get", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      table_name: "users",
      where: {
        wa_number: waNumber,
      },
      response_type: "object",
    }),
  });

  const data = await response.json();
  return data?.data?.api_key;
};

export const sendWaText = async ({ destination, message, waNumber = "" }) => {
  try {
    const response = await fetch("https://api.sidobe.com/wa/v1/send-message", {
      method: "POST",
      headers: {
        "X-Secret-Key": (await getSidobeKey(waNumber)) || "",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        phone: destination,
        message: message,
      }),
    });

    const data = await response.json();
    return data;
  } catch (error) {
    console.error("Error:", error);
  }
};

export const sendWaImage = async ({ destination, message, linkImage, waNumber = "" }) => {
  try {
    const response = await fetch("https://api.sidobe.com/wa/v1/send-message-image", {
      method: "POST",
      headers: {
        "X-Secret-Key": (await getSidobeKey(waNumber)) || "",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        phone: destination,
        message: message,
        image_url: linkImage,
      }),
    });

    const data = await response.json();
    return data;
  } catch (error) {
    console.error("Error:", error);
  }
};

export const sendWaDocs = async ({ destination, message, linkDocs, nameDocs, waNumber = "" }) => {
  try {
    const response = await fetch("https://api.sidobe.com/wa/v1/send-message-doc", {
      method: "POST",
      headers: {
        "X-Secret-Key": (await getSidobeKey(waNumber)) || "",
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        phone: destination,
        message: message,
        document_url: linkDocs,
        document_name: nameDocs,
      }),
    });

    const data = await response.json();
    return data;
  } catch (error) {
    console.error("Error:", error);
  }
};
