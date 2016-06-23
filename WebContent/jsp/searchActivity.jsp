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
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.html"><img src="../images/logo3.png" alt="" /></a>
					</div>
						<div class="header_top_right">
							  <div class="search_box">
					     		<form action="/DessertHouse/searchActivity" method="post">
					     			<input type="text" value="" name="search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}">
					     		
					     			<input type="submit" value="">
					     		</form>
					     	</div>
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
     	<div class="content_top">
    		<div class="back-links">
    		<p><a href="index.html">首页</a> &gt;&gt;&gt;</p>
    	    </div>
    		<div class="clear"></div>
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
    		<h3>搜索到的活动</h3>
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
				<tr><td><%=dessert_id[i] %></td><td><%=dessert_name[i] %></td><td><%=dessert_price[i] %></td><td ><%=dessert_num[i] %></td><td><%=date[i] %></td></tr>
			<%
			   }%>
			<h3><%="当前总价："+total %></h3>
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
                        <li><a href="contact.html">联系我们</a></li>
						<li><a href="#">帮助中心</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4><b>后台入口</b></h4>
                    <ul>
						<li><a href="login.jsp" target="_blank">员工登录</a></li>
						<li><a href="login.jsp" target="_blank">经理登录</a></li>
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
</body>

</html>