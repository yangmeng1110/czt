package com.weiyin.cztqt.insurance.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weiyin.cztqt.common.controller.BaseController;

@Controller
@RequestMapping(value="/insurance/insuranceCtrl")
public class InsuranceController extends BaseController {

	
	@RequestMapping(value="/toModify")
	public String toModify(){
		return "insurance/insurance-deal";
	} 
	
	@RequestMapping(value="/goInsuranceMgr")
	public String goInsuranceMgr(){
		return "insurance/insu-list";
	}
}
