<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<head>
    
    <title>我的会员卡</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
    <link rel="stylesheet" type="text/css" href="../css/account/reset.css"/> 
    <link rel="stylesheet" type="text/css" href="../css/account/style.css"/>
    <link rel="stylesheet" type="text/css" href="../css/account/fancybox.css"/>
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,300,800,700,400italic|PT+Serif:400,400italic"/>
    <link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
    <script type="text/javascript" src="../js/account/jquery.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.easytabs.min.js"></script>
    <script type="text/javascript" src="../js/account/respond.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.easytabs.min.js"></script>   
	<script type="text/javascript" src="../js/account/jquery.adipoli.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="../js/account/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.gmap.min.js"></script>
    <script type="text/javascript" src="../js/account/custom.js"></script>
    
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
						    String name1 = (String)request.getServletContext().getAttribute("account_name");
						    if(name1 == null){
						%>
							<li><a href="login.jsp" target="_blank">请登录</a></li>
							<li><a href="register.jsp" target="_blank">免费注册</a></li>
						<%
						    }else{
						%>
						    <li><a href="#" target="_blank">欢迎你，<%=name1 %></a></li>
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
  	  		
   </div>
    
    
    
       <!-- Container -->
        <div id="container">
        
            <!-- Top -->
			<div class="top"> 
            	<!-- Logo -->
            	<div id="logo">
                	<a href="index.jsp"><img src="../images/logo3.png" alt="" /></a>
                </div>
                <!-- /Logo -->
                
            </div>
            <!-- /Top -->
            
            <!-- Content -->
            <div id="content" >
            
                <!-- Profile -->
                <div id="profile"> 
                 	<!-- About section -->
                	<div class="about">
                	<%
                	 String name = (String)request.getServletContext().getAttribute("account_name");
           	     String account = (String)request.getServletContext().getAttribute("account");
           	     String credit = (String)request.getServletContext().getAttribute("credit");
           	     String status = (String)request.getServletContext().getAttribute("status");
           	     String level = (String)request.getServletContext().getAttribute("level");
           	     String money = (String)request.getServletContext().getAttribute("money");
           	     String openDate = (String)request.getServletContext().getAttribute("openDate");
           	     
                	     if(account==null){
                	    	 response.sendRedirect("login.jsp"); 
                	     }
                	%>
                    	<div class="photo-inner"><img src="../images/account/photo.jpg" height="186" width="153" /></div>
                        </br></br><br />
                        <h1><%=name %></h1>
                        <br />
                        <%
				        if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
				        %>
				        <p style="color: red;">您输入的密码或充值金额不正确，请重新充值</p>
				        <%
				         }
				        if(request.getParameter("error") != null && request.getParameter("error").equals("2")){
				        %>
				        <p style="color: red;">第一次充值，充值金额需大于等于200元，请重新充值</p>
				        <%
				         }
				        if(request.getParameter("error") != null && request.getParameter("error").equals("3")){
				         %>
				         <p style="color: red;">第一次充值，请绑定银行卡</p>
				         <%
				         }
				        if(request.getParameter("error") != null && request.getParameter("error").equals("4")){
				         %>
				         <p style="color: red;">您的账户尚未激活，请先激活后再购票</p>
				         <%
				         }
				        if(request.getParameter("error") != null && request.getParameter("error").equals("5")){
				         %>
				         <p style="color: red;">您的账户余额不足，请先充值后购票</p>
				         <%
				         }
				        %>
                        <p>友情提示：当您账户余额不足30元或账户状态处于暂停时，请及时充值以确保您的账号可以正常使用。</p>
                    </div>
                    <!-- /About section -->
                     
                    <!-- Personal info section -->
                	<ul class="personal-info">
                         <li><label>会员卡号</label><span><%=account %></span></li>
                        <li><label>积分</label><span><%=credit %></span></li>
                         <li><label>开卡日期</label><span><%=openDate %></span></li>
                        <li><label>账户级别</label><span><%=level %></span></li>
                        <li><label>账户余额</label><span><%=money %></span></li>
                        <li><label>账户状态</label><span><%=status %></span></li>
                    </ul>
                    <!-- /Personal info section -->
                </div>        
                <!-- /Profile --> 

                <!-- Menu -->
                <div class="menu">
                	<ul class="tabs">
                    	<li><a href="#profile" class="tab-profile">我的资料</a></li>
                    	<li><a href="#resume" class="tab-resume">消费记录</a></li>
                    	<li><a href="#portfolio" class="tab-portfolio">停卡</a></li>
                    	<li><a href="#contact" class="tab-contact">充值</a></li>
                    </ul>
                </div>
                <!-- /Menu --> 
                
                <!-- Resume -->
                <div id="resume">
                	 <div class="timeline-section">
                        <!-- Timeline for Employment  -->   
                        <h3 class="main-heading"><span>消费记录</span></h3>   
                        <ul class="timeline">
                        <% 
                                String[] money_cost = (String[])request.getServletContext().getAttribute("money_cost");
                        		String[] time_cost = (String[])request.getServletContext().getAttribute("time_cost");
                        		int[]dessert_id=(int[])request.getServletContext().getAttribute("dessert_id");
                        		int[]dessert_num=(int[])request.getServletContext().getAttribute("dessert_num");
                        		int num_cost = (Integer)request.getServletContext().getAttribute("num_cost");
                        		for(int i = 0;i<num_cost;i++){
                	     %>
                            <li>                
                                <div class="timelineUnit">
                                    <h4>实际单价:<span class="timelineDate"><%=time_cost[i] %></span></h4>
                                    <h5><%=money_cost[i] %></h5>
                                      <h5><%="甜品id:"+dessert_id[i]+"甜品数量:"+dessert_num[i] %></h5>
                                </div>
                            </li>
                          <%
                        		}
                          %>  
                            <div class="clear"></div>
                        </ul> 
                        <!-- /Timeline for Employment  -->

                        <!-- Timeline for Education  -->   
                        <h3 class="main-heading"><span>缴费记录</span></h3>   
                         <ul class="timeline">
                         <% 
                                String[] money_recharge = (String[])request.getServletContext().getAttribute("money_recharge");
                        		String[] time_recharge = (String[])request.getServletContext().getAttribute("time_recharge");
                        		int num_recharge = (Integer)request.getServletContext().getAttribute("num_recharge");
                        		for(int i = 0;i<num_recharge;i++){
                	     %>
                            <li>            
                                <div class="timelineUnit">
                                    <h4>充值金额：<span class="timelineDate"><%=time_recharge[i] %></span></h4>
                                    <h5><%=money_recharge[i] %></h5>
                                </div>
                            </li>
                         <%
                        		}
                         %>
                            <div class="clear"></div>
                        </ul> 
                        <!-- /Timeline for Education  -->              
                    </div>
                </div>
                <!-- /Resume --> 
                                        
              <!-- Portfolio -->
              <div id="portfolio">
              <!-- Portfolio Info -->
                    <div class="contact-info">
                    <h3 class="main-heading"><span>温馨提示</span></h3>
                	<ul>
                        <li>请确认需要停卡，一旦停卡，将不可再恢复<br /><br /></li>
                       
                    </ul>
                    </div>
                    <!-- /Portfolio Info -->
               <!-- Contact Form -->
                    <div class="contact-form">
                        <h3 class="main-heading"><span>停用此卡</span></h3>
                        <div id="contact-status"></div>
                        <form action="/DessertHouse/stopCard" method="post" id="contactform">
                        
                            <input type="submit" name="submit" value="确认停卡" class="submit">
                        </form>
                    </div>
                    <!-- /Contact Form -->
                </div>

              
              
                    <!-- /Portfolio -->
                <!-- Contact -->
                <div id="contact">
                	<!-- Contact Info -->
                    <div class="contact-info">
                    <h3 class="main-heading"><span>温馨提示</span></h3>
                	<ul>
                        <li>如果您进行过账户充值，则直接在右侧确认登录密码并输入充值金额即可<br /><br /></li>
                        <li>如果这是您第一次进行账户充值，请输入要绑定的银行卡号且充值金额不可小于200元</li>
                    </ul>
                    </div>
                    <!-- /Contact Info -->
                    
                    <!-- Contact Form -->
                    <div class="contact-form">
                        <h3 class="main-heading"><span>账户充值</span></h3>
                        <div id="contact-status"></div>
                        <form action="/DessertHouse/card" method="post" id="contactform">
                            <p>
                            	<label for="name">登录密码</label>
                            	<input type="text" name="password" class="input" >
                            </p>
                            <p>
                            	<label for="email">充值金额（RMB）</label>
                            	<input type="text" name="money" class="input">
                            </p>
                             <p>
                            	<label for="email">银行卡号</label>
                            	<input type="text" name="card" class="input">
                            </p>
                            <input type="submit" name="submit" value="确认充值" class="submit">
                        </form>
                    </div>
                    <!-- /Contact Form -->
                </div>
                <!-- /contact -->  

            </div>
            <!-- /Content -->
            
            <!-- Footer -->
			<div class="footer">
            	<div class="copyright">Copyright &copy; 2015.Company name All rights reserved.</div>
            </div>
            <!-- /Footer -->  
            
        </div>
		<!-- /Container -->

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>