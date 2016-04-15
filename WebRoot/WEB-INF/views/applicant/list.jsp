<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>贷款申请人列表</title>
		<%@include file="../include/global.jsp" %>
		<link type="text/css" rel="stylesheet" href="${ctx }/js/jquery-pagination/pagination.css"></link>
		<script type="text/javascript" src="${ctx }/js/jquery-pagination/jquery.pagination.js"></script>
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
    	<div id="data"></div>
    </div>
    	<div id="Pagination" style="margin:20px 0 0 45%;"></div>
</div>
<div class="data_bottom">迅贷网全国服务电话：400-860-9508&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;江苏微银金融信息技术服务有限公司</div>

<script type="text/javascript">
			var page=0;
			var rows = 18;
			$(function(){
				InitTable(page);
				var height = $(window).height();
				$(".data").height(height-135);
			});
			
			function InitTable(page){
				var params={
					page:(page+1),
        			rows:rows,
        			userName:$("#userName").val()
				}
				CommonAjaxJson("${ctx}/applicant/applicantCtrl/getListByPage", $.param(params),
					function(data) {  
	                	 total = data.total;
	                	var html = '<ul class="data_Form_back">'+
				        	'<li class="data_Form_width2"><span style="padding-left:15px;">序号</span></li>'+
				            '<li class="data_Form_width"><span style="padding-left:15px;">姓名</span></li>'+
				            '<li class="data_Form_width"><span style="padding-left:15px;">手机号</span></li>'+
				           '<li class="data_Form_width"><span style="padding-left:15px;">车牌号</span></li>'+
				            '<li class="data_Form_width"><span style="padding-left:15px;">状态</span></li>'+
				            '<li class="data_Form_width"><span style="padding-left:15px;">返点金额</span></li>'+
				            '<li class="data_Form_width"><span style="padding-left:15px;">申请时间</span></li>'+
				            '<li class="data_Form_width1"><span style="padding-left:15px;">操作</span></li></ul>';
	                	$.each(data.rows,function(n,value){
	                		html +=  '<ul class="data_color"><li class="data_Form_width2"><span style="padding-left:15px;">'+value.id+'</span></li>'+
					            '<li class="data_Form_width"><span style="padding-left:15px;">'+value.realName+'</span></li>'+
					           '<li class="data_Form_width"><span style="padding-left:15px;">'+value.mobile+'</span></li>'+
					           '<li class="data_Form_width"><span style="padding-left:15px;">'+value.carCode+'</span></li>'+
					            '<li class="data_Form_width"><span style="padding-left:15px;"><span>'+StatusResult(value.status)+'</span></li>'+
					            '<li class="data_Form_width"><span style="padding-left:15px;">'+value.loanMoney+'</span></li>'+
					            '<li class="data_Form_width"><span style="padding-left:15px;">'+formatCSTDate(value.operTime,'yyyy-MM-dd hh:mm:ss')+'</span></li>'+
					           '<li class="data_Form_width1"><span style="padding-left:15px;"><a href="javascript:deleteInfo('+value.id+');">删除</a><a href="#">查看进度</a></span></li> </ul>';
	                	});             
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
    
    function deleteInfo(id){
    	Dialog.confirm("是否确认删除?",function(){
    		CommonAjaxJson("${ctx}/applicant/applicantCtrl/doDelete","id="+id,
    			function(msg){
						if(msg.success){
							window.InitTable(0);
						}if(msg.success==false){
							Dialog.alert("删除数据失败,点击确定重试?");
							window.InitTable(0);
						}
					} 
    		);
    	});
    }
    
    //显示处理状态
    function StatusResult(status){
    	if(status==0){return "待处理";}
    	if(status==1){return "处理通过";}
    	if(status==2){return "处理失败";}
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
		</script>
</body>
</html>
