package com.weiyin.cztqt.applicant.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weiyin.cztqt.applicant.dao.ApplicantDAO;
import com.weiyin.cztqt.applicant.model.Applicant;
import com.weiyin.cztqt.applicant.service.ApplicantService;
import com.weiyin.cztqt.remote.impl.RemoteServiceImpl;

@Service("applicantSerice")
public class ApplicantServiceImpl implements ApplicantService {

	Logger log = Logger.getLogger(RemoteServiceImpl.class);
	
	@Autowired
	private ApplicantDAO applicantDAO; 
	
	@Override
	public Applicant getAppById(int id) {
		return applicantDAO.getAppById(id);
	}


	@Transactional(rollbackFor=Exception.class)
	public void saveApp(Applicant applicant) {
		applicantDAO.saveApp(applicant);
	}

	@Transactional(rollbackFor=Exception.class)
	public void updateApp(Applicant applicant) {
			applicantDAO.updateApp(applicant);
	}

	@Transactional(rollbackFor=Exception.class)
	public void deleteAppById(int id) {
		applicantDAO.deleteAppById(id);
	}

	@Override
	public List<Applicant> getAppByPage(Map<String, Object> params) {
		return applicantDAO.getAppByPage(params);
	}

	@Override
	public Long getAppCount(Map<String, Object> params) {
		return applicantDAO.getAppCount(params);
	}


	@Override
	public List<Applicant> getAppListBySyncAppStatus() {
		return applicantDAO.getAppListBySyncAppStatus();
	}


	@Override
	public List<Applicant> getAppListBySyncInsuStatus() {
		return applicantDAO.getAppListBySyncInsuStatus();
	}


	@Transactional(rollbackFor=Exception.class)
	public void updateSyncAppStatusById(int id) {
		applicantDAO.updateSyncAppStatusById(id);
	}


	@Transactional(rollbackFor=Exception.class)
	public void updateSyncInsuStatusById(int id) {
		applicantDAO.updateSyncInsuStatusById(id);
		
	}


}
