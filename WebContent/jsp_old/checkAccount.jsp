<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看会员信息</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <!-- Loading Bootstrap -->
    <link href="../dist/css/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Loading Flat UI -->
    <link href="../dist/css/flat-ui.min.css" rel="stylesheet">
    <link href="../docs/assets/css/docs.css" rel="stylesheet">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/checkbox.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/component.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>

    <link rel="stylesheet" type="text/css" href="../css/account/reset.css"/> 
    <link rel="stylesheet" type="text/css" href="../css/account/style.css"/>
    <link rel="stylesheet" type="text/css" href="../css/account/fancybox.css"/>
	<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Open+Sans:400,600,300,800,700,400italic|PT+Serif:400,400italic"/>
    <link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
  <script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
    <script type="text/javascript" src="../js/account/jquery.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.easytabs.min.js"></script>
    <script type="text/javascript" src="../js/account/respond.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.easytabs.min.js"></script>   
	<script type="text/javascript" src="../js/account/jquery.adipoli.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.fancybox-1.3.4.pack.js"></script>
    <script type="text/javascript" src="../js/account/jquery.isotope.min.js"></script>
    <script type="text/javascript" src="../js/account/jquery.gmap.min.js"></script>
    <script type="text/javascript" src="../js/account/custom.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<style>
 #profile {
	
		background-color:#1abc9c;		
	}
.btn{
    text-align:center;
    cursor:pointer;
	padding:10px 10px;
	font-family: 'ambleregular';
	background:#1abc9c;
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
<nav class="navbar navbar-inverse" role="navigation">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-02">
              <span class="sr-only">Toggle navigation</span>
            </button>
            <a class="navbar-brand"  href="/DessertHouse/sale">首页</a>
           
          </div>
          	<%
						    String name1 = (String)request.getServletContext().getAttribute("account_name");
						    if(name1 == null){
						%>
						  <p class="navbar-text navbar-right"> <a class="navbar-link" href="login.jsp">请登录</a></p>
						   <p class="navbar-text navbar-right"> <a class="navbar-link" href="register.jsp">免费注册</a></p>
						
						<%
						    }else{
						%>
						 <p class="navbar-text navbar-right"> <a class="navbar-link" href="#">欢迎你，<%=name1%></a></p>
						 <p class="navbar-text navbar-right"> <a class="navbar-link" href="login.jsp">退出</a></p>
						<%
						    }
						%>
					
        <div class="collapse navbar-collapse" id="navbar-collapse-01">
            <ul class="nav navbar-nav">
          
     
             <li class="active"><a href="/DessertHouse/checkAccount">查看会员信息</a></li>
     
             </ul>
           
          </div><!-- /.navbar-collapse -->
        </nav><!-- /navbar -->
        <div class="header">
  	  		
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.html"><img src="../images/logo3.png" alt="" /></a>
					</div>
			 <div class="clear"></div>
  		</div>     
   		</div>
   </div>
   
    <div class="main">
 	<div class="wrap">
     <div class="content">
	  <div class="section group">
    
    
    
     
		<h1>查看会员信息</h1>
			<form method="post" action="/DessertHouse/checkValue">
              
              				会员ID：<input name="username" 		value="">
				</br>
		<p></p>
		
			<input type="submit" value="查看"  class="btn btn-primary">
		
			    
			</form>          
    </div>
      </div>
      
                
        
            
                <!-- Profile -->
             
                 	<!-- About section -->
                	<div class="about">
                	<%
                	
                	 int accountNo = (int)request.getServletContext().getAttribute("accountNo");
                	if(accountNo!=0){
                		
           	     String credit = (String)request.getServletContext().getAttribute("credit");
           	  String status = (String)request.getServletContext().getAttribute("status");
           	     String level = (String)request.getServletContext().getAttribute("level");
           	     String money = (String)request.getServletContext().getAttribute("money");
           	     String openDate = (String)request.getServletContext().getAttribute("openDate");
           	     
                	 
                	%>
                    
                        </br></br><br />
                        <h1><%=accountNo %></h1>
                        <br />
                       
                   
                    <!-- /About section -->
                     
                    <!-- Personal info section -->
                	<ul >
                         <li><label>会员卡号:</label><span><%=accountNo %></span></li>
                        <li><label>积分:</label><span><%=credit %></span></li>
                         <li><label>开卡日期:</label><span><%=openDate %></span></li>
                        <li><label>账户级别:</label><span><%=level %></span></li>
                        <li><label>账户余额:</label><span><%=money %></span></li>
                        <li><label>账户状态:</label><span><%=status %></span></li>
                    </ul>
                           <%
                        		}
                          %>  
                    <!-- /Personal info section -->
               
               </div>
                 </div>
          </div>
                <!-- Resume -->
                <div id="resume">
                	 <div class="timeline-section">
                        <!-- Timeline for Employment  -->   
                        <h3 class="main-heading"><span>消费记录</span></h3>   
                        <ul class="timeline">
                        <% 	if(accountNo!=0){
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
                             <%
                        		}
                          %>  
                            <div class="clear"></div>
                        </ul> 
                        <!-- /Timeline for Employment  -->

                        <!-- Timeline for Education  -->   
                        <h3 class="main-heading"><span>缴费记录</span></h3>   
                         <ul class="timeline">
                         <% 	if(accountNo!=0){
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
                            <%
                        		}
                          %>  
                            <div class="clear"></div>
                        </ul> 
                        <!-- /Timeline for Education  -->              
                    </div>
                </div>
                <!-- /Resume --> 
                                        
          
              
              
                 
              

            <!-- /Content -->
             <div class="footer">
   <div class="copy_right">
   <p> 客服专线：400-180-8585&nbsp;客服邮箱：service@coffee.com.cn&nbsp;</p>
				<p> 沪ICP备10204158号-2.    咖啡 蛋糕 烘焙专卖店 . 2016Comestibles Master Co., Ltd All rights reserved&nbsp;&copy;版权所有</p>
		   </div>	
   
    </div>
</body>
</html>