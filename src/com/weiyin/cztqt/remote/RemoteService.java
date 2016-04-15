package com.weiyin.cztqt.remote;

/**
 * 远程服务接口
 * @author Administrator
 *
 */
public interface RemoteService {

	/**
	 * 添加洗车店数据
	 * @param xmlText
	 * @return
	 */
	public Integer saveWashCar(String xmlText);
	
	/**
	 * 添加申请人数据到后台
	 * @return
	 */
	public String saveApplicant();
	
	/**
	 * 添加保险公司数据
	 * @param xmlText
	 * @return
	 */
	public Integer saveInsurance(String xmlText);
	
	/**
	 * 同步申请人的状态
	 */
	
	public String syncApplicant(String xmlText);
}
