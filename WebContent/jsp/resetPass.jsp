<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>半亩田-修改密码</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/personinfo.css">
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script> 
</head>
<body>
<div class="wapper">
<div class="header">
   <a href="/DessertHouse/index2" class="title">半亩田首页</a>
    <div class="float-right">
        <a href="/DessertHouse/chart">购物车</a>
        <a href="/DessertHouse/orders">我的订单</a>
        <a href="/DessertHouse/personalSet">个人信息</a>
        <a href="login.jsp">退出</a>
     </div>
</div>
<div class="container">
<div class="mes">
  我的一亩>个人中心>信息设置
</div>
<div class="detail">
 <div class="ti">
  个人信息
 </div>
 <div class="info">
    <div class="left" id="left">
   <p style="height:26px">旧密码:</p ><p style="height:26px"p>新密码:</p><p style="height:26px">确认新密码:</p>
   </div>
   <div class="right" id="right" style="margin-top:25px">
    <p ><input type='password' class="text-input"  id="oldp" /></p>
   <p><input type='password' class="text-input" id='newp' /></p>
  <p><input type='password' class="text-input" id='newp1' /></p>
   </div>
   <div class="bottom"  id="bottom">
   
  <div class='input'>

  <input type='button' class='input-submit' value='确定' style='width:130px;margin-left:120px;margin-top:20px;float:left' id='confirm'/>
 
  </div>
     
					  
   </div>
   <div class="show_result" >
     <p style="float:left;margin-left:-90px;margin-top:60px" id="update_result"></p>
   </div>
   </div>
 </div>
</div>
</div>
<div class="footer">
	<div class="seperator"></div>
	<div class="footer-info">		
		<p>Copyright@2002-2016 半亩田版权所有</p>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#confirm").click(function(){
		var oldp=$("#oldp").val();
		var newp=$("#newp").val();
		var newp1=$("#newp1").val();
	//	window.location.href='/DessertHouse/test';
		$.ajax({
			url:'/DessertHouse/resetPass',
			async:false,
			data:{
				oldp:oldp,
				newp:newp,
				newp1:newp1
				},
		    dataType:"text",
			type:'post',
			success:function(data){
				if(data=="success\n"){

					window.location.href="/DessertHouse/personalSet";
					}else{		
				$("#update_result").html(data);
			}
			}
			
		});
		});
		
});
</script>
</body>
</html>