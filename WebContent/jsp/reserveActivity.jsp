<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>报名活动</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/checkbox.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/component.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>

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
						    if(name != null){
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
					     		<form action="/DessertHouse/searchActivity" method="post">
					     			<input type="text" value="" name="search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					     		
					     			<input type="submit" value="">
					     		</form>
					     	</div>
					     	</br>
					     		 <div class="clear"></div>
					     		<form action="/DessertHouse/oneTeamActivity" method="post">
					     			单人票：<input type="radio" value="单人票" name="one" >
					     			多人优惠票：<input type="radio" value="多人优惠票" name="one" >
					     			<input type="submit" value="查询">
					     		</form>
					     	
					
					</div>
			 <div class="clear"></div>
  		</div>     
   		</div>
   </div>
   <!------------End Header ------------>
    <div class="main">
 	<div class="wrap">
     <div class="content">
     
    	</div>
    		<div class="section group">
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
                <div class="content_top">
               	<div class="heading">
    		<h3>采摘园</h3>
    		</div>
                 	</div>           
                               <div class="section group">
                         <% 
                     	String[] name_activity = (String[])request.getServletContext().getAttribute("name_activity");
                     	if(name_activity!=null){
                     		 String[] startDate_activity = (String[])request.getServletContext().getAttribute("startDate_activity");
                     		 String[] money_activity = (String[])request.getServletContext().getAttribute("money_activity");
                     		String[] address_activity = (String[])request.getServletContext().getAttribute("address_activity");
                     		int []id_activity=(int [])request.getServletContext().getAttribute("id_activity");
                     		int num_activity = (Integer)request.getServletContext().getAttribute("num_activity");
                     		for(int i = 0;i<num_activity;i++){
             	     %>
             	     	<div class="grid_1_of_5 images_1_of_5">
					 <img src=<%=address_activity[i] %> alt="" />
					 <h2><%=name_activity[i] %></h2>
					  <h2><%=startDate_activity[i] %></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=money_activity[i] %></span></p>
					    </div>
					       		<div class="add-cart">								
								<form action="/DessertHouse/previewActivity" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_activity[i] %>>
							<div class="submit">
							<input type="submit" value="去预定" >
					   		 </div>	
					       			</form>							
									
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
                        
                      <%
                     		}
                      %>
                         <%
                     	}
                               
                        %>
			
			</div>
			<div class="content_top">
			   	<div class="heading">
    		<h3>植物园</h3>
    		</div>
    			</div>
                               <div class="section group">
                         <% 
                     	String[] name_activityPlant = (String[])request.getServletContext().getAttribute("name_activityPlant");
                     	if(name_activityPlant!=null){
                     		 String[] money_activityPlant = (String[])request.getServletContext().getAttribute("money_activityPlant");
                     		 String[] startDate_activityPlant = (String[])request.getServletContext().getAttribute("startDate_activityPlant");
                     		String[] address_activityPlant = (String[])request.getServletContext().getAttribute("address_activityPlant");
                     		int []id_activityPlant=(int [])request.getServletContext().getAttribute("id_activityPlant");
                     		int num_activityPlant = (Integer)request.getServletContext().getAttribute("num_activityPlant");
                     		for(int i = 0;i<num_activityPlant;i++){
             	     %>
             	     	<div class="grid_1_of_5 images_1_of_5">
					 <img src=<%=address_activityPlant[i] %> alt="" />
					 <h2><%=name_activityPlant[i] %></h2>
					 <h2><%=startDate_activityPlant[i] %></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=money_activityPlant[i] %></span></p>
					    </div>
					       		<div class="add-cart">								
								<form action="/DessertHouse/previewActivity" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_activityPlant[i] %>>
							<div class="submit">
							<input type="submit" value="去预定" >
					   		 </div>	
					       			</form>							
									
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
                        
                      <%
                     		}
                      %>
                         <%
                     	}
                               
                        %>
			
			</div>
			<div class="content_top">
			   	<div class="heading">
    		<h3>观赏园</h3>
    		</div>
    			</div>
                               <div class="section group">
                         <% 
                     	String[] name_activityWatch = (String[])request.getServletContext().getAttribute("name_activityWatch");
                     	if(name_activityWatch!=null){
                     		 String[] startDate_activityWatch = (String[])request.getServletContext().getAttribute("startDate_activityWatch");
                     		 String[] money_activityWatch = (String[])request.getServletContext().getAttribute("money_activityWatch");
                     		String[] address_activityWatch = (String[])request.getServletContext().getAttribute("address_activityWatch");
                     		int []id_activityWatch=(int [])request.getServletContext().getAttribute("id_activityWatch");
                     		int num_activityWatch = (Integer)request.getServletContext().getAttribute("num_activityWatch");
                     		for(int i = 0;i<num_activityWatch;i++){
             	     %>
             	     	<div class="grid_1_of_5 images_1_of_5">
					 <img src=<%=address_activityWatch[i] %> alt="" />
					 <h2><%=name_activityWatch[i] %></h2>
					  <h2><%=startDate_activityWatch[i] %></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=money_activityWatch[i] %></span></p>
					    </div>
					       		<div class="add-cart">								
								<form action="/DessertHouse/previewActivity" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_activityWatch[i] %>>
							<div class="submit">
							<input type="submit" value="去预定" >
					   		 </div>	
					       			</form>							
									
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
                        
                      <%
                     		}
                      %>
                         <%
                     	}
                               
                        %>
			
			</div>
			<div class="content_top">
			   	<div class="heading">
    		<h3>个人经营园</h3>
    		</div>
    			</div>
                               <div class="section group">
                         <% 
                     	String[] name_activityPerson = (String[])request.getServletContext().getAttribute("name_activityPerson");
                     	if(name_activityPerson!=null){
                     		 String[] money_activityPerson = (String[])request.getServletContext().getAttribute("money_activityPerson");
                     		 String[] startDate_activityPerson = (String[])request.getServletContext().getAttribute("startDate_activityPerson");
                     		String[] address_activityPerson = (String[])request.getServletContext().getAttribute("address_activityPerson");
                     		int []id_activityPerson=(int [])request.getServletContext().getAttribute("id_activityPerson");
                     		int num_activityPerson = (Integer)request.getServletContext().getAttribute("num_activityPerson");
                     		for(int i = 0;i<num_activityPerson;i++){
             	     %>
             	     	<div class="grid_1_of_5 images_1_of_5">
					 <img src=<%=address_activityPerson[i] %> alt="" />
					 <h2><%=name_activityPerson[i] %></h2>
					  <h2><%=startDate_activityPerson[i] %></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=money_activityPerson[i] %></span></p>
					    </div>
					       		<div class="add-cart">								
								<form action="/DessertHouse/previewActivity" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_activityPerson[i] %>>
							<div class="submit">
							<input type="submit" value="去预定" >
					   		 </div>	
					       			</form>							
									
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
                        
                      <%
                     		}
                      %>
                         <%
                     	}
                               
                        %>
			
			</div>
            </div>

    <div class="component">
		<table>
			<thead>
				<tr>
	
                    <th>活动ID</th>
					<th>活动名称</th>
					<th>活动价格</th>
					<th>数量</th>
					<th>日期</th>
					<th>删除</th>
				</tr>
			</thead>
			<%
            String[] dessert_name = (String[])request.getServletContext().getAttribute("dessert_name");
			 int[] reserve_id =null;
			if(dessert_name != null){
				   reserve_id = (int[])request.getServletContext().getAttribute("reserve_id");
			  int[] dessert_id = (int[])request.getServletContext().getAttribute("dessert_id");
			  int[] dessert_num = (int[])request.getServletContext().getAttribute("dessert_num");
				 double []dessert_price=(double[])request.getServletContext().getAttribute("dessert_price");
			 // String[] dessert_name = (String[])request.getServletContext().getAttribute("dessert_name");
			   String[] date = (String[])request.getServletContext().getAttribute("date");
			   int num = (Integer)request.getServletContext().getAttribute("num");
			   double total=0;
			   %>
			<tbody>
			<% 
			   for(int i = 0;i<num;i++){
				   total=total+dessert_num[i]*dessert_price[i];
			%>
				<tr><td><%=dessert_id[i] %></td><td><%=dessert_name[i] %></td><td><%=dessert_price[i] %></td><td ><%=dessert_num[i] %></td><td><%=date[i] %></td><td><a href="/DessertHouse/deleteThis?plan_id=<%=reserve_id[i]%>&&allow=3">删除</a></td></tr>
			<%
			   }%>
			<h3><%="当前总价："+total %></h3>
				收件人姓名：<input type="text" name="pay" value="" />
			</br>
								收件人地址：<input type="text" name="pay" value="" />
										</br>
									收件人联系方式：<input type="text" name="pay" value="" />
											</br>
			<% 	}
			%>
		
			</tbody>
		</table>
			<div class="add-cart">	
										<%
        
				   %>
								<form action="/DessertHouse/buyActivity" method="post">	
								
								<%
                if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
                %>
                        <p style="color: red;">卡内的余额不足，请选择现金支付或者先充值</p>
                <%
                }
              
                %>
                	<%
                if(request.getParameter("error") != null && request.getParameter("error").equals("2")){
                %>
                        <p style="color: red;">卡已终止不可再使用</p>
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
					       		
					       		会员卡结账：<input type="checkbox" name="pay" value="card" />
					       		积分结账：<input type="checkbox"  name="pay" value="point" />
								现金结账：<input type="checkbox" name="pay" value="cash" />
							
							<input type="submit"  class="btn btn-primary" value="结账" >
					   	
					       			</form>							
									
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
</body>
</html>