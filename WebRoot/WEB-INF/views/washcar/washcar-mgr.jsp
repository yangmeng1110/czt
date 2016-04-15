<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>洗车店</title>
<%@include file="../include/global.jsp" %>
</head>

<body>
<div class="top">
	<div class="top_logo"></div>
    <div class="top_name"><span style="float:left;">当前用户:${loginUser.realName }<a href="${ctx }/login/loginCtrl/logOut">退出</a></span></div>
</div>
<div class="Icon">
	<ul>
    	<li>
        	<a href="${ctx }/applicant/applicantCtrl/toApplicantList?userName=${loginUser.userName }"><img src="${ctx }/images/icon1.png" /></a>
            <p><a href="${ctx }/applicant/applicantCtrl/toApplicantList?userName=${loginUser.userName }">申请记录</a></p>
        </li>
        <li>
        	<a href="${ctx }/applicant/applicantCtrl/toApplicantReportList?userName=${loginUser.userName }"><img src="${ctx }/images/icon2.png" /></a>
            <p><a href="${ctx }/applicant/applicantCtrl/toApplicantReportList?userName=${loginUser.userName }">返点投表</a></p>
        </li>
        <li>
        	<a href="javascript:resetPwd();"><img src="${ctx }/images/icon3.png" /></a>
            <p><a href="javascript:resetPwd();">设置</a></p>
            <input type="hidden" value="${loginUser.id }"/>
        </li>
    </ul>
</div>
<div class="login_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>

<form id="form1" style="display:none">
			<div>
						<div class="bomb_box Application">
					    <ul>
					    	<li class="Application_left">新密码：</li>
					        <li class="Application_right"><input type="password" id="password" name="password" type="text" /><span style="color:red;font-size:10px;" id="error"></span></li>
					    </ul>
					    <ul>
					    	<li class="Application_left">确认密码：</li>
					        <li class="Application_right"><input type="password" id="confirm_password" name="confirm_password" type="text"/><span style="color:red;font-size:10px;" id="error"></span></li>
					    </ul>
					    <div class="data_btn" style="margin-left:150px;"><a href="javascript:save();">提交</a></div>
					</div>
		</div>	
	</form>
<script type="text/javascript">
	function resetPwd(){
		Dialog.open({
			Title:'修改密码',
			Width:432,
			Height:185,
			InvokeElementId:'form1'
		});
	}
	
	$(function(){
			$("#form1").validate({
				rules:{
					password:{
						required:true,
						rangelength:[6,20],
					},
					confirm_password:{
						required:true,
						rangelength:[6,20],
						equalTo:"#password"
					}
				},
				messages:{
					password:{
						required:"密码不能为空",
						rangelength:"6-20个字符",
					},
					confirm_password:{
						required:"密码不能为空",
						rangelength:"6-20个字符",
						equalTo:"密码不一致"
					}
				},
				errorPlacement:function(error,element){
					error.appendTo(element.parent().children("#error"));
				},
				submitHandler:function(form){
					var param={
						id:$("input[type=hidden]").val(),
						password:$("#password").val()
					}
					$(".data_btn a").text("正在保存...");
					CommonAjaxJson("${ctx}/washcar/washcarCtrl/reset/resetpwd",$.param(param),
						function(data){
							if(data.success){
								Dialog.alert("修改成功");
								window.location.reload();
							}if(data.success==false){
								Dialog.alert("操作异常，请点击确定重新修改");
								window.location.reload();
							}
						}
					);
				}
			});
		});
		
		function save(){
			$("#form1").submit();
		}
</script>
</body>
</html>