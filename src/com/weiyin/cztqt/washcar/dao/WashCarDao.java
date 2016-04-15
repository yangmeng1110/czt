package com.weiyin.cztqt.washcar.dao;

import com.weiyin.cztqt.washcar.model.WashCar;

public interface WashCarDao {

	/**
	 * 根据用户名查询洗车店对象
	 * @param userName
	 * @return
	 */
	public WashCar getWashCarByUname(String userName);

	/**
	 * 增加洗车店对象
	 * 
	 * @param washCar
	 */
	public Integer saveWashCar(WashCar washCar);
	
	/**
	 * 更新洗车店数据
	 * @param washCar
	 */
	public void updateWashCar(WashCar washCar);

}
