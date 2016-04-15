package com.weiyin.cztqt.util.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
/**
 * 判断是否需要身份验证
 * @author Administrator
 *
 */
public class MailAuthenticator extends Authenticator {

	String username = null;
	String password = null;
	public MailAuthenticator() {
	}
	public MailAuthenticator(String username, String password) {
		this.username = username;
		this.password = password;
	}
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return super.getPasswordAuthentication();
	}
	
	
	
}
