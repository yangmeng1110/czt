<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>返点投表</title>
<%@include file="../include/global.jsp" %>
<link type="text/css" rel="stylesheet" href="${ctx }/js/jquery-pagination/pagination.css"></link>
<script type="text/javascript" src="${ctx }/js/jquery-pagination/jquery.pagination.js"></script>
<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<input type="hidden" id="userName" value="${param.userName }"/>
<div class="top">
	<div class="top_logo"><a href="${ctx}/washcar/washcarCtrl/goWashCarMgr"><img src="${ctx }/images/bt.png"/></a></div>
    <div class="top_name"><span style="float:left;">当前用户:${loginUser.realName }<a href="${ctx }/login/loginCtrl/logOut">退出</a></span></div>
</div>
<div class="data">
	<div class="data_btn_lin">
    	<div class="data_Date data_line">时间：</div>
        <div class="data_Date data_width"><input name="date_from" id="date_from" onclick="WdatePicker();" type="text" /></div>
        <div class="data_Date data_line">
        	<div class="data_div"></div>
        </div>
        <div class="data_Date data_width1"><input name="date_to" id="date_to" onclick="WdatePicker();" type="text" /></div>
        <div class="data_Date data_line">车牌号：</div>
        <div class="data_Date data_width1"><input name="carCode" type="text" id="carCode"/></div>
    	<div class="data_btn"><a href="javascript:InitTable(page);">查询</a></div>
    </div>
    <div class="data_Form">
     <div class="Total"><div>合计申请：<span id="showCount"></span>辆</div><div>借款总额：<span id="showLoanMoney"></span>元</div><div>返点总额：<span id="showRebateMoney"></span>元</div></div>
    	<div id="data"></div>
    </div>
    	<div id="Pagination" style="margin:20px 0 0 45%;"></div>
</div>
<div class="data_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>

<script type="text/javascript">
	var rows = 15;
	var page = 0;
	 $(function() {         
        InitTable(page);   //Load事件，初始化表格数据，页面索引为0（第一页）  
        var height = $(window).height();
		$(".data").height(height-135);
    }); 
      //请求数据  
        function InitTable(page) {    
        	var params={
        		page:(page+1),
        		rows:rows,
        		status:1,
        		userName:$("#userName").val(),
        		carCode:$.trim($("#carCode").val()),
        		date_from:$("#date_from").val(),
        		date_to:$("#date_to").val()
        		}	              
        	CommonAjaxJson("${ctx}/applicant/applicantCtrl/getListByPage", $.param(params),
        		function(data) {  
                	var total = data.total;
                	 var loanMoney = 0;
                	 var rebateMoney = 0;
                	var html = '<ul class="data_Form_back" id="uu1">'+
			        	'<li class="data_Form_width4"><span style="padding-left:15px;">序号</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">时间</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">姓名</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">车牌号</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">借款金额</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">返点金额</span></li> </ul>';
                	$.each(data.rows,function(n,value){
                		loanMoney += value.loanMoney;
                		rebateMoney += value.rebateMoney;
                		html +=  '<ul class="data_color"><li class="data_Form_width4"><span style="padding-left:15px;">'+value.id+'</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">'+formatCSTDate(value.operTime,'yyyy-MM-dd hh:mm:ss')+'</span></li>'+
			            '<li class="data_Form_width3"><span style="padding-left:15px;">'+value.realName+'</span></li>'+
			           '<li class="data_Form_width3"><span style="padding-left:15px;">'+value.carCode+'</span></li>'+
			           ' <li class="data_Form_width3"><span style="padding-left:15px;">'+value.loanMoney+'</span></li>'+
			           ' <li class="data_Form_width3"><span style="padding-left:15px;">'+value.rebateMoney+'</span></li></ul>';
                	});             
                	$("#showCount").text(data.rows.length);
                	$("#showLoanMoney").text(loanMoney);
                	$("#showRebateMoney").text(rebateMoney);
                	$("#data").html(html);  
                	 pagination(page,rows,total);
                }  
        	);	   
        }  
    
    //翻页调用  
        function PageCallback(index, jq) {             
            InitTable(index);  
        }  
    
    //分页
    function pagination(page,rows,total){
  		 $("#Pagination").pagination(total, {  
            callback: PageCallback,  
            prev_text: '上一页',     
            next_text: '下一页',  
            items_per_page: rows,  //显示条数  
            num_display_entries: 4,    //连续分页主体部分分页条目数  
            current_page: page,   //当前页索引  
            num_edge_entries: 2        //两侧首尾分页条目数  
        });  
    }
</script>
</body>
</html>
