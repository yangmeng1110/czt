package com.weiyin.cztqt.insurance.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 保险公司
 * 
 * @author Administrator
 * 
 */
public class Insurance implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int id;

	/**
	 * 姓名
	 */
	private String realName;

	/**
	 * 用户名
	 */
	private String userName;
	private String password;
	private String mobile;
	/**
	 * 保险公司名称
	 */
	private String insuName;
	/**
	 * 保险公司地址
	 */
	private String insuAddr;
	/**
	 * 保险公司简介
	 */
	private String remark;
	private String userType;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getInsuName() {
		return insuName;
	}

	public void setInsuName(String insuName) {
		this.insuName = insuName;
	}

	public String getInsuAddr() {
		return insuAddr;
	}

	public void setInsuAddr(String insuAddr) {
		this.insuAddr = insuAddr;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
