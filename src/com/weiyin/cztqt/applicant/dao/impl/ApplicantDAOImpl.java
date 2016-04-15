package com.weiyin.cztqt.applicant.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weiyin.cztqt.applicant.dao.ApplicantDAO;
import com.weiyin.cztqt.applicant.model.Applicant;
import com.weiyin.cztqt.remote.impl.RemoteServiceImpl;

@Repository
public class ApplicantDAOImpl implements ApplicantDAO {

	Logger log = Logger.getLogger(RemoteServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	


	@Override
	public Applicant getAppById(int id) {
		return sqlSessionTemplate.selectOne("getAppById", id);
	}

	@Override
	public void saveApp(Applicant applicant) {
		sqlSessionTemplate.insert("saveApp", applicant);
	}

	@Override
	public void updateApp(Applicant applicant) {
		sqlSessionTemplate.update("updateApp", applicant);
	}

	@Override
	public List<Applicant> getAppListBySyncInsuStatus() {
		return sqlSessionTemplate.selectList("getAppBySyncInsuStatus");
	}

	@Override
	public List<Applicant> getAppListBySyncAppStatus() {
		return sqlSessionTemplate.selectList("getAppBySyncAppStatus");
	}

	@Override
	public void updateSyncAppStatusById(int id) {
		sqlSessionTemplate.update("updateSyncAppStatusById", id);
	}
	
	@Override
	public void updateSyncInsuStatusById(int id) {
		sqlSessionTemplate.update("updateSyncInsuStatusById", id);
	}
	
	public void deleteAppById(int id){
		sqlSessionTemplate.delete("deleteAppById", id);
	}

	@Override
	public List<Applicant> getAppByPage(Map<String, Object> params) {
		int page = 0;
		int pageSize = 0;
		if(params.containsKey("page")){
			page = Integer.parseInt(params.get("page")+"");
			params.remove("page");
		}
		if(params.containsKey("rows")){
			pageSize = Integer.parseInt(params.get("rows")+"");
			params.remove("rows");
		}
		page = (page-1)*pageSize;
		params.put("page", page);
		params.put("pageSize", pageSize);
		return sqlSessionTemplate.selectList("getAppByPage", params);
	}

	@Override
	public Long getAppCount(Map<String, Object> params) {
		if(params.containsKey("page")){
			params.remove("page");
		}
		if(params.containsKey("rows")){
			params.remove("rows");
		}
		return sqlSessionTemplate.selectOne("getAppCount",params);
	}

}
