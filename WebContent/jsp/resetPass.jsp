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
    <div class="title">半亩田</div>
    <div class="float-right">
        <a href="">购物车</a>
        <a href="">我的订单</a>
        <a href="">设置</a>
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
   <p >旧密码:</p><p>新密码:</p><p >确认新密码:</p>
   </div>
   <div class="right" id="right">
    <p><input type='password' class="text-input"  id="oldp" /></p>
   <p><input type='password' class="text-input" id='newp' /></p>
  <p><input type='password' class="text-input" id='newp1' /></p>
   </div>
   <div class="bottom" id="bottom">
  <div class='input'>
  <input type='button' class='input-submit' value='确定' style='width:130px;margin-left:120px;margin-top:20px;float:left' id='confirm'/>
  </div>
  <p id="update_result" style="margin-left:120px;color:red;display:none">修改失败</p>
					  
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
		$.ajax({
			url:'....',
			data:{
				oldp:oldp,
				newp:newp,
				newp1:newp1
				},
			type:'post',
			success:function(data){
				console.log("---"+data);
				if(data.msg=="success"){
					alert("修改成功");
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