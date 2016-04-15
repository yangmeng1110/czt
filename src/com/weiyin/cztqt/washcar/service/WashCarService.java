package com.weiyin.cztqt.washcar.service;

import com.weiyin.cztqt.washcar.model.WashCar;

public interface WashCarService {
	

	/**
	 * 根据用户名获取洗车店对象
	 * 
	 * @param userName
	 * @return
	 */
	public WashCar getWashCarByUname(String userName);

	
	public Integer saveWashCar(WashCar washCar);
	
	/**
	 * 更新洗车店数据
	 * @param washCar
	 */
	public void updateWashCar(WashCar washCar);


}
