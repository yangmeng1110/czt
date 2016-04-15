<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
	<title>找回密码</title>
	<%@include file="../include/global.jsp" %>
	<style type="text/css">
		.rul{
			font-size:15px
		}
		.rli{
			background-color:#8C94A7
		}
	</style>
</head>
<body>
<div class="top">
	<div class="top_logo"><a href="${ctx}/login/loginCtrl/goLogin"><img src="${ctx }/images/bt.png"/></a></div>
</div>
	<form id="form1" action="">
	<div style="margin:100px 38%">
			<div class="bomb_box Application">
			<ul class="rul">
				<li class="rli">1--填写账户名</li>
				<li>2--验证身份</li>
				<li>3--设置新密码</li>
				<li>4--完成</li>
			</ul>
				<div id="d1">
				   	<ul>
				    	<li class="Application_left">用户名找回密码</li>
				    </ul>
				    <ul>
				    	<li class="Application_left">用户名：</li>
				        <li class="Application_right"><input name="userName" type="text" /></li>
				    </ul>
				    <ul>
				    	<li><span id="msg"></span></li>
				    </ul>
				    <div class="data_btn" style="margin-left:150px;"><a href="javascript:sendMail();">发送</a></div>
			   </div> 
		  </div> 
		</div> 
	</form> 
	
			<input type="hidden" id="vc" name=digitalName"/>
			<input type="hidden" id="un" name="userName"/>
	<div id="validate" style="display:none">
			<ul>
				<li class="Application_left"><span id="errorMsg"></span></li>
			</ul>
			<ul>
		    	<li class="Application_left">验证码：</li>
		        <li class="Application_right"><input name="randNum" type="text" /></li>
		    </ul>
		     <div id="d1a" class="data_btn" style="margin-left:150px;"><a href="javascript:checkCode();">下一步</a></div>
	</div>
	
		<form id="form2" style="display:none">
						<div class="bomb_box Application">
						
						<ul>
							<li class="Application_left"><span id="errorMsg2"></span></li>
						</ul>
					    <ul>
					    	<li class="Application_left">新密码：</li>
					        <li class="Application_right"><input type="password" id="password" name="password" type="text" /><span style="color:red;font-size:10px;" id="error"></span></li>
					    </ul>
					    <ul>
					    	<li class="Application_left">确认密码：</li>
					        <li class="Application_right"><input type="password" id="confirm_password" name="confirm_password" type="text"/><span style="color:red;font-size:10px;" id="error"></span></li>
					    </ul>
					    <div id="d2a" class="data_btn" style="margin-left:150px;"><a href="javascript:save();">提交</a></div>
				</div>	
	</form>
	<script type="text/javascript">
		function sendMail(){
			$("a").text("正在发送...");
			CommonAjaxJson("${ctx }/washcar/washcarCtrl/reset/sendmail",$("#form1").serialize(),
				function(data){
					if(data.success){
						$("#msg").html("邮件发送成功,请登录邮箱查看").css({"color":"green","font-size":"20px"});
						$("#d1").html($("#validate").html());
						$(".rul li:eq(1)").addClass("rli");
						$("#d1a a").text("下一步");
						$("#un").val(data.userName);
						$("#vc").val(data.digitalName);
					}
					if(data.success==false){
						$("#msg").html("邮件发送失败,请稍后重试").css({"color":"red","font-size":"20px"});
						$("a").text("重新发送...");
					}
				}
			);
		}
		
		function checkCode(){
			var params={
				 randNum:$.trim($("input[name=randNum]").val()),
				 userName:$("#un").val(),
				 validateCode:$("#vc").val()
			}
			CommonAjaxJson("${ctx }/washcar/washcarCtrl/reset/checklink",$.param(params),
				function(data){
					if(data.success){
						$("#d1").html($("#form2").html());
						$(".rul li:eq(2)").addClass("rli");
						$("#d2a a").text("提交");
					}if(data.success==false){
						$("#errorMsg").html("验证码错误").css({"color":"red","font-size":"13px"});
					}
				}
			);
		}
		
		$(function(){
			$("#form2").validate({
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
						userName:$("#un").val(),
						password:$("#password").val()
					}
					CommonAjaxJson("${ctx}/washcar/washcarCtrl/reset/resetpwd",$.param(param),
						function(data){
							if(data.success){
								$("#d1").html("重置密码成功");
								$(".rul li:eq(3)").addClass("rli");
							}if(data.success==false){
								$("#errorMsg2").html("重置密码错误").css({"color":"red","font-size":"13px"});
							}
						}
					);
				}
			});
		});
		
		function save(){
			$("#form2").submit();
		}
</script>
</body>
</html>