package com.weiyin.cztqt.washcar.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.weiyin.cztqt.util.Contants;
import com.weiyin.cztqt.util.MD5;
import com.weiyin.cztqt.util.PropertiesUtil;
import com.weiyin.cztqt.util.RandomUtil;
import com.weiyin.cztqt.util.mail.MailSender;
import com.weiyin.cztqt.util.mail.MailSenderInfo;
import com.weiyin.cztqt.washcar.model.WashCar;
import com.weiyin.cztqt.washcar.service.WashCarService;

@Controller
@RequestMapping(value = "/washcar/washcarCtrl")
public class WashCarCntroller {

	private Logger log = Logger.getLogger(WashCarCntroller.class);
	private static String ranGen="";
	@Autowired
	WashCarService washCarService;
	
	@RequestMapping(value="/goWashCarMgr")
	public String goWashCarMgr(){
		return "washcar/washcar-mgr";
	}
	
	@RequestMapping(value="/reset/goResetPwd")
	public String goResetPwd(){
		return "washcar/washcar-resetpwd";
	}
	
	@RequestMapping("/reset/resetpwd")
	@ResponseBody
	public String resetPwd(WashCar washCar){
		Map<String,Object> info = new HashMap<String, Object>();
		try {
			washCar.setPassword(MD5.toMD5(washCar.getPassword()));
			washCarService.updateWashCar(washCar);
			info.put(Contants.SUCCESS,true);
		} catch (Exception e) {
			log.error("修改密码失败，异常信息"+e.getMessage(), e);
			info.put(Contants.SUCCESS, false);
		}
		return JSON.toJSONString(info);
	}
	
	@RequestMapping(value="/reset/goforgotpwd")
	public String goResetpwd(){
		return "washcar/washcar-sendmail";
	}
	
	@RequestMapping(value="/reset/sendmail")
	@ResponseBody
	public String sendMail(HttpServletRequest request,WashCar washCar){
		Map<String,Object> info = new HashMap<String, Object>();
		try {
			String validateCode = UUID.randomUUID().toString();//生成密钥
			Date outDate = new Date(System.currentTimeMillis()+30 * 60 * 1000);//30分钟后过期
			long date = outDate.getTime() / 1000 * 1000;// 忽略毫秒数  mySql 取出时间是忽略毫秒数的
			//插入到数据库
			washCar.setValidateCode(validateCode);
			washCar.setOutDate(outDate);
			washCarService.updateWashCar(washCar);
			
			 String key =washCar.getUserName() + "$" + date + "$" + validateCode;
			 String digitalName = MD5.toMD5(key);//数字签名
			 ranGen = RandomUtil.getRandom(5);
			 /*
			 String path = request.getContextPath();
			 String basePath = request.getScheme() + "://"
             + request.getServerName() + ":"
             + request.getServerPort() + path + "/";
		     String resetPassHref = basePath + "washcar/washcarCtrl/reset/forgotpwd?userName="+washCar.getUserName()+"&validateCode="+digitalName;
		     String emailContent = "请勿回复本邮件.点击下面的链接,重设密码\r"+ resetPassHref 
             + "\r本邮件超过30分钟,链接将会失效，需要重新申请找回密码";
             */
			 String emailContent = "亲爱的用户\r验证码为："+ranGen+"\r请勿回复本邮件";
             Properties p = PropertiesUtil.getProperties("/config/mail.properties");
     		MailSenderInfo mailInfo = new MailSenderInfo();
     		mailInfo.setMailServerHost(p.getProperty("smtpHost"));
     		mailInfo.setValidate(true);
     		mailInfo.setUsername(p.getProperty("userName"));
     		mailInfo.setPassword(p.getProperty("password"));
     		mailInfo.setFromAddress(MimeUtility.encodeText(p.getProperty("nickName"))+ "<" + p.getProperty("fromMail") + ">");
     		mailInfo.setToAdderss(p.getProperty("toMail"));
     		mailInfo.setMailSubject("找回您的账户密码");
     		mailInfo.setMailContent(emailContent);
     		MailSender.sendMailText(mailInfo);
     		info.put(Contants.SUCCESS, true);
     		info.put("digitalName", digitalName);
     		info.put("userName", washCar.getUserName());
		} catch (Exception e) {
			log.error("发送邮件异常，异常信息"+e.getMessage(),e);
			info.put(Contants.SUCCESS, true);
		}
		return JSON.toJSONString(info);
	} 
	
	@RequestMapping(value="/reset/checklink")
	@ResponseBody
	public String forgotPwd(HttpServletRequest request){
		Map<String,Object> info = new HashMap<String, Object>();
		String validateCode = request.getParameter("validateCode");
		String userName = request.getParameter("userName");
		String randNum = request.getParameter("randNum");
	try {
				WashCar washCar = washCarService.getWashCarByUname(userName);
				if(validateCode == null || validateCode=="" && userName==null || userName==""){
					info.put(Contants.SUCCESS, false);
					return JSON.toJSONString(info);
				}
				Date nowDate = new Date();
				Date outDate = washCar.getOutDate();
				if(!nowDate.before(outDate)){
					info.put(Contants.SUCCESS, false);
					return JSON.toJSONString(info);
				}
				long date = outDate.getTime()/1000*1000;
				String key =washCar.getUserName() + "$" + date + "$" + washCar.getValidateCode();
				String digitalName = MD5.toMD5(key);//数字签名
				 if(!validateCode.equals(digitalName)){
					 info.put(Contants.SUCCESS, false);
					 return JSON.toJSONString(info);
				 }
				 if(!ranGen.equals(randNum)){
					 info.put(Contants.SUCCESS, false);
					 return JSON.toJSONString(info);
				 }
			}catch (Exception e) {
				e.printStackTrace();
			}
			info.put(Contants.SUCCESS, true);
			return JSON.toJSONString(info);
	}
	
	@RequestMapping(value="/reset/forgotpwd")
	public ModelAndView goXX(HttpServletRequest request,ModelAndView view){
		view.addObject("userName", request.getParameter("userName"));
		view.addObject("validateCode", request.getParameter("validateCode"));
		view.setViewName("washcar/washcar-forgotpwd");
		return view;
	}
	
}
