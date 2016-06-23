<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
							<li><a href="/DessertHouse/reserveActivity">订活动票</a></li>
						<li><a href="/DessertHouse/payedActivity">出电子票</a></li>
						<li><a href="/DessertHouse/assessActivity">评价活动</a></li>
					
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
						<div class="header_top_right">
						 
							  <div class="search_box">
					     		<form>
					     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
					     		</form>
					     	</div>
						 <div class="clear"></div>
					</div>
						  <script type="text/javascript">
								function DropDown(el) {
									this.dd = el;
									this.initEvents();
								}
								DropDown.prototype = {
									initEvents : function() {
										var obj = this;
					
										obj.dd.on('click', function(event){
											$(this).toggleClass('active');
											event.stopPropagation();
										});	
									}
								}
					
								$(function() {
					
									var dd = new DropDown( $('#dd') );
					
									$(document).click(function() {
										// all dropdowns
										$('.wrapper-dropdown-2').removeClass('active');
									});
					
								});
					    </script>
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
						    int activityId = (int)request.getServletContext().getAttribute("activityId");
					    	String activityName=(String)request.getServletContext().getAttribute("activityName");
					    	double activityPrice=(double)request.getServletContext().getAttribute("activityPrice");
					    	
					    	String activityinfo=(String)request.getServletContext().getAttribute("activityinfo");
					    	String activitystart=(String)request.getServletContext().getAttribute("activitystart");
					    	String activityend=(String)request.getServletContext().getAttribute("activityend");
					    	
					    	String activityPicAdd=(String)request.getServletContext().getAttribute("activityPicAdd");
					    	String activitykind=(String)request.getServletContext().getAttribute("activitykind");
					    	
					    	String activitynum=(String)request.getServletContext().getAttribute("activitynum");
					    	 int activitymax = (int)request.getServletContext().getAttribute("activitymax");
						    	
						%>
						<img src=<%=activityPicAdd %>  alt="" />
				  </div>
				<div class="desc span_3_of_2">
		
					<h2><%=activityName %> </h2>
					<p><%=activityId %> </p>	
						<p>开始日期: <span><%=activitystart %> </span></p>
							<p>结束日期: <span><%=activityend %> </span></p>
								<p>活动种类: <span><%=activitykind %> </span></p>	
									<p>最大人数上限: <span><%=activitymax %> </span></p>		
										<p>个人/多人报名: <span><%=activitynum %> </span></p>
					<div class="price">
						<p>价格: <span><%=activityPrice %> </span></p>
					</div>
					<div class="availables">
						<ul>
						 
					    </ul>
					</div>
				<div class="share-desc">
					
					<form method="post" action="/DessertHouse/addActivity">
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
              				
                            订票数量：<input type="text" name="num" value=""/>
                            </br>
                            参加活动日期：<input name="reservedate" type="text" value="" size="14" readonly onClick="showcalendar(event,this);" onFocus="showcalendar(event, this);if(this.value=='0000-00-00')this.value=''">
                      
			    <input type="submit" value="确认订票"  class="btn">
			</form>   			
					<div class="clear"></div>
				</div>
				
			</div>
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			 <h2>Details :</h2>
			 <p><%=activityinfo %> </p>
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

