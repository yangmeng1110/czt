<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户登录</title>
		<link href="${ctx }/css/glod.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="${ctx }/js/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="${ctx }/js/common.js"></script>
	</head>
	<div class="login"></div>
	<form action="" id="form">
	<div class="login_iput">
		<div class="login_iput_left"></div>
		<div class="login_iput_right">
			<dd class="login_iput_right_1">
				<input name="userName" id="userName" type="text" />
			</dd>
			<dd class="login_iput_right_2">
				<span style="color: #F00" id="error1"></span>
			</dd>
		</div>
	</div>
	<div class="login_iput">
		<div class="login_iput_left1"></div>
		<div class="login_iput_right">
			<dd class="login_iput_right_1">
				<input name="password" id="password" type="password"/>
			</dd>
			<dd class="login_iput_right_2">
				<span style="color: #F00" id="error2"></span>
			</dd>
		</div>
	</div>
	</form>
	<div class="login_iput">
		<div class="login_btn">
			<a href="javascript:login()">登录</a>
		</div>
	</div>
	<div style="margin-top:10px;text-align:center"><a href="${ctx }/washcar/washcarCtrl/reset/goforgotpwd"><span style="color:white;">忘记密码</span></a></div>
	<div class="login_bottom">
		<div class="login_bottom">
			迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司
		</div>
	</div>
	<body>
	<script type="text/javascript">
			$(function(){
				$("input").focus(function(){
					if(this.value.length>0){
						this.value='';
					}
				}).blur(function(){
					if(this.value.length==0){
						 this.type = 'text';
					}else{
						$("#error1").html("");
						$("#error2").html("");
					}
				});
			});
			//键盘事件
			$(document).keydown(function (e) {
	               if (e.keyCode == 13) {
                    	login();
                	}
	            });
			function login(){
				var userName = $.trim($("#userName").val());
				var password = $.trim($("#password").val());
				if(userName==""||userName==null){
					$("#error1").html("*请输入用户名");
					$("#userName").focus();
					return; 
				}
				if(password==""||password==null){
					$("#error2").text("*请输入密码");
					$("#password").focus();
					return; 
				}
				CommonAjaxJson("${ctx}/login/loginCtrl/doLogin",$("form").serialize(),
					function(info){
						if(info.success){
							if(info.userType=="xcd"){
								window.location.href="${ctx}/washcar/washcarCtrl/goWashCarMgr";
							}else if(info.userType="bxgs"){
								window.location.href="${ctx}/insurance/insuranceCtrl/goInsuranceMgr";
							}
						}else if(info.success==false){
							if(info.code==1){
								$("#error1").html("*用户名不存在");
							}else if(info.code==0){
								$("#error2").html("*密码错误");
								}
						}
					}
				);
			}
			
		</script>
	</body>
</html>
