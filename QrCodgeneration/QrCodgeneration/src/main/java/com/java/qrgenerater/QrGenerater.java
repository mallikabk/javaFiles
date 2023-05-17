package com.java.qrgenerater;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.java.entity.Student;

public class QrGenerater {

	public static void generateQRCode(Student student) throws WriterException, IOException {
		String file = "C:/qr_code/";
		//C:\Users\vk22156\Desktop\Qr_code
		String codename = file+student.getName() + student.getId() + "-QRCODE.png";
		var qrcodewriter = new QRCodeWriter();
		BitMatrix bitMatrix = qrcodewriter.encode("ID  " + student.getId() + "\n" + "Firstname " + student.getName()
				+ "\n" + "Email id : " + student.getEmail() + "\n" + student.getMobile(),BarcodeFormat.QR_CODE ,400 ,400);
Path path = FileSystems.getDefault().getPath(codename);
MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
	}
}
