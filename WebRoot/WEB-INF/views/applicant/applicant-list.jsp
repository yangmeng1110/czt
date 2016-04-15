<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>贷款申请人列表</title>
		<%@include file="../include/global.jsp" %>
		<link  rel="stylesheet" type="text/css" href="${ctx }/js/jquery-easyui/themes/default/easyui.css"/>
		<link rel="stylesheet" type="text/css" href="${ctx }/js/jquery-easyui/themes/icon.css"/>
		<script type="text/javascript" src="${ctx }/js/jquery-easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript">
		$(function(){
				loadGrid();
				var height = $(window).height();
				$(".data").height(height-135);
			});
	
		function loadGrid(){
				$("#data").datagrid({
					title:'申请人列表',
					//width:1000,
					url:'${ctx}/applicant/applicantCtrl/getListByPage',
					loadMsg:'数据正在加载，请稍候......',
					striped: true, //隔行变色 
	                nowrap: true, //false:折行  
	                iconCls:'icon-search', 
	                fitColumns:true,//自适应表格宽度
	                columns:[[
	                	{
	                		title:'编号',
	                		field:'id',
	                		align:'center',
	                		width:50
		                	},
	                	{
	                    	title: '姓名',
	                    	field:'realName',
	                    	align: 'center',
	                    	width:100
	                    },  
	                    {
	                    	title: '手机号',
	                    	field:'mobile',
	                    	align: 'center',
	                    	width:100
	                    },  
	                    {
	                    	title: '操作时间',
	                    	field:'operTime',
	                    	align: 'center',
	                    	width:150,
	                    	formatter:function(value,row,index){
	                    		return formatCSTDate(value,'yyyy-MM-dd hh:mm:ss');
	                    	}
	                    },  
	                    {
	                    	title: '车牌号',
	                    	field:'carCode',
	                    	align: 'center',
	                    	width:100
	                  	},
	                    {
	                    	title: '贷款金额',
	                    	field:'loanMoney',
	                    	align: 'center',
	                    	width:100
	                    },
	                    {
	                    	title: '返点金额',
	                    	field:'rebateMoney',
	                    	align: 'center',
	                    	width:100	                    	
	                    },
	                    {
	                    	title: '环节',
	                    	field:'status',
	                    	align: 'center',
	                    	width:100,
	                    	formatter:function(value,row,index){
	                    		if(value==0){return "待处理";}
	                    		if(value==1){return "处理成功";}
	                    		if(value==2){return "处理失败";}
	                    	}
	                    },
	                    {
	                    	title:'申请人批注',
	                    	field:'remark',
	                    	align:'center',
	                    	width:100
	                    },
	                    {
	                    	title:'保险受理状态',
	                    	field:'insuStatus',
	                    	align:'center',
	                    	width:80,
	                    	formatter:function(value,row,index){
	                    		if(row.status==2){return "无需受理";}
	                    		if(value==0){return "待受理";}
	                    		if(value==1){return "受理成功";}
	                    		if(value==2){return "受理失败";}
	                    	}	
	                    },
	                    {
	                    	title:'保险公司批注',
	                    	field:'insuRemark',
	                    	align:'center',
	                    	width:150,
	                    	formatter:function(value,row,index){
	                    		if(row.status==2){return "无需批注";}
	                    		if(value==null){
	                    			return "";
	                    		}
	                    		return value;
	                    	}	
	                    },
	                    {
	                    	title:'操作',
	                    	field:'xx',
	                    	align:'center',
	                    	width:100,
	                    	formatter:function(value,row,index){
	                    		if(value==null){
	                    			return "<a style='color:#63B8FF' href='javascript:void(0);' onclick='showDetail("+row.id+")'>明细</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
	                    								"<a style='color:#63B8FF' href='javascript:void(0);' onclick='deleteInfo("+row.id+")'>删除</a>";
	                    						
	                    		}
	                    	}
	                    }
	                ]],
					 pagination: true,
	                 pageList:[20,30,40],
	                 pageSize:20,
	                 pageNumber:1,
	                queryParams:{
	                	userName:$("#userName").val()
	                }
				});
			}
		function toAdd(){
			var userName = $("#userName").val();
			Dialog.open({
				Title:'新增申请人',
				Width:432,
				Height:245,
				URL:'${ctx}/applicant/applicantCtrl/toAdd?userName='+userName
			});
		} 
		
		function deleteInfo(id){
			Dialog.confirm('你确定要删除这条数据?',function(){
				$.ajax({
					type:'get',
					url:'${ctx}/applicant/applicantCtrl/doDelete?id='+id,
					dataType:'json',
					success:function(msg){
						if(msg.success){
							window.loadGrid();
						}if(msg.success==false){
							Dialog.alert("删除数据失败,点击确定重试?");
							window.loadGrid();
						}
					}
				});
			});
		}	
		
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
    <div class="data_Form" id="data">
    	
    </div>
</div>
<div class="data_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>
</body>

</html>
