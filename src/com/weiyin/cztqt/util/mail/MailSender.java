package com.weiyin.cztqt.util.mail;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;

import org.apache.log4j.Logger;

import com.weiyin.cztqt.util.PropertiesUtil;

/**
 * 邮件发送器
 * 
 * @author Administrator
 * 
 */
public class MailSender {

	
	private static final Logger logger = Logger.getLogger(MailSender.class);
	
	/**
	 * 以文本形式发送邮件
	 * 
	 * @param mailInfo
	 *            待发邮件信息
	 */
	public static boolean sendMailText(MailSenderInfo mailInfo) {
		MailAuthenticator mailAuthenticator = null;
		Properties p = mailInfo.getProperties();
		// 判断是否需要验证
		if (mailInfo.isValidate()) {
			mailAuthenticator = new MailAuthenticator(mailInfo.getUsername(),
					mailInfo.getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getDefaultInstance(p,
				mailAuthenticator);
//		sendMailSession.setDebug(true);
		try {
			// 根据session创建邮件消息
			Message mailMessage = new MimeMessage(sendMailSession);
			// 创建邮件发送者地址
			Address fromAddress = new InternetAddress(mailInfo.getFromAddress());
			// 设置邮件消息的发送者
			mailMessage.setFrom(fromAddress);
			// 创建邮件的接收者地址，并设置到邮件消息中
			Address toAddress = new InternetAddress(mailInfo.getToAdderss());
			mailMessage.setRecipient(Message.RecipientType.TO, toAddress);
			// 设置邮件消息的主题
			mailMessage.setSubject(MimeUtility.encodeText(mailInfo.getMailSubject()));
			// 设置邮件消息发送的时间
			mailMessage.setSentDate(new Date());
			// 设置邮件消息的主要内容
			mailMessage.setText(mailInfo.getMailContent());
			// 发送邮件
			Transport transport = sendMailSession.getTransport("smtp");
			// 连接服务器的邮箱
			transport.connect(mailInfo.getMailServerHost(), mailInfo
					.getUsername(), mailInfo.getPassword());
			// 把邮件发送出去
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
			return true;
		} catch (Exception e) {
			logger.error("发送邮件失败"+e.getMessage(), e);
		}
		return false;
	}

	/**
	 * 以HTML格式发送邮件
	 * 
	 * @param mailInfo
	 *            待发送的邮件信息
	 */
	public static boolean sendHtmlMail(MailSenderInfo mailInfo) {
		MailAuthenticator mailAuthenticator = null;
		Properties p = mailInfo.getProperties();
		// 判断是否需要验证
		if (mailInfo.isValidate()) {
			mailAuthenticator = new MailAuthenticator(mailInfo.getUsername(),
					mailInfo.getPassword());
		}
		// 根据邮件会话属性和密码验证器构造一个发送邮件的session
		Session sendMailSession = Session.getDefaultInstance(p,
				mailAuthenticator);
		sendMailSession.setDebug(true);
		try {
			Message mailMessage = new MimeMessage(sendMailSession);
			Address fromAddress = new InternetAddress(mailInfo.getFromAddress());
			mailMessage.setFrom(fromAddress);
			Address toAddress = new InternetAddress(mailInfo.getToAdderss());
			mailMessage.setRecipient(Message.RecipientType.TO, toAddress);
			mailMessage.setSubject(MimeUtility.encodeText(mailInfo.getMailSubject()));
			mailMessage.setText(mailInfo.getMailContent());
			mailMessage.setSentDate(new Date());
			Multipart mainPart = new MimeMultipart();
			BodyPart html = new MimeBodyPart();
			html.setContent(mailInfo.getMailContent(),
					"text/html; charset=utf-8");
			mainPart.addBodyPart(html);
			mailMessage.setContent(mainPart);
			Transport transport = sendMailSession.getTransport("smtp");
			transport.connect(mailInfo.getMailServerHost(), mailInfo
					.getUsername(), mailInfo.getPassword());
			transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
			transport.close();
			return true;
		} catch (Exception e) {
			logger.error("发送邮件失败"+e.getMessage(), e);
		}
		return false;
	}

	public static void main(String[] args) throws UnsupportedEncodingException {
		Properties p = PropertiesUtil.getProperties("/config/mail.properties");
		MailSenderInfo mailInfo = new MailSenderInfo();
		mailInfo.setMailServerHost(p.getProperty("smtpHost"));
		mailInfo.setValidate(true);
		mailInfo.setUsername(p.getProperty("userName"));
		mailInfo.setPassword(p.getProperty("password"));
		mailInfo.setFromAddress(MimeUtility.encodeText(p
				.getProperty("nickName"))
				+ "<" + p.getProperty("fromMail") + ">");
		mailInfo.setToAdderss(p.getProperty("toMail"));
		mailInfo.setMailSubject("邮箱主题");
		mailInfo.setMailContent("邮箱内容");
		 MailSender.sendMailText(mailInfo);
//		MailSender.sendHtmlMail(mailInfo);
	}
}
