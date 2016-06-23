<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理农产品</title>
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
						<li><a href="/DessertHouse/systemDessert">管理产品</a></li>
						<li><a href="/DessertHouse/systemActivity">管理活动</a></li>
						<li><a href="/DessertHouse/systemSoil">管理土地</a></li>
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
						
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
							<a href="/DessertHouse/systemDessert"><img src="../images/mu3.png" alt="" /></a>
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
							               <img src="../images/grape.jpg" data-thumb="images/grape.jpg" alt="" />
							                <img src="../images/2.jpg" data-thumb="images/2.jpg" alt="" />
							                <img src="../images/3.jpg" data-thumb="images/3.jpg" alt="" />
							                <img src="../images/4.jpg" data-thumb="images/4.jpg" alt="" />
							                 <img src="../images/5.jpg" data-thumb="images/555.jpg" alt="" />
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
                                String[] money_dessert = (String[])request.getServletContext().getAttribute("money_dessert");
                        		String[] address_dessert = (String[])request.getServletContext().getAttribute("address_dessert");
                        		String[] name_dessert = (String[])request.getServletContext().getAttribute("name_dessert");
                        		int []id_dessert=(int [])request.getServletContext().getAttribute("id_dessert");
                        		int num_dessert = (Integer)request.getServletContext().getAttribute("num_dessert");
                        		for(int i = 0;i<num_dessert;i++){
                	     %>
                	     	<div class="grid_1_of_5 images_1_of_5">
					 <img src=<%=address_dessert[i] %> alt="" />
					 <h2><%=name_dessert[i] %></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=money_dessert[i] %></span></p>
					    </div>
					       		<div class="add-cart">								
								<form action="/DessertHouse/manageProduct" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_dessert[i] %>>
							<div class="submit">
							<input name ="manage"type="submit" value="管理此产品" >
									
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
				        <p style="color: red;">您输入的信息不正确，请重新输入</p>
				        <%
				         }
						  %>
	   <!-- Contact Form -->
                    <div class="contact-form">
                        <h3 class="main-heading"><span>添加产品</span></h3>
                        <div id="contact-status"></div>
                        <form action="/DessertHouse/addProduct" method="post" id="contactform">
                            <p>
                            	<label for="name">产品id</label>
                            	<input type="text" name="dessertId" class="input" >
                            </p>
                            <p>
                            	<label for="email">产品名字</label>
                            	<input type="text" name="dessertName" class="input">
                            </p>
                            
                             <p>
                            	<label for="email">产品简介</label>
                            	<input type="text" name="dessertInfo" class="input">
                            </p>
                             <p>
                            	<label for="email">产品金额</label>
                            	<input type="text" name="dessertPrice" class="input">
                            </p>
                             <p>
                            	<label for="email">产品库存 </label>
                            	<input type="text" name="dessertStock" class="input">
                            </p>
                             <p>
                            	<label for="email">产品图片地址</label>
                            	<input type="text" name="dessertPicAdd" class="input">
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