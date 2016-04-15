<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>贷款申请人列表</title>
		<%@include file="../include/global.jsp" %>
		<link type="text/css" rel="stylesheet" href="${ctx }/js/jPages/jPages.css"></link>
		<link type="text/css" rel="stylesheet" href="${ctx }/js/jPages/animate.css"></link>
		<script type="text/javascript" src="${ctx }/js/jPages/jPages.js"></script>
		<script type="text/javascript">
			$(function(){
			    $("div.page").jPages({
			    	containerID:"data", 
			     	first: '首页',      
			     	last: '尾页',      
			     	previous: '上页',     
					next: '下页', 
		            perPage: 12,   //每页显示数据为多少行             
			       startPage: 1, //起始页 
		            startRange: 2, //开始页码为2个 
		            midRange: 3,//最多显示几个页码页码,其余用..代替             
				   endRange: 2, //结束页码为2个
				   animation: 'wobble',
				   direction:'auto',
				  keyBrowse: true
			    });
			});
		</script>
</head>

<body>
<div class="top">
	<div class="top_logo"><a href="${ctx}/washcar/washcarCtrl/goWashCarMgr"><img src="${ctx }/images/bt.png"/></a></div>
    <div class="top_name"><span style="float:left;">当前用户:${loginUser.realName }<a href="${ctx }/login/loginCtrl/logOut">退出</a></span></div>
</div>
<div class="data">
	<div class="data_btn_lin">
    	<div class="data_btn"><a href="javascript:toAdd()">申请</a></div>
    </div>
    <input type="hidden" id="userName" value="${param.userName }"/>
     <div class="data_Form">
    	<ul class="data_Form_back">
        	<li class="data_Form_width2"><span style="padding-left:15px;">序号</span></li>
            <li class="data_Form_width"><span style="padding-left:15px;">姓名</span></li>
            <li class="data_Form_width"><span style="padding-left:15px;">手机号</span></li>
            <li class="data_Form_width"><span style="padding-left:15px;">车牌号</span></li>
            <li class="data_Form_width"><span style="padding-left:15px;">状态</span></li>
            <li class="data_Form_width"><span style="padding-left:15px;">返点金额</span></li>
            <li class="data_Form_width"><span style="padding-left:15px;">申请时间</span></li>
            <li class="data_Form_width1"><span style="padding-left:15px;">操作</span></li>
        </ul>
       <div id="data">
       		<c:forEach items="${list}" var="applicant">
		       	<ul>
		        	<li class="data_Form_width2"><span style="padding-left:15px;">${applicant.id }</span></li>
		            <li class="data_Form_width"><span style="padding-left:15px;">${applicant.realName }</span></li>
		            <li class="data_Form_width"><span style="padding-left:15px;">15178945871</span></li>
		            <li class="data_Form_width"><span style="padding-left:15px;">牛B74110</span></li>
		            <li class="data_Form_width"><span style="padding-left:15px;">申请中</span></li>
		            <li class="data_Form_width"><span style="padding-left:15px;">500.00元</span></li>
		            <li class="data_Form_width"><span style="padding-left:15px;">2012-12-12 15:60:00</span></li>
		            <li class="data_Form_width1"><span style="padding-left:15px;"><a href="#">修改</a><a href="#">删除</a><a href="#">查看进度</a></span></li>
		        </ul>
       		</c:forEach>
       </div>
    </div>
    <div class="page"> </div>
</div>
<div class="data_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>
</body>

</html>
