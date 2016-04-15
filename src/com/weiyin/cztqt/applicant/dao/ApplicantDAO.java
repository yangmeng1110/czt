package com.weiyin.cztqt.applicant.dao;

import java.util.List;
import java.util.Map;

import com.weiyin.cztqt.applicant.model.Applicant;

public interface ApplicantDAO {
	

	/**
	 * 查询未同步贷款申请人保险受理记录
	 * @return
	 */
	public List<Applicant> getAppListBySyncInsuStatus();
	
	/**
	 * 分页查询
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List<Applicant> getAppByPage(Map<String,Object> params);
	/**
	 * 查询所有记录
	 * @return
	 */
	public Long getAppCount(Map<String,Object> params);
	
	/**
	 * 根据唯一标识查看贷款申请人记录
	 * @param id
	 * @return
	 */
	public Applicant getAppById(int id);
	
	/**
	 * 查看未同步的贷款申请人记录
	 * @param id
	 * @return
	 */
	public List<Applicant> getAppListBySyncAppStatus();
	
	/**
	 * 更新贷款申请人记录
	 * @param id
	 */
	public void updateApp(Applicant applicant);
	
	/**
	 * 根据唯一标识更新贷款申请人同步状态
	 * @param id
	 */
	public void updateSyncAppStatusById(int id);
	
	/**
	 * 根据唯一标识更新贷款申请人保险同步状态
	 * @param id
	 */
	public void updateSyncInsuStatusById(int id);
	
	/**
	 * 新增贷款申请人
	 * @param applicant
	 */
	public void saveApp(Applicant applicant);
	
	public void deleteAppById(int id);
	
}
