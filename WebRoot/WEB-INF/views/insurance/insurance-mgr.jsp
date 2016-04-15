<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>保险公司</title>
		<%@include file="../include/global.jsp" %>
		<link  rel="stylesheet" type="text/css" href="${ctx }/js/jquery-easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="${ctx }/js/jquery-easyui/themes/icon.css"/>
		<script type="text/javascript" src="${ctx }/js/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="${ctx }/js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
			$(function(){
				loadGrid();
			});
		
			function loadGrid(){
				$("#data").datagrid({
					title:'申请人列表',
					//width:1000,
					height:500,
					url:'${ctx}/applicant/applicantCtrl/getListByPage',
					loadMsg:'数据正在加载，请稍候......',
					striped: true, //隔行变色 
	                nowrap: true, //false:折行  
	                iconCls:'icon-search', 
	                fitColumns:true,//自适应表格宽度
	                columns:[[
	                	{title:'编号',field:'id',align:'center',width:50},
	                	{title: '姓名',field:'realName',align: 'center',width:100},  
	                    {title: '手机号',field:'mobile',align: 'center',width:100},  
	                    {title: '操作时间',field:'operTime',align: 'center',width:150,
	                    	formatter:function(value,row,index){
	                    		return formatCSTDate(value,'yyyy-MM-dd hh:mm:ss');
	                    	}
	                    },  
	                    {title: '车牌号',field:'carCode',align: 'center',width:100},
	                    {title: '贷款金额',field:'loanMoney',align: 'center',width:100},
	                    {title: '返点金额',field:'rebateMoney',align: 'center',width:100
	                    },
	                    {title:'申请人处理环节',field:'status',align:'center',
	                    	formatter:function(value,row,index){
	                    		if(value==0){return "待处理";}
	                    		if(value==1){return "处理成功";}
	                    		if(value==2){return "处理失败";}
	                    	}
	                    },
	                    {title: '保险受理状态',field:'insuStatus',align: 'center',width:100,
	                    	formatter:function(value,row,index){
	                    		if(value==0){return "待受理";}
	                    		if(value==1){return "受理成功";}
	                    		if(value==2){return "处理失败";}
	                    	}
	                    },
	                    {title:'保险公司批注',field:'insuRemark',align:'center',width:100 },
	                    {title:'操作',field:'xx',align:'center',width:100,
	                    	formatter:function(value,row,index){
	                    		if(row.insuStatus !=0 ){
	                    			return "保险已受理";
	                    		}
	                    		return "<a style='color:#63B8FF' href='javascript:void(0);' onclick='dealInfo("+row.id+","+row.status+")'>处理</a>";
	                    	}
	                    }
	                ]],
					 pagination: true,
	                 pageList:[20,30,40],
	                 pageSize:20,
	                 pageNumber:1,
	                queryParams:{
	                	insuStatus:$("#insuStatus").val(),
	                	date_from:$("#date_from").val(),
	                	date_to:$("#date_to").val()
	                }
				});
			}

	function dealInfo(id,status){
		if(status==0){
			Dialog.alert("申请人正在等待处理，清稍后再试!");
		}
		if(status==2){
			Dialog.alert("申请人处理失败，无需保险!!");
		}if(status==1){
			Dialog.open({
					Title:'受理保险',
					Width:432,
					Height:185,
					URL:'${ctx}/insurance/insuranceCtrl/toModify?id='+id
			});
		}
	}
		</script>
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
        		<option value=""></option>	
        		<option value="0">待受理</option>
        		<option value="1">受理成功</option>
        		<option value="2">受理失败</option>
        	</select>	
        </div>
    	<div class="data_btn"><a href="javascript:loadGrid();">查询</a></div>
    </div>
    <div id="data" class="data_Form">
    	
</div>
</div>
<div class="data_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>
</body>
</html>
