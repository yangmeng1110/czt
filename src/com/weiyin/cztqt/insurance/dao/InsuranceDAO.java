package com.weiyin.cztqt.insurance.dao;

import java.util.List;

import com.weiyin.cztqt.insurance.model.Insurance;

public interface InsuranceDAO {
	
	/**
	 * 根据唯一标识获取持久化对象
	 * @param id
	 * @return
	 */
	public Insurance getInsuranceById(int id);
	
	/**
	 * 保存数据
	 * @param insurance
	 */
	public Integer saveInsurance(Insurance insurance);
	
	/**
	 * 更新持久对象
	 * @param insurance
	 */
	public void updateInsurance(Insurance insurance);
	
	/**
	 * 根据userName查询出持久化对象
	 * @param userName
	 * @return
	 */
	public Insurance getInsuranceByUname(String userName);
	
}
