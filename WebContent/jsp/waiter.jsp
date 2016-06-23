<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理分店员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
    <script type="text/javascript">
$(function(){

   $(".a").hide();
   $(".b").hide();
});
</script>
</head>
<body>
	<div class="header">
  	  		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="">首页</a></li>
						<li><a href="/MStores/list">影片场次</a></li>
						<li><a href="http://www.wandafilm.com/jingxuan/main.jsp">电影谈资</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
						<%
						    int branchid = (int)request.getServletContext().getAttribute("branchid");
					    
						%>
						    <li><a href="#" target="_blank">分店id，<%=branchid %></a></li>
						
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
							  <div class="search_box">
					     		<form>
					     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
					     		</form>
					     	</div>
						 <div class="clear"></div>
					</div>
			 <div class="clear"></div>
  		</div>     
			
   		</div>
   </div>
   <!------------End Header ------------>
    <div class="main">
  	<div class="wrap">
      <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>New Products</h3>
    		</div>
    	</div>
    	   <div class="section group">
                         <% 
                               int[] id_waiter = (int[])request.getServletContext().getAttribute("id_waiter");
                        		String[] name_waiter = (String[])request.getServletContext().getAttribute("name_waiter");
                        		
                        		int num_waiter = (Integer)request.getServletContext().getAttribute("num_waiter");
                        		for(int i = 0;i<num_waiter;i++){
                	     %>
                	     	<div class="grid_1_of_5 images_1_of_5">
					 		 <a href="/DessertHouse/waiter"><img src="../images/ren/7.jpg" alt="" /></a>
					 <h2><a href="preview.jsp"><%=name_waiter[i] %></a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=id_waiter[i] %></span></p>
					    </div>
					       		<div class="add-cart">
					       		<form action="/DessertHouse/deleteWaiter" method="post">	
					       		<input class='a' type="text" name="waiterid" value= <%=id_waiter[i] %>>
					       			<input class='b' type="text" name="branchid" value= <%=branchid%>>
							<div class="submit">
							<input type="submit" value="删除该员工" >
					   		 </div>	
					       			</form>										
								
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
                           
                         <%
                        		}
                         %>
                          
                      
			
			</div>
			  <!-- Contact Form -->
                    <div class="contact-form">
                        <h3 class="main-heading"><span>在职服务员</span></h3>
                        <div id="contact-status"></div>
                         <h2><a href="/DessertHouse/waiterlist">查看所有在职服务员</a></h2>
                         
				
  
                    </div>
                    <!-- /Contact Form -->
	
       </div>
  </div>
</div>
   <div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
                    <h4><b>相关信息</b></h4>
                    <ul>
                        <li><a href="contact.html">联系我们</a></li>
						<li><a href="#">帮助中心</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4><b>后台入口</b></h4>
                    <ul>
						<li><a href="admin.html" target="_blank">员工登录</a></li>
						<li><a href="admin.html" target="_blank">经理登录</a></li>
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
				<p>Copyright &copy; 2015.Company name All rights reserved.</p>
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