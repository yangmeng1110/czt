<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>新增贷款申请人</title>
	<%@include file="../include/global.jsp" %>
<title>添加申请人</title>
</head>
<body>
	<form id="form1">
			<div class="bomb_box Application">
			<input type="hidden" name="referees" value="${param.userName }"/>
		    <ul>
		    	<li class="Application_left">车主姓名：</li>
		        <li class="Application_right"><input name="realName" type="text" /><span style="color:red;font-size:10px;" id="error"></span></li>
		    </ul>
		    <ul>
		    	<li class="Application_left">手机号：</li>
		        <li class="Application_right"><input name="mobile" type="text" /><span style="color:red;font-size:10px;" id="error"></span></li>
		    </ul>
		    <ul>
		    	<li class="Application_left">车牌号：</li>
		        <li class="Application_right"><input name="carCode" type="text"/><span style="color:red;font-size:10px;" id="error"></span></li>
		    </ul>
		    <div class="data_btn" style="margin-left:150px;"><a href="javascript:save();">提交</a></div>
		</div>
	</form>
	
	<script type="text/javascript">
		jQuery.validator.addMethod("mobileValidate",function(value,element){
					var regex= /^1[3|4|5|8][0-9]\d{8}$/; 
					 return regex.test(value) || this.optional(element); 
				},"手机号不合法");
			jQuery.validator.addMethod("carCodeValidate",function(value,element){
				var regex = /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
				return regex.test(value) || this.optional(element); 
			},"车牌号不合法");	
	$(function(){
		 $("#form1").validate({
			rules:{
				"realName":{required:true},
				"mobile":{required:true,mobileValidate:true},
				"carCode":{required:true,carCodeValidate:true}
			},
			messages:{
				"realName":{required:"姓名不能为空"},
				"mobile":{required:"手机号不能为空"},
				"carCode":{required:"车牌号不能为空"}
			},
			errorPlacement:function(error,element){
				error.appendTo(element.parent().children("#error"));
			},
			submitHandler:function(form){
				$("a").text("正在保存...");
				CommonAjaxJson("${ctx}/applicant/applicantCtrl/doAdd",$("#form1").serialize(),
					function(data){
						if(data.success){
							//window.parent.loadGrid();
							window.parent.InitTable(0);
						}if(data.success==false){
							Dialog.alert("操作异常，请点击确定重新添加");
							//window.parent.loadGrid();
							window.parent.InitTable(0);
						}
						closeDialog();
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