package com.weiyin.cztqt.util.mail;

import java.util.Properties;

/**
 * 发送邮件使用的基本类
 * @author Administrator
 *
 */
public class MailSenderInfo {

	private String mailServerHost;
	private String mailServerPort="25";
	private String fromAddress;
	private String toAdderss;
	private String username;
	private String password;
	private boolean validate = false;
	private String mailSubject;//邮件主题
	private String mailContent;//邮件内容
    private String[] attachFileNames;	// 邮件附件的文件名   
    
    public  Properties getProperties(){
    	Properties p = new Properties();
    	p.put("mail.smtp.host", this.mailServerHost);   
        p.put("mail.smtp.port", this.mailServerPort);   
        p.put("mail.smtp.auth", validate ? "true" : "false");
    	return p;
    }

	public String getMailServerHost() {
		return mailServerHost;
	}

	public void setMailServerHost(String mailServerHost) {
		this.mailServerHost = mailServerHost;
	}

	public String getMailServerPort() {
		return mailServerPort;
	}

	public void setMailServerPort(String mailServerPort) {
		this.mailServerPort = mailServerPort;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public String getToAdderss() {
		return toAdderss;
	}

	public void setToAdderss(String toAdderss) {
		this.toAdderss = toAdderss;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isValidate() {
		return validate;
	}

	public void setValidate(boolean validate) {
		this.validate = validate;
	}

	public String getMailSubject() {
		return mailSubject;
	}

	public void setMailSubject(String mailSubject) {
		this.mailSubject = mailSubject;
	}

	public String getMailContent() {
		return mailContent;
	}

	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}

	public String[] getAttachFileNames() {
		return attachFileNames;
	}

	public void setAttachFileNames(String[] attachFileNames) {
		this.attachFileNames = attachFileNames;
	}
    
    
}
