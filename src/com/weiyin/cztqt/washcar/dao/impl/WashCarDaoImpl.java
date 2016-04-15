package com.weiyin.cztqt.washcar.dao.impl;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weiyin.cztqt.washcar.dao.WashCarDao;
import com.weiyin.cztqt.washcar.model.WashCar;

@Repository("dao")
public class WashCarDaoImpl implements WashCarDao {

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public WashCar getWashCarByUname(String userName) {
		return sqlSessionTemplate.selectOne("getWashCarByUname", userName);
	}

	public Integer saveWashCar(WashCar washCar) {
		return sqlSessionTemplate.insert("saveWashCar", washCar);
	}


	@Override
	public void updateWashCar(WashCar washCar) {
		sqlSessionTemplate.update("updateWashCar", washCar);
	}

	
}
