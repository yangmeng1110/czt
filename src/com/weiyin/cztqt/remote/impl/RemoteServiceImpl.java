package com.weiyin.cztqt.remote.impl;

import java.util.Iterator;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.weiyin.cztqt.applicant.model.Applicant;
import com.weiyin.cztqt.applicant.service.ApplicantService;
import com.weiyin.cztqt.insurance.model.Insurance;
import com.weiyin.cztqt.insurance.service.InsuranceService;
import com.weiyin.cztqt.remote.RemoteService;
import com.weiyin.cztqt.util.DateUtil;
import com.weiyin.cztqt.util.MD5;
import com.weiyin.cztqt.util.StringUtils;
import com.weiyin.cztqt.washcar.model.WashCar;
import com.weiyin.cztqt.washcar.service.WashCarService;
@Component("remoteService")
public class RemoteServiceImpl implements RemoteService{

	private Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private WashCarService washCarService;
	
	@Autowired
	private ApplicantService applicantService;
	
	@Autowired
	private InsuranceService insuranceService;

	@Override
	public Integer saveWashCar(String xmlText) {
		int i=0;
		try {
			Document document = DocumentHelper.parseText(xmlText);
			Element rootElement = document.getRootElement();
			Iterator it = rootElement.elementIterator("washCar");
			WashCar washCar = new WashCar();
			Element element = null;
			while (it.hasNext()) {
				element = (Element) it.next();
				washCar.setRealName(element.elementTextTrim("realName"));
				washCar.setUserName(element.elementTextTrim("userName"));
				washCar.setPassword(MD5.toMD5(element.elementTextTrim("password")));
				washCar.setMobile(element.elementTextTrim("mobile"));
				washCar.setQqCode(Integer.parseInt(element.elementText("qqCode")));
				washCar.setCarName(element.elementText("carName"));
				washCar.setCarAddr(element.elementText("carAddr"));
				washCar.setRemark(element.elementText("remark"));
			}
			i = washCarService.saveWashCar(washCar);
		} catch (Exception e) {
			log.error("添加洗车店数据失败"+e.getMessage(), e);
		}
		return i;
	}

	@Override
	public String saveApplicant() {
		String xmlText = null;
		try {
			List<Applicant> applicants = applicantService.getAppListBySyncAppStatus();
			Element rootElement = DocumentHelper.createElement("applicantTempList");
			Document document = DocumentHelper.createDocument(rootElement);
			Element element = null;
			for(Applicant applicant : applicants){
				element = rootElement.addElement("applicantTemp");
				element.addElement("id").addText(StringUtils.replaceNullString(applicant.getId()+""));
				element.addElement("realName").addText(StringUtils.replaceNullString(applicant.getRealName()));
				element.addElement("mobile").addText(StringUtils.replaceNullString(applicant.getMobile()));
				element.addElement("carCode").addText(StringUtils.replaceNullString(applicant.getCarCode()));
				element.addElement("status").addText(StringUtils.replaceNullString(applicant.getStatus()+""));
				element.addElement("referees").addText(StringUtils.replaceNullString(applicant.getReferees()));
				element.addElement("operTime").addText(DateUtil.parseDate(applicant.getOperTime()));
				element.addElement("insuStatus").addText(StringUtils.replaceNullString(applicant.getInsuStatus()+""));
				element.addElement("insuRemark").addText(StringUtils.replaceNullString(applicant.getInsuRemark()));
				element.addElement("remark").addText(StringUtils.replaceNullString(applicant.getRemark()));
				applicantService.updateSyncAppStatusById(applicant.getId());
			}
			xmlText = document.asXML();
		} catch (Exception e) {
			log.error("添加申请人数据失败"+e.getMessage(), e);
		}
		return xmlText;
	}

	@Override
	public Integer saveInsurance(String xmlText) {
		int i=0;
		try {
			Document document = DocumentHelper.parseText(xmlText);
			Element rootElement = document.getRootElement();
			Iterator it = rootElement.elementIterator("insurance");
			Insurance insurance = new Insurance();
			Element element = null;
			while (it.hasNext()) {
				element = (Element) it.next();
				insurance.setRealName(element.elementTextTrim("realName"));
				insurance.setUserName(element.elementTextTrim("userName"));
				insurance.setPassword(MD5.toMD5(element.elementTextTrim("password")));
				insurance.setMobile(element.elementTextTrim("mobile"));
				insurance.setInsuName(element.elementTextTrim("insuName"));
				insurance.setInsuAddr(element.elementTextTrim("insuAddr"));
				insurance.setRemark(element.elementText("remark"));
			}
			i = insuranceService.saveInsurance(insurance);
		} catch (Exception e) {
			log.error("添加保险公司数据失败"+e.getMessage(), e);
		}
		return i;
	}

	@Override
	public String syncApplicant(String xmlText) {
		String xml = null;
		try {
				Document document = DocumentHelper.parseText(xmlText);  
				Element rootElement = document.getRootElement();
				Iterator it = rootElement.elementIterator("applicant");
				Element element = null;
				Applicant applicant = null;
				while(it.hasNext()){
					element = (Element) it.next();
					applicant = applicantService.getAppById(Integer.parseInt(element.elementTextTrim("custId")));
					applicant.setLoanMoney(Integer.parseInt(element.elementText("loanMoney")));
					applicant.setRebateMoney(Double.parseDouble(element.elementTextTrim("rebateMoney")));
					applicant.setStatus(Integer.parseInt(element.elementTextTrim("status")));
					applicant.setRemark(element.elementTextTrim("remark"));
					applicantService.updateApp(applicant);
				}
				/**查询保险受理记录*/
				List<Applicant> list = applicantService.getAppListBySyncInsuStatus();
				Element rootElement2 = DocumentHelper.createElement("applicantList2");
				Document document2 = DocumentHelper.createDocument(rootElement2);
				for(Applicant applicant2 : list){
					element = rootElement2.addElement("applicant2");
					element.addElement("id").addText(applicant2.getId()+"");
					element.addElement("insuStatus").addText(StringUtils.replaceNullString(applicant2.getInsuStatus()+""));
					element.addElement("insuRemark").addText(StringUtils.replaceNullString(applicant2.getInsuRemark()));
					applicantService.updateSyncInsuStatusById(applicant2.getId());
				}
				xml = document2.asXML();
		} catch (Exception e) {
			log.error("同步申请人数据失败"+e.getMessage(), e);
		}
		
		return xml;
	}
}
