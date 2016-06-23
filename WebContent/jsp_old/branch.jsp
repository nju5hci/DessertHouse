<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>店面管理</title>
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
							  <div class="search_box">
					     		<form>
					     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
					     		</form>
					     	</div>
						 <div class="clear"></div>
					</div>
			 <div class="clear"></div>
  		</div>     
				<div class="header_bottom">		 
						 	    <!------ Slider ------------>
								  <div class="slider">
							      	<div class="slider-wrapper theme-default">
							            <div id="slider" class="nivoSlider">
							                <img src="../images/men/13.jpg" data-thumb="images/men/13.jpg" alt="" />
							                <img src="../images/men/19.jpg" data-thumb="images/men/19.jpg" alt="" />
							                <img src="../images/men/22.jpg" data-thumb="images/men/22.jpg" alt="" />
							                <img src="../images/men/24.jpg" data-thumb="images/men/24.jpg" alt="" />
							                 <img src="../images/men/27.jpg" data-thumb="images/men/27.jpg" alt="" />
							            </div>
							        </div>
						   		</div>
						<!------End Slider ------------>
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
                               	String[] address_branch = (String[])request.getServletContext().getAttribute("address_branch");
                        		String[] name_branch = (String[])request.getServletContext().getAttribute("name_branch");
                        		int[] id_branch=(int[])request.getServletContext().getAttribute("id_branch");
                        		
                        		int num_branch = (Integer)request.getServletContext().getAttribute("num_branch");
                        		for(int i = 0;i<num_branch;i++){
                	     %>
                	     	<div class="grid_1_of_5 images_1_of_5">
					 <a href="/DessertHouse/waiter"><img src=<%=address_branch[i] %> alt="" /></a>
					 <h2><a href="/DessertHouse/waiter"><%=name_branch[i] %></a></h2>
					<div class="price-details">
				   <div class="price-number">
							<p><span class="rupees"><%=id_branch[i] %></span></p>
					    </div>
					       		<div class="add-cart">
					       		<form action="/DessertHouse/waiter" method="post">	
					       		<input class='a'  type="text" name="branchid" value= <%=id_branch[i] %>>
							<div class="submit">
							<input type="submit" value="管理门店" >
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
						 <%
				        if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
				        %>
				        <p style="color: red;">您输入的门店信息不正确，请重新输入</p>
				        <%
				         }
						  %>
	   <!-- Contact Form -->
                    <div class="contact-form">
                        <h3 class="main-heading"><span>添加门店</span></h3>
                        <div id="contact-status"></div>
                        <form action="/DessertHouse/addBranch" method="post" id="contactform">
                            <p>
                            	<label for="name">门店id</label>
                            	<input type="text" name="brachId" class="input" >
                            </p>
                            <p>
                            	<label for="email">门店名字</label>
                            	<input type="text" name="branchName" class="input">
                            </p>
                             <p>
                            	<label for="email">门店地址</label>
                            	<input type="text" name="branchLocation" class="input">
                            </p>
                             <p>
                            	<label for="email">门店联系电话</label>
                            	<input type="text" name="branchPhone" class="input">
                            </p>
                             <p>
                            	<label for="email">门店图片地址</label>
                            	<input type="text" name="branchPicAdd" class="input">
                            </p>
                            <input type="submit" name="submit" value="确认添加" class="submit">
                        </form>
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