<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>半亩田</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<script type="text/javascript"src="../js/script.js"></script>
	<script type="text/javascript" src="../js/jquery.js"></script>
</head>
<style type="text/css">
#log{   
    margin-left:50px;
}

</style>
<body>

<div>
<div id="log">

 <a href="../html/index.html"><img src="../image/tag.jpg" alt="" /></a>
					
</div>
</div>

        <div class="wrapper" style="background:url(../image/bc1.jpg)  no-repeat;height:600px">
        
		<div class="login-form-div box">
			<div class="login-form-header">账户登录</div>
			<div class="seperator"></div>
		<section id="content">
		  <form action="/DessertHouse/login" method="post">
		  
			
			
			<div class="login-info-input">
				<input type="text" placeholder="请输入手机号" required="" id="username"  name="account" />
			</div>
			<div class="login-info-input">
				<input type="password" placeholder="请输入密码" required="" id="password" name="password" />
			</div>
			 <div class="login-info-input">
			        <a href="passwordGet.jsp" class="alink" style="float:left" >忘记密码</a>
			    	<a href="register.jsp" class="alink" style="float:right">免费注册</a>
			    </div>
			<div class="login-info-input">
			    	<input type="submit" value="登录" class="input-submit"></input>
			    </div>
			 <%		
			    System.out.println(request.getParameter("error"));
				if(request.getParameter("error") != null && request.getParameter("error").equals("0")){
					
				%>
				<p style="color: red;text-align:center">账户或密码输入不能为空</p>
				<%
				}
				%>
			<%		
			    System.out.println(request.getParameter("error"));
			if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
			
				%>
				<p style="color: red;text-align:center">您的账号或密码有误</p>
				<%
				}
				%>
		</form><!-- form -->
		
	    </section><!-- content -->
				  

		</div>
</div>
<div class="footer">
	<div class="seperator"></div>
	<div class="footer-info">
		
		<p>Copyright@2002-2016 半亩田版权所有</p>
	</div>
</div>
</body>
</html>