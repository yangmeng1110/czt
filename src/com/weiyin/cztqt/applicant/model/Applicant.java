package com.weiyin.cztqt.applicant.model;

import java.util.Date;

public class Applicant {

	private int id;
	private String realName;
	private String mobile;
	private String carCode;
	/**
	 * 申请人状态
	 */
	private int status;
	/**
	 * 推荐人
	 */
	private String referees;
	/**
	 * 操作时间
	 */
	private Date operTime;
	/**
	 * 放款金额
	 */
	private int loanMoney;
	/**
	 * 返点金额
	 */
	private double rebateMoney;

	private String remark;

	/**
	 * 保险受理状态
	 */
	private int insuStatus;

	/**
	 * 保险受理详情
	 */
	private String insuRemark;
	
	/**
	 * 数据是否同步后台状态
	 */
	private int syncAppStatus;
	
	/**
	 * 保险状态是否同步后天
	 */
	private int syncInsuStatus;

	public int getSyncAppStatus() {
		return syncAppStatus;
	}

	public void setSyncAppStatus(int syncAppStatus) {
		this.syncAppStatus = syncAppStatus;
	}

	public int getSyncInsuStatus() {
		return syncInsuStatus;
	}

	public void setSyncInsuStatus(int syncInsuStatus) {
		this.syncInsuStatus = syncInsuStatus;
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

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCarCode() {
		return carCode;
	}

	public void setCarCode(String carCode) {
		this.carCode = carCode;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getReferees() {
		return referees;
	}

	public void setReferees(String referees) {
		this.referees = referees;
	}

	public Date getOperTime() {
		return operTime;
	}

	public void setOperTime(Date operTime) {
		this.operTime = operTime;
	}

	public int getLoanMoney() {
		return loanMoney;
	}

	public void setLoanMoney(int loanMoney) {
		this.loanMoney = loanMoney;
	}

	public double getRebateMoney() {
		return rebateMoney;
	}

	public void setRebateMoney(double rebateMoney) {
		this.rebateMoney = rebateMoney;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public int getInsuStatus() {
		return insuStatus;
	}

	public void setInsuStatus(int insuStatus) {
		this.insuStatus = insuStatus;
	}

	public String getInsuRemark() {
		return insuRemark;
	}

	public void setInsuRemark(String insuRemark) {
		this.insuRemark = insuRemark;
	}

}
