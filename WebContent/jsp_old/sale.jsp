<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>销售</title>
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
			 <div class="clear"></div>
  		</div>     
   		</div>
   </div>
   
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
             
                <div class="movie">
                <label><h3><b>选择甜品：</b></h3></label>
                            </div>
                            
                               <div class="section group">
                         <% 
                     	String[] name_dessert = (String[])request.getServletContext().getAttribute("name_dessert");
                     	if(name_dessert!=null){
                     		 String[] money_dessert = (String[])request.getServletContext().getAttribute("money_dessert");
                     		String[] address_dessert = (String[])request.getServletContext().getAttribute("address_dessert");
                     		
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
								<form action="/DessertHouse/addSale" method="post">	
					       		<input class='a'  type="text" name="dessertid" value= <%=id_dessert[i] %>>
					       		  数量：<input type="text" name="num" value=""/>
                         
							<div class="submit">
							<input type="submit" value="确认销售" >
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
		 <th>销售日期</th>
                    <th>甜品ID</th>
					 <th>甜品名称</th>
					<th>数量</th>
					<th>价格</th>
				
				</tr>
			</thead>
			<%
            String[] dessert_name = (String[])request.getServletContext().getAttribute("dessert_name");
			if(dessert_name != null){
				String[] dessert_date = (String[])request.getServletContext().getAttribute("dessert_date");
					
			  int[] dessert_id = (int[])request.getServletContext().getAttribute("dessert_id");
			  int[] dessert_num = (int[])request.getServletContext().getAttribute("dessert_num");
			 double[] dessert_money = (double[])request.getServletContext().getAttribute("dessert_money");
              
			 // String[] dessert_name = (String[])request.getServletContext().getAttribute("dessert_name");
			  double total=0;
			   int num = (Integer)request.getServletContext().getAttribute("num");
             %>
			<tbody>
			<% 
			   for(int i = 0;i<num;i++){
					total=total+dessert_num[i]*dessert_money[i];
			%>
				<tr><td><%=dessert_date[i] %></td><td><%=dessert_id[i] %></td><td><%=dessert_name[i] %></td><td ><%=dessert_num[i] %></td><td><%=dessert_money[i] %></td></tr>
		
			
			<%
			   }
			%>
			<h3><%="当前总价："+total %></h3>
				<%
			}
			%>
			</tbody>
		</table>
			
		<div class="add-cart">								
								<form action="/DessertHouse/updateSale" method="post">	
					       		会员ID:<input  type="text" name="mid" value=""/>
					       		会员卡结账：<input type="radio" checked="checked" name="pay" value="card" />
								现金结账：<input type="radio" name="pay" value="cash" />
							<div class="submit">
							<input type="submit" value="结账" >
					   		 </div>	
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