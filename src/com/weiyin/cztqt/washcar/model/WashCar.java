package com.weiyin.cztqt.washcar.model;

import java.util.Date;

public class WashCar {

	private int id;
	private String realName;
	private String userName;
	private String password;
	private String mobile;
	private int qqCode;
	private String carName;
	private String carAddr;
	private String remark;
	private String userType;
	
	private String validateCode;
	private Date outDate;
	

	public String getValidateCode() {
		return validateCode;
	}

	public void setValidateCode(String validateCode) {
		this.validateCode = validateCode;
	}

	public Date getOutDate() {
		return outDate;
	}

	public void setOutDate(Date outDate) {
		this.outDate = outDate;
	}

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

	public int getQqCode() {
		return qqCode;
	}

	public void setQqCode(int qqCode) {
		this.qqCode = qqCode;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public String getCarAddr() {
		return carAddr;
	}

	public void setCarAddr(String carAddr) {
		this.carAddr = carAddr;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}
