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
<a href="index.html" class="logo"><img src="../image/tag.jpg" alt="" /></a>
<div class="logo-title" style="margin-left:70px">重置登录密码</div>
<div class="have-account">
<a href="login.jsp">登录</a>-<a href="register.jsp">注册</a>
</div>
</div>
</div>


<div class="main_tape" style="margin-left:0;">

<div class="state_show">
  <div class="process p1" id="process">  
  </div>           
</div>
<div class="tape_area">
  <div class="input_area" id="input_area">
      
    <div class="login-info-input" id="input1">
      用户名：<input type="text" id="username" name="username" placeholder='请输入用户名' class="input-long" /> 
    </div>
     <div class="login-info-input" id="input2">
      手机号：<input type="text" id="tele" name="tele" placeholder='请输入手机号' class="input-long" /> 
    </div>
    
     <div class="login-info-input">
      <input type="button" name="next" class="input-submit" id="next" style="margin-left:40px" value="提交"/> 
      <input type="button" name="next" class="input-submit" id="next1"  style="margin-left:40px;display:none" value="提交"/> 
       <input type="button" name="next" class="input-submit" id="next2"  style="margin-left:40px;display:none" value="提交"/> 
    </div>
    <p id="name_exist" style="margin-left:120px;color:red;display:none">账户名或手机号错误</p>
    <p id="phone_exist" style="margin-left:120px;color:red;display:none">验证问题失败</p>
    <p id="password_exist" style="margin-left:120px;color:red;display:none">密码设置错误</p>
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
</body>
<script type="text/javascript">
$(document).ready(function(){
	 $("#next").click(function(){
			var name=$("#username").val();
			var tel=$("#tele").val();
			
			$("#process").attr("class","process p2");
			$("#input1").html("密保问题：<label style='width:200px;'>您父亲的姓名?</label>");
			$("#input2").html("答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案：<input type='text' name='answer' id='form-equalTopwd' class='field' placeholder='请输入问题的答案' />");
			$(this).css("display","none");
			$("#next1").css("display","block");			
		/**
			$.ajax({

				url:'....',

				data:{

				username:name,

				tele:tel

				},

				type:'post',

				success:function(data){

				console.log("---"+data);

				if(data.msg=="exists"){

				$("#process").attr("class","process p2");

				$("#input1").html("密保问题：<label style='width:200px'>您父亲的姓名?</label>");

				$("#input2").html("答   案：<input type='text' name='answer' id='form-equalTopwd' class='field' placeholder='请输入问题的答案'

				                            />");

				$(this).css("display","none");

				$("#next1").css("display","block");

				}else{

				$("#name_exist").css("display","block");


				      //   view(data.msg);  

				  }

				}


				});
			*/
				});

	 

				$("#next1").click(function(){


				$("#process").attr("class","process p3");

				$("#input1").html("新密码：<input type='password' id='password' name='password' class='input-long' /> ");
				$("#input2").css("display","none");

				$(this).css("display","none");

				$("#next2").css("display","block");


				var answer=$("#answer").val();
/**
				$.ajax({

				url:'....',

				data:{

				answer:answer

				},

				type:'post',

				success:function(data){

				console.log("---"+data);

				if(data.msg=="exists"){

				$("#process").attr("class","process p3");

				$("#input1").html("新密码：<input type='password' id='password' name='password' class='input-long' /> ");
				$("#input2").css("display","none");
				
				$(this).css("display","none");

				$("#next2").css("display","block");

				}else{

				$("#phone_exist").css("display","block");


				      //  view(data.msg);  

				  }

				}


				});
**/
				});

				$("#next2").click(function(){


				$("#process").attr("class","process p4");

				$("#input_area").html("<div class='p5'></div>");


				var name=$("#password").val();
/**
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
**/
				});
   });

</script>
</html>