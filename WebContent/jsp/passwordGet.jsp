<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>重置密码</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
	<link rel="stylesheet" type="text/css" href="../css/register.css">
	<link rel="stylesheet" type="text/css" href="../css/test.css">
	<link rel="stylesheet" type="text/css" href="../css/reset.css">
	<link rel="stylesheet" type="text/css" href="../css/process.css">
	<link rel="stylesheet" type="text/css" href="../css/stepflex.css">
	<script type="text/javascript"src="../js/script.js"></script>
	<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script>
</head>
<style type="text/css">
.have-account a{
    font-size:15px;
}
.have-account a:hover{
    color: #C81623;
}
</style>
<body>
<div class="wrapper">
<div class="header1">
<div class="logo-con w clearfix">
<a href="index.html" class="logo"><img src="../images/mu3.png" alt="" /></a>
<div class="logo-title" style="margin-left:70px">重置登录密码</div>
<div class="have-account">
<a href="login.jsp">登录</a>-<a href="register.jsp">注册</a>
</div>
</div>
</div>


<div class="main_tape">
<div class="state_show">
  <div class="process p1" id="process">  
  </div>           
</div>
<div class="tape_area">
  <div class="input_area" id="input_area">
    <div class="login-info-input" id="input">
      用户名：<input type="text" id="username" name="username" class="input-long" /> 
    </div>
    
     <div class="login-info-input">
      <input type="button" name="next" class="input-submit" id="next" style="margin-left:40px" value="提交"/> 
    </div>
    <p id="name_exist" style="margin-left:120px;color:red;display:none">用户名不存在</p>
    <p id="phone_exist" style="margin-left:120px;color:red;display:none">手机号不存在</p>
    <p id="password_exist" style="margin-left:120px;color:red;display:none">密码设置错误</p>
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
</body>
<script type="text/javascript">
$(document).ready(function(){
	$("#next").click(function(){
		var name=$("#username").val();
		$.ajax({
			url:'....',
			data:{
				username:name
				},
			type:'post',
			success:function(data){
				console.log("---"+data);
				if(data.msg=="exists"){
					$("#process").attr("class","process p2");
					$("#input").html("手机号码：<input type='text' id='tele' name='tele' class='input-long' /> ")
					$(this).attr("id","next1");
				}else{
					$("#name_exist").css("display","block");
					
		      //   view(data.msg);  
				  }
			}
			
		});
		});

	$("#next1").click(function(){
		var name=$("#tele").val();
		$.ajax({
			url:'....',
			data:{
				tele:name
				},
			type:'post',
			success:function(data){
				console.log("---"+data);
				if(data.msg=="exists"){
					$("#process").attr("class","process p3");
					$("#input").html("新密码：<input type='password' id='password' name='password' class='input-long' /> ");
					$(this).attr("id","next2");
				}else{
					$("#phone_exist").css("display","block");
					
		       //  view(data.msg);  
				  }
			}
			
		});
		});
	$("#next2").click(function(){
		var name=$("#password").val();
		$.ajax({
			url:'....',
			data:{
				password:name
				},
			type:'post',
			success:function(data){
				console.log("---"+data);
				if(data.msg=="exists"){
					$("#process").attr("class","process p4");
					$("#input_area").html("<div class='p5'></div>");
				}else{
					$("#password_exist").css("display","block");
					
		        // view(data.msg);  
				  }
			}
			
		});
		});

	
});

</script>
</html>