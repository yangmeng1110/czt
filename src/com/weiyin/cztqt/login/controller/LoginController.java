package com.weiyin.cztqt.login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.weiyin.cztqt.common.controller.BaseController;
import com.weiyin.cztqt.insurance.model.Insurance;
import com.weiyin.cztqt.insurance.service.InsuranceService;
import com.weiyin.cztqt.util.Contants;
import com.weiyin.cztqt.util.MD5;
import com.weiyin.cztqt.washcar.model.WashCar;
import com.weiyin.cztqt.washcar.service.WashCarService;

@Controller
@RequestMapping(value = "/login/loginCtrl")
public class LoginController extends BaseController{
	private  Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private WashCarService washCarService;
	
	@Autowired
	private InsuranceService insuranceService;
	
	@RequestMapping(value = "/goLogin")
	public String goLgin() {
		return "login";
	}

	@RequestMapping(value = "/doLogin")
	@ResponseBody
	public String doLogin(HttpSession session,HttpServletRequest request) {
		String userName = request.getParameter("userName").trim();
		String password = MD5.toMD5(request.getParameter("password")).trim();
		WashCar washCar = washCarService.getWashCarByUname(userName);
		Insurance insurance = insuranceService.getInsuranceByUname(userName);
		Map<String,Object> param = new HashMap<String, Object>();
		if(washCar == null && insurance == null){
			param.put(Contants.SUCCESS, false);
			param.put(Contants.LOGIN_VALIDATE_CODE, 1);
		}else{
			if(washCar != null){
				if(!password.equals(washCar.getPassword())){
					param.put(Contants.SUCCESS,false);
					param.put(Contants.LOGIN_VALIDATE_CODE, 0);
					
				}else{
					session.setAttribute(Contants.SESSION_USER_KEY, washCar);
					param.put(Contants.SUCCESS, true);
					param.put(Contants.USER_TYPE,washCar.getUserType());
				}
			}
			if(insurance != null){
				if(!password.equals(insurance.getPassword())){
					param.put(Contants.SUCCESS,false);
					param.put(Contants.LOGIN_VALIDATE_CODE, 0);
				}else{
					session.setAttribute(Contants.SESSION_USER_KEY, insurance);
					param.put(Contants.SUCCESS, true);
					param.put(Contants.USER_TYPE,insurance.getUserType());
				}
			}
		}
		return JSON.toJSONString(param);
	}
	
	@RequestMapping(value="/logOut")
	public String logOut(HttpSession session){
		session.invalidate();
		return "redirect:goLogin";
	}
}
