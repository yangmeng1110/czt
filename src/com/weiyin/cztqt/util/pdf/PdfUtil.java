package com.weiyin.cztqt.util.pdf;

import java.io.FileOutputStream;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

public class PdfUtil {

	public static void main(String[] args) {
		Document document = new Document(PageSize.A4, 36.0F, 36.0F, 36.0F,36.0F);
		try {
			BaseFont baseFont =  BaseFont.createFont("STSong-Light","UniGB-UCS2-H",BaseFont.NOT_EMBEDDED);  
			Font btFont = new Font(baseFont,20,Font.NORMAL);
			Font nrFont = new Font(baseFont,15,Font.NORMAL);
			PdfWriter.getInstance(document, new FileOutputStream("D:/text.pdf"));
			document.open();
			Paragraph pTitle = new Paragraph("第一个pdf",btFont);
			pTitle.setAlignment(pTitle.ALIGN_CENTER);
			document.add(pTitle);
			PdfPTable table = new PdfPTable(3);
			table.setSpacingBefore(5f);
			//设置表格具体宽度
	        table.setTotalWidth(90);
	        //设置每一列所占的长度
	        table.addCell(new PdfPCell(new Phrase("xx")));
	        table.addCell(new PdfPCell(new Phrase("無幽之路IText教程",nrFont)));
	        table.addCell(new PdfPCell(new Phrase("無幽之路IText教程",nrFont)));
	        document.add(table);
			document.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
