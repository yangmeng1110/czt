<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
		<title>保险处理</title>
		<%@include file="../include/global.jsp" %>
<script type="text/javascript">
	
	$(function(){
		$("#form1").validate({
					rules:{
						"insuRemark":{
							required:true
						}
					},
					messages:{
						"insuRemark":{
							required:"必须输入"
						}
					},
				errorPlacement:function(error,element){
				error.appendTo(element.parent().children("#error"));
				},
				submitHandler:function(form){
				$("a").text("正在提交......");
				CommonAjaxJson("${ctx}/applicant/applicantCtrl/doModify",$("#form1").serialize(),
					function(data){
								if(data.success){
									parent.InitTable(0);
								}if(data.success==false){
									Dialog.alert("操作异常，请点击确定重新受理");
									parent.InitTable(0);
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
<title>添加申请人</title>
</head>
<body>
	<form id="form1">
			<div class="bomb_box Application">
			<input type="hidden" name="id" value="${param.id }"/>
			<input type="hidden" name="syncInsuStatus" value="1"/>
		    <ul>
		    	<li class="Application_left">保险受理状态：</li>
		        <li class="data_Date data_width2">
		        <select name="insuStatus">
					<option value="0">未受理</option>
					<option value="1">受理成功</option>
					<option value="2">受理失败</option>		        	
		        </select></li>
		    </ul>
		    <ul>
		    	<li class="Application_left">保险公司批注：</li>
		        <li class="Application_right"><textarea style="resize: none;width:200px;height:45px;" name="insuRemark"></textarea><span style="color:red;font-size:10px;" id="error"></span></li>
		    </ul>
		    <div class="data_btn" style="margin-left:150px;"><a href="javascript:save();">提交</a></div>
		</div>
	</form>
</body>
</html>