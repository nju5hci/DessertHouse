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
    <p> xxx</p>
 <p><span>xxxx</span></p>
   <p>xxxx</p>
   <p>xxx</p>
   </div>
   <div class="bottom" id="bottom">
   <div class="login-info-input">
   <input type="button" class="input-submit" value="修改" style="width:130px;margin-left:10px;float:left"/>
   <input type="button" class="input-submit" id="updateP" value="修改密码" style="width:130px;margin-left:30px;float:left"/>
   </div>
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
});
</script>
</body>
</html>