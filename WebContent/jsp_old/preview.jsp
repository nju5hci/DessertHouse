<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<head>
<title>Preview</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>

<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/component.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
</head>
<body>
	<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
					<li><a href="/DessertHouse/index">首页</a></li>
						<li><a href="/DessertHouse/reserve">预定产品</a></li>
						<li><a href="/DessertHouse/payed">已下订单</a></li>
						<li><a href="/DessertHouse/assess">评价产品</a></li>
					
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
					<a href="/DessertHouse/index"><img src="../images/mu3.png" alt="" /></a>
					</div>
						
						 
			   <div class="clear"></div>
  		    </div>     				
   		</div>
   </div>
   <div class="main">
   	 <div class="wrap">
   	 	<div class="content_top">
    		<div class="back-links">
    	  </div>
    		<div class="clear"></div>
    	</div>
   	 	<div class="section group">
   	 		
				<div class="cont-desc span_1_of_2">
				  <div class="product-details">				
					<div class="grid images_3_of_2">
					<%
						    int dessertid = (int)request.getServletContext().getAttribute("dessertid");
					 int dessertStock = (int)request.getServletContext().getAttribute("dessertStock");
				    	
					    	String dessertName=(String)request.getServletContext().getAttribute("dessertName");
					    	double dessertPrice=(double)request.getServletContext().getAttribute("dessertPrice");
					    	
					    	String dessertInfo=(String)request.getServletContext().getAttribute("dessertInfo");
					    	
					    	String dessertPicAdd=(String)request.getServletContext().getAttribute("dessertPicAdd");
					    	
						%>
						<img src=<%=dessertPicAdd %>  alt="" />
				  </div>
				<div class="desc span_3_of_2">
		
					<h2><%=dessertName %> </h2>
					<p><%=dessertid %> </p>					
					<div class="price">
						<p>参考价格: <span><%=dessertPrice %> </span></p>
						<p>剩余库存: <span><%=dessertStock %> </span></p>
					</div>
					<div class="availables">
						<ul>
						 
					    </ul>
					</div>
				<div class="share-desc">
					
					<form method="post" action="/DessertHouse/addReserve">
					<%
                if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
                %>
                        <p style="color: red;">库存不足无法下单</p>
                <%
                }
              
                %>
						<%
                if(request.getParameter("error") != null && request.getParameter("error").equals("2")){
                %>
                        <p style="color: red;">卡已终止不可再预订</p>
                <%
                }
              
                %>
                	<%
                if(request.getParameter("error") != null && request.getParameter("error").equals("3")){
                %>
                        <p style="color: red;">该卡已经停用，需要重新激活</p>
                <%
                }
              
                %>
					
                <script type="text/javascript" src="../js/date.js"></script>
              				
                            产品数量：<input type="text" name="num" value=""/>
                            </br>
                            选择日期：<input name="reservedate" type="text" value="" size="14" readonly onClick="showcalendar(event,this);" onFocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''">
                      
			    <input type="submit" value="确认预定"  class="btn">
			</form>   			
					<div class="clear"></div>
				</div>
				
			</div>
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			 <h2>Details :</h2>
			 <p><%=dessertInfo %> </p>
			 <div class="clear"></div>
			  </div>
			    <div class="component">
		<table>
			<thead>
				<tr>
				<th>评论内容</th>
    	                <th>用户ID</th>
					
					<th>日期</th>
					
				</tr>
			</thead>
			<%
            String[] words_assess = (String[])request.getServletContext().getAttribute("words_assess");
			
			if(words_assess != null){
				
			  int[] memberId_assess = (int[])request.getServletContext().getAttribute("memberId_assess");
				
			   String[] time_assess = (String[])request.getServletContext().getAttribute("time_assess");
			   int assessNum = (Integer)request.getServletContext().getAttribute("assessNum");
			 
			   %>
			<tbody>
			<% 
			   for(int i = 0;i<assessNum;i++){
				
			%>
				<tr><td><%=words_assess[i] %></td><td><%=memberId_assess[i] %></td><td><%=time_assess[i] %></td></tr>
			<%
			   }%>
	
			<% 	}
			%>
		
			</tbody>
		</table>
		
		
		
	</div>
	<div class="clear"></div>
   </div>
				
 		 		 </div>
   	 		</div>
        </div>
   <div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
                    <h4><b>相关信息</b></h4>
                    <ul>
                        <li><a href="info.jsp">关于我们</a></li>
						<li><a href="help.jsp">帮助中心</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4><b>后台入口</b></h4>
                    <ul>
						<li><a href="login.jsp" target="_blank">管理员登录</a></li>
					
                    </ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4><b>联系方式</b></h4>
                    <ul>
                        <li><span>+91-123-456789</span></li>
                        <li><span>+00-123-000000</span></li>
                    </ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4><b>链接分享</b></h4>
                    <div class="social-icons">
                        <ul>
							 <li><a href="#" target="_blank"><img src="../images/facebook.png" alt="" /></a></li>
							 <li><a href="#" target="_blank"><img src="../images/twitter.png" alt="" /></a></li>
							 <li><a href="#" target="_blank"><img src="../images/skype.png" alt="" /> </a></li>
							 <li><a href="#" target="_blank"><img src="../images/linkedin.png" alt="" /></a></li>
							 <div class="clear"></div>
                        </ul>
                    </div>
				</div>
			</div>
			 <div class="copy_right">
				<p>Copyright &copy; 2016.Company name All rights reserved.</p>
		   </div>			
        </div>
    </div>
   <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>

