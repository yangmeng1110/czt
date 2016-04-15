package com.weiyin.cztqt.insurance.service.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weiyin.cztqt.insurance.dao.InsuranceDAO;
import com.weiyin.cztqt.insurance.model.Insurance;
import com.weiyin.cztqt.insurance.service.InsuranceService;
import com.weiyin.cztqt.remote.impl.RemoteServiceImpl;

@Service("insuranceService")
public class InsuranceServiceImpl implements InsuranceService {

	Logger log = Logger.getLogger(RemoteServiceImpl.class);
	
	@Autowired
	private InsuranceDAO insuranceDAO;
	
	@Override
	public Insurance getInsuranceById(int id) {
		return insuranceDAO.getInsuranceById(id);
	}


	@Transactional(rollbackFor=Exception.class)
	public Integer saveInsurance(Insurance insurance) {
		return insuranceDAO.saveInsurance(insurance);
	}


	@Transactional(rollbackFor=Exception.class)
	public void updateInsurance(Insurance insurance) {
		insuranceDAO.updateInsurance(insurance);
	}

	@Override
	public Insurance getInsuranceByUname(String userName) {
		return insuranceDAO.getInsuranceByUname(userName);
	}

}
