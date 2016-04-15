<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>修改密码</title>
	<%@include file="../include/global.jsp" %>
</head>

<body>
<div class="top"><div class="top_logo"></div></div>
		<form id="form1">
			<div style="margin:100px 38%">
						<div class="bomb_box Application">
						<input type="hidden" name="id" value="${param.id }"/>
						<input type="hidden" name="userName" value="${param.userName }"/>
						<ul>
					    	<li class="Application_left"><span style="color:green">密码重置</span></li>
					    </ul>
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
						userName:$("input[name=userName]").val(),
						password:$("#password").val()
					}
					$("a").text("正在保存...");
					CommonAjaxJson("${ctx}/washcar/washcarCtrl/reset/resetpwd",$.param(param),
						function(data){
							if(data.success){
								Dialog.alert("修改成功");
								parent.location.href="${ctx}";
							}if(data.success==false){
								Dialog.alert("操作异常，请点击确定重新修改");
								parent.location.reload();
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