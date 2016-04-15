<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>找回密码</title>
	<%@include file="../include/global.jsp" %>
</head>
<body>
<div class="top">
	<div class="top_logo"></div>
</div>
<div id="d1"></div>	
	<input type="hidden" name="validateCode" value="${param.validateCode }"/>
	<input type="hidden" name="userName" value="${param.userName }"/>
	<script type="text/javascript">
		$(function(){
			var param1={
						userName:$("input[name=userName]").val(),
						validateCode:$("input[name=validateCode]").val()
					}
			CommonAjaxJson("${ctx}/washcar/washcarCtrl/reset/checklink",$.param(param1),
						function(data){
							if(data.success){
								var userName = $("input[name=userName]").val();
								window.location.href="${ctx}/washcar/washcarCtrl/reset/goResetPwd?userName="+userName;
							}
							if(data.success==false){
								$("#d1").html("<div style='margin-top:50px'><p style='text-align:center;font-size:50px;font-weight:bold;color:red'>链接已过期或者损坏......<br></br><a href='${ctx }/washcar/washcarCtrl/reset/goforgotpwd'>重新发送邮件</a></p></div>");
							}
						}
					);
				});
	</script>
</body>
</html>