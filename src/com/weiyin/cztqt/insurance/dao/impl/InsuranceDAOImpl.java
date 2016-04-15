package com.weiyin.cztqt.insurance.dao.impl;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weiyin.cztqt.insurance.dao.InsuranceDAO;
import com.weiyin.cztqt.insurance.model.Insurance;
import com.weiyin.cztqt.remote.impl.RemoteServiceImpl;

@Repository
public class InsuranceDAOImpl implements InsuranceDAO {

	Logger log = Logger.getLogger(RemoteServiceImpl.class);
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Insurance getInsuranceById(int id) {
		return sqlSessionTemplate.selectOne("getInsuranceById", id);
	}


	@Override
	public Integer saveInsurance(Insurance insurance) {
		return sqlSessionTemplate.insert("saveInsurance", insurance);
	}


	@Override
	public void updateInsurance(Insurance insurance) {
		sqlSessionTemplate.insert("updateInsurance", insurance);
	}


	@Override
	public Insurance getInsuranceByUname(String userName) {
		return sqlSessionTemplate.selectOne("getInsuranceByUname", userName);
	}
	
}
