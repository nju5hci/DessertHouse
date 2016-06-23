<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>积分换购</title>
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
						<li><a href="/DessertHouse/reserveGift">积分换购</a></li>
					
						
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
    		<p><a href="/DessertHouse/index">首页</a> &gt;&gt;&gt;</p>
    	    </div>
    		<div class="clear"></div>
    	</div>
    		<div class="section group">
               <%
                if(request.getParameter("error") != null && request.getParameter("error").equals("2")){
                %>
                        <p style="color: red;">卡已终止不可再换购</p>
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
                <div class="movie">
                <label><h3><b>所有礼品：</b></h3></label>
                            </div>
                            
                               <div class="section group">
                         <% 
                     	String[] name_gift = (String[])request.getServletContext().getAttribute("name_gift");
                     	if(name_gift!=null){
                     		 String[] money_gift = (String[])request.getServletContext().getAttribute("money_gift");
                     		String[] address_gift = (String[])request.getServletContext().getAttribute("address_gift");
                     		int []stock_gift=(int [])request.getServletContext().getAttribute("stock_gift");
                     		int []id_gift=(int [])request.getServletContext().getAttribute("id_gift");
                     		int num_gift = (Integer)request.getServletContext().getAttribute("num_gift");
                     		for(int i = 0;i<num_gift;i++){
             	     %>
             	     	<div class="grid_1_of_5 images_1_of_5">
					 <img src=<%=address_gift[i] %> alt="" />
					 <h2><%=name_gift[i] %></h2>
					 					 <h2>库存：<%=stock_gift[i] %></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><%=money_gift[i] %></span></p>
					    </div>
					       		<div class="add-cart">								
								<form action="/DessertHouse/previewGift" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_gift[i] %>>
							<div class="submit">
							<input type="submit" value="换购" >
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
	
                    <th>礼品ID</th>
					<th>礼品名称</th>
					<th>礼品所需积分</th>
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
				<tr><td><%=dessert_id[i] %></td><td><%=dessert_name[i] %></td><td><%=dessert_price[i] %></td><td ><%=dessert_num[i] %></td><td><%=date[i] %></td><td><a href="/DessertHouse/deleteThis?plan_id=<%=reserve_id[i]%>&&allow=4">删除</a></td></tr>
			<%
			   }%>
			<h3><%="当前总积分："+total %></h3>
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
								<form action="/DessertHouse/buyGift" method="post">	
								
								<%
                if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
                %>
                        <p style="color: red;">卡内的积分不足，无法兑换</p>
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
					       		

					       		积分换购：<input type="checkbox"  name="pay" value="point" />
							
							
							<input type="submit"  class="btn btn-primary" value="确认兑换" >
					   	
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
