//格式化CST
function formatCSTDate(strDate,format){
        return formatDate(new Date(strDate),format);
      }
       
 //格式化日期,
 function formatDate(date,format){
        var paddNum = function(num){
          num += "";
          return num.replace(/^(\d)$/,"0$1");
        }
        //指定格式字符
        var cfg = {
           yyyy : date.getFullYear() //年 : 4位
          ,yy : date.getFullYear().toString().substring(2)//年 : 2位
          ,M  : date.getMonth() + 1  //月 : 如果1位的时候不补0
          ,MM : paddNum(date.getMonth() + 1) //月 : 如果1位的时候补0
          ,d  : date.getDate()   //日 : 如果1位的时候不补0
          ,dd : paddNum(date.getDate())//日 : 如果1位的时候补0
          ,hh : paddNum(date.getHours())  //时
          ,mm :paddNum(date.getMinutes()) //分
          ,ss : paddNum(date.getSeconds()) //秒
        }
        format || (format = "yyyy-MM-dd hh:mm:ss");
        return format.replace(/([a-z])(\1)*/ig,function(m){return cfg[m];});
      } 
      
  //关闭Dialog
  function closeDialog(){
  	Dialog.close();
  }    
  
  /**ajax json拦截未登录*/
  function filterNoLogin(jsonData){
  	if(jsonData.noLogin=='noLogin'){
  		window.top.location.href=ctx+"/index.jsp";	
		return false;
  	}
  	return true;
  }
  
 /**ajax请求提交*/ 
  function CommonAjaxJson(url,param,callback,async){
  	if(async==undefined) async==true;
  	$.ajax({
  		type:"post",
  		async:async,
  		url:url,
  		data:param,
  		dataType:"json",
  		success:function(data){
  			if(filterNoLogin(data)){
  				callback(data);
  			}
  		}
  	});
  }
  
  
  
  
  
  
  
  
  
  
  
  