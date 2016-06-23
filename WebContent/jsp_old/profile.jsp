<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人资料</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/component.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/date.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<style>
.btn{
    text-align:center;
    cursor:pointer;
	padding:10px 10px;
	font-family: 'ambleregular';
	background:#FC7D01;
	color: #FFF;
	text-decoration: none;
	outline: 0;
}
.btn:hover{
	  text-shadow: 0px 0px 1px #000;
	  background:#292929;
}
    input{padding:8px 5px;width:18.5%;display:block; border-radius:3px;border:1px solid #ddd;outline:none;text-align:center;color:#666;box-shadow: 2px 2px 5px 0px rgba(50, 50, 50, 0.35);}
input:focus{border-color:#ccc;color:#333;}
</style>
</head>
<body>
<div class="header">
  	  		 <div class="headertop_desc">
			<div class="wrap">
					<div class="nav_list">
					<ul>
						<li><a href="/DessertHouse/index">首页</a></li>
						<li><a href="/DessertHouse/reserve">预定产品</a></li>
						<li><a href="/DessertHouse/reserveActivity">购买活动票</a></li>
						<li><a href="/DessertHouse/reserveSoil">租赁土地</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
						<%
						    String name = (String)request.getServletContext().getAttribute("account_name");
						    if(name == null){
						%>
							<li><a href="login.jsp" target="_blank">请登录</a></li>
							<li><a href="register.jsp" target="_blank">免费注册</a></li>
						<%
						    }else{
						%>
						    <li><a href="#" target="_blank">欢迎你，<%=name %></a></li>
						<%
						    }
						%>
							<li><a href="/DessertHouse/account.action">我的会员卡</a></li>
						<li><a href="/DessertHouse/profile.action">我的个人详情</a></li>
						
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.jsp"><img src="../images/logo3.png" alt="" /></a>
					</div>
						<div class="header_top_right">
							 
						 <div class="clear"></div>
					</div>
			 <div class="clear"></div>
  		</div>     
				
   		</div>
   </div>
					<li><a href="editprofile.jsp">修改个人详情</a></li>

	    <div class="main">
 	<div class="wrap">
     <div class="content">
	  <div class="section group">
    
    
    
     
		<h1>个人信息</h1>
			<form method="post" action="/DessertHouse/profile">
               <script type="text/javascript" src="../js/date.js"></script>
              				用户名：<input name="username" 		value=<%=(String)request.getServletContext().getAttribute("account_name")%>>
		
                            密码：<input name="password" 		value=<%=(String)request.getServletContext().getAttribute("password")%>>
		
                            邮箱：<input name="email" 		value=<%=request.getServletContext().getAttribute("email")%>>
		
                            生日：<input name="birthday"	value=<%=request.getServletContext().getAttribute("birthday")%>>
		联系电话：<input name="phone"			value=<%=request.getServletContext().getAttribute("phone")%>>
		          
                            银行卡号：<input name="bankid" 			value=<%=request.getServletContext().getAttribute("bankid")%>>
		
			    
			</form>          
    </div>
      </div>
        </div>
          </div>
</body>
</html>