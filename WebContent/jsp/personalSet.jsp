<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>半亩田-个人信息</title>
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
    <div class="left"id="left">
    <p  >会员编号:</p>
 <p> 用户名:</p>
 <p> 密  码:</p>
   <p>手机号:</p>
   <p>银行卡号:</p>
   </div>
   <div class="right" id="right">
   <p id="memberid"><%=request.getServletContext().getAttribute("memberId")%></p>
    <p id="name"> <%=request.getServletContext().getAttribute("membername")%></p>
     <p id="pass">  <%=request.getServletContext().getAttribute("password")%></p>
   <p id="tele"><%=request.getServletContext().getAttribute("phone")%></p>
   <p id="acc"><%=request.getServletContext().getAttribute("bankid")%></p>
   </div>
   <div class="bottom" id="bottom">
   <div class="input" id="input">
   <input type="button" class="input-submit" id="Update" value="修改信息" style="width:20%;margin-left:80px;float:left"/>
   <input type="button" class="input-submit" id="updateP" value="修改密码" style="width:20%;margin-left:30px;float:left"/>
   </div>
   </div>
   <div class="show_result">
     <p style="float:left;margin-left:-90px;margin-top:40px" id="update_result"></p>
   </div>
   </div>
 </div>
</div>
</div>
<div class="footer">
	<div class="seperator"></div>
	<div class="footer-info">		
		<p>Copyright@2002-2016 一亩e田版权所有</p>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#updateP").click(function(){
		window.location.href="resetPass.jsp";		
	});
	var name;
	$("#Update").click(function(){
		name=$("#name").html();
		var pass=$("#pass").html();
		var tele=$("#tele").html();
		var acc=$("#acc").html();
		
		//var mystring="<input type='text' class='text-input' name='account' id='account' placeholder='"+acc+"''>";

		$("#acc").html("<input type='text' class='text-input' name='account' id='account' placeholder='"+acc+"''>");
		$("#tele").html("<input type='text' class='text-input' style='margin-top:-4px' name='phone' id='phone' placeholder='"+tele+"''>");
		$("#updateP").css("display","none");
		$("#input").html("<input type='button' class='input-submit' id='save' value='确定' onclick='updateInfo()'style='width:20%;margin-left:140px;float:left'/>");
		
		});
	
		
	
});
function updateInfo(){
	//alert("name");
	var bankaccount=$("#account").val();

	var tele=$("#phone").val();
	$.ajax({
		url:'/DessertHouse/updateInfo',
		
		data:{
			bank:bankaccount,
			tele:tele			
			},
		type:'post',
		success:function(data){
			if(data=="success\n"){
				window.location.href="/DessertHouse/personalSet";
			}else{
				$("#update_result").html(data);
				$("#update_result").css("display","block");		
	  
			  }
		}
});
}
</script>
</body>
</html>