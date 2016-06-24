<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的一亩-我的订单</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/personinfo.css">
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script> 
</head>
<body>
<div class="wapper">
<div class="header">
    <div class="title"><a href="../html/index.html">一亩e田</a></div>
    <div class="float-right">
        <a href="">购物车</a>
        <a href="">我的订单</a>
        <a href="personalSet.jsp">设置</a>
        <a href="">退出</a>
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
 <p> 用户名:</p>
 <p> 密  码:</p>
   <p>手机号:</p>
   <p>银行卡号:</p>
   </div>
   <div class="right" id="right">
   <p id="memberid">会员id:<%=(String)request.getServletContext().getAttribute("account_name")%></p>
    <p id="name"> 用户名:<%=request.getServletContext().getAttribute("membername")%></p>
     <p id="pass"> 密  码:*******</p>
   <p id="tele">手机号:<%=request.getServletContext().getAttribute("phone")%></p>
   <p id="acc">银行卡号:<%=request.getServletContext().getAttribute("bankid")%></p>
   </div>
   <div class="bottom" id="bottom">
   <div class="input" id="input">
   <input type="button" class="input-submit" id="Update" value="修改" style="width:20%;margin-left:80px;float:left"/>
   <input type="button" class="input-submit" id="updateP" value="修改密码" style="width:20%;margin-left:30px;float:left"/>
   </div>
   </div>
   <p id="update_result" style="margin-left:120px;color:red;display:none">修改失败</p>
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
		
		var mystring="<input type='text' class='text-input' name='account' id='account' placeholder='"+acc+"''>";

		$("#acc").html("<input type='text' class='text-input' name='account' id='account' placeholder='"+acc+"''>");
		$("#tele").html("<input type='text' class='text-input' name='tele' id='tele' placeholder='"+tele+"''>");
		$("#updateP").css("display","none");
		$("#input").html("<input type='button' class='input-submit' id='save' value='确定' style='width:20%;margin-left:140px;float:left'/>");
		
		});
	$("#save").click(function(){
		alert(name);
		var tele=$("#tele").html;
		var acc=$("#acc").html;
		$.ajax({
			url:'....',
			data:{
				name:name,
				tele:tele,
				acc:acc
				
				},
			type:'post',
			success:function(data){
				console.log("---"+data);
				if(data.msg=="success"){
					window.location.href="personalSet.jsp";
				}else{
					
					$("#update_result").css("display","block");		
		        // view(data.msg);  
				  }
			}
			
		});
		});
		
	
});
</script>
</body>
</html>