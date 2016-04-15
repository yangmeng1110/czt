package com.weiyin.cztqt.washcar.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.weiyin.cztqt.washcar.dao.WashCarDao;
import com.weiyin.cztqt.washcar.model.WashCar;
import com.weiyin.cztqt.washcar.service.WashCarService;

@Service("washCarService")
public class WashCarServiceImpl implements WashCarService {

	@Autowired
	private WashCarDao washCarDao;

	public WashCar getWashCarByUname(String userName) {
		return washCarDao.getWashCarByUname(userName);
	}

	@Transactional(rollbackFor = Exception.class)
	public Integer saveWashCar(WashCar washCar) {
		return washCarDao.saveWashCar(washCar);
	}

	@Transactional(rollbackFor = Exception.class)
	public void updateWashCar(WashCar washCar) {
		washCarDao.updateWashCar(washCar);
	}	

}
