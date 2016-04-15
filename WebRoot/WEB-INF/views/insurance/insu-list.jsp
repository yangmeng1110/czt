<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>保险公司</title>
		<%@include file="../include/global.jsp" %>
		<link type="text/css" rel="stylesheet" href="${ctx }/js/jquery-pagination/pagination.css"></link>
		<script type="text/javascript" src="${ctx }/js/jquery-pagination/jquery.pagination.js"></script>
		<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="top">
	<div class="top_logo"></div>
    <div class="top_name"><span style="float:left;">当前用户:${loginUser.realName }<a href="${ctx }/login/loginCtrl/logOut">退出</a></span></div>
</div>
<div class="data">
	<div class="data_btn_lin">
    	<div class="data_Date data_line">时间：</div>
        <div class="data_Date data_width"><input id="date_from" name="date_from" type="text" onclick="WdatePicker()"/></div>
        <div class="data_Date data_line">
        	<div class="data_div"></div>
        </div>
        <div class="data_Date data_width1"><input id="date_to" name=date_to"" type="text"  onclick="WdatePicker()"/></div>
        <div class="data_Date data_line">处理状态：</div>
        <div class="data_Date data_width2">
        	<select name="insuStatus" id="insuStatus">
        		<option value="">全部</option>	
        		<option value="0">待受理</option>
        		<option value="1">受理成功</option>
        		<option value="2">受理失败</option>
        	</select>	
        </div>
    	<div class="data_btn"><a href="javascript:InitTable(0);">查询</a></div>
    </div>
    <div id="data" class="data_Form">
    	<div id="data"></div>
</div>
<div id="Pagination" style="margin:20px 0 0 45%;"></div>
</div>
<div class="data_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>

<script type="text/javascript">
		var rows = 10;	
		var page=0;
		$(function(){
			InitTable(page);
			var height = $(window).height();
			$(".data").height(height-135);
		});
		
		function InitTable(page){
			var params={
				page:(page+1),
        		rows:rows,
        		status:1,
        		insuStatus:$("#insuStatus").val(),
        		carCode:$.trim($("#carCode").val()),
        		date_from:$("#date_from").val(),
        		date_to:$("#date_to").val()
			};
			 $.ajax({   
                type: "post",  
                dataType: "json",  
                url: "${ctx}/applicant/applicantCtrl/getListByPage",  
                data:$.param(params),             
                success: function(data) {  
                	 total = data.total;
                	var html ='<ul class="data_Form_back">'+
					        	'<li class="data_Form_width2"><span style="padding-left:15px;">序号</span></li>'+
					            '<li class="data_Form_width1"><span style="padding-left:15px;">时间</span></li>'+
					            '<li class="data_Form_width5"><span style="padding-left:15px;">姓名</span></li>'+
					            '<li class="data_Form_width1"><span style="padding-left:15px;">手机号</span></li>'+
					            '<li class="data_Form_width5"><span style="padding-left:15px;">处理状态</span></li>'+
					            '<li class="data_Form_width1"><span style="padding-left:15px;">备注</span></li>'+
					            '<li class="data_Form_width1"><span style="padding-left:15px;">操作</span></li></ul>';
                	$.each(data.rows,function(n,value){
                		html +=   '<ul class="data_color"><li class="data_Form_width2"><span style="padding-left:15px;">'+value.id+'</span></li>'+
						            '<li class="data_Form_width1"><span style="padding-left:15px;">'+formatCSTDate(value.operTime,'yyyy-MM-dd hh:mm:ss')+'</span></li>'+
						           ' <li class="data_Form_width5"><span style="padding-left:15px;">'+value.realName+'</span></li>'+
						            '<li class="data_Form_width1"><span style="padding-left:15px;">'+value.mobile+'</span></li>'+
						           ' <li class="data_Form_width5"><span style="padding-left:15px;">'+StatusResult(value.insuStatus)+'</span></li>'+
						            '<li class="data_Form_width1"><span style="padding-left:15px;">'+insuRemarkResult(value.insuRemark)+'</span></li>'+
						            '<li class="data_Form_width1"><span style="padding-left:15px;"><a href="javascript:dealInfo('+value.id+','+value.insuStatus+')">处理</a></span></li></ul>';
                	});             
                	$("#data").html(html);  
                	 pagination(page,rows,total);
                }  
            });      
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
	
	function dealInfo(id,insuStatus){
		if(insuStatus==1 || insuStatus==2){
			Dialog.alert("已受理");
			return;
		}
			Dialog.open({
					Title:'受理保险',
					Width:432,
					Height:185,
					URL:'${ctx}/insurance/insuranceCtrl/toModify?id='+id
			});
	}
	
	//显示保险受理状态
    function StatusResult(insuStatus){
    	if(insuStatus==0){return "待受理";}
    	if(insuStatus==1){return "受理成功";}
    	if(insuStatus==2){return "受理失败";}
    }
    
    //显示保险受理批注
    function insuRemarkResult(insuRemark){
    	if(insuRemark==null || insuRemark==''){
    		return "无"
    	}
    	return insuRemark;
    }
		</script>
</body>
</html>
