package com.weiyin.cztqt.applicant.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.weiyin.cztqt.applicant.model.Applicant;
import com.weiyin.cztqt.applicant.service.ApplicantService;
import com.weiyin.cztqt.common.controller.BaseController;
import com.weiyin.cztqt.util.HttpServletUtils;

@Controller
@RequestMapping(value = "/applicant/applicantCtrl")
public class ApplicantController extends BaseController{

	@Autowired
	private ApplicantService applicantSerice;

	@RequestMapping(value="/toAdd")
	public String toAdd(){
		return "applicant/applicant-add";
	}
	
	@RequestMapping(value = "/doAdd")
	@ResponseBody
	public String doAdd(Applicant applicant) {
		Map<String,Object> info = new HashMap<String, Object>();
		try {
			applicant.setCarCode((applicant.getCarCode().substring(0, 2)+"·"+applicant.getCarCode().substring(2)).toUpperCase());
			applicantSerice.saveApp(applicant);
			info.put("success", true);
		} catch (Exception e) {
			log.error("添加数据失败"+e.getMessage(),e);
			info.put("success", false);
		}
		return JSON.toJSONString(info);
	}

	@RequestMapping(value="/toApplicantList")
	public String toApplicantList(){
//		return "applicant/applicant-list";
		return "applicant/list";
	}
	
	@RequestMapping(value="/toApplicantReportList")
	public String toApplicantReportList(){
		return "applicant/applicant-report";
	}
	
	
	@RequestMapping(value = "/getListByPage",produces={"application/json;charset=UTF-8"})
	@ResponseBody
	public String getList(HttpServletRequest req) {
		Map<String, Object> param = new HashMap<String, Object>();
		try {
		Map<String,Object> info = HttpServletUtils.parseReqToSearchCondition(
					new String[]{"page","rows","userName","insuStatus","date_from","date_to","status","carCode"}, req);
		List<Applicant>  list = applicantSerice.getAppByPage(info);
		Long total = applicantSerice.getAppCount(info);
		param.put("total", total);
		param.put("rows",list);
		} catch (Exception e) {
			log.error("查询贷款申请人失败"+e.getMessage(), e);
		}
		return JSON.toJSONString(param);
	}

	@RequestMapping(value="/doModify")
	@ResponseBody
	public  String doModify(Applicant applicant){
		Map<String,Object> info = new HashMap<String, Object>();
		try {
			applicantSerice.updateApp(applicant);
			info.put("success", true);
		} catch (Exception e) {
			log.error("添加数据失败"+e.getMessage(),e);
			info.put("success", false);
		}
		return JSON.toJSONString(info);
	}
	
	@RequestMapping(value="/doDelete")
	@ResponseBody
	public String doDelete(int id){
		Map<String,Object> info = new HashMap<String, Object>();
		try {
			applicantSerice.deleteAppById(id);
			info.put("success", true);
		} catch (Exception e) {
			log.error("添加数据失败"+e.getMessage(),e);
			info.put("success", false);
		}
		return JSON.toJSONString(info);
	}
}
