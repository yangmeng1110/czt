package com.weiyin.cztqt.util.pdf;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStreamReader;

import com.itextpdf.text.Document;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

public class XX {
	public static void main(String[] args) throws Exception {
		   Document document = new Document(PageSize.A4);
	       PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream("D:/text.pdf"));
	       pdfWriter.setViewerPreferences(PdfWriter.ALLOW_FILL_IN);
	       document.open();
	       InputStreamReader isr = new InputStreamReader(new FileInputStream("D:/车掌通/data2.html"),"utf-8");
	        XMLWorkerHelper.getInstance().parseXHtml(pdfWriter, document, isr);
	        document.close();
	}
}
