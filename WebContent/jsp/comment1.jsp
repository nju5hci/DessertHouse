<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的半亩-我的订单</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/orderdetail.css">
<link rel="stylesheet" type="text/css" href="../css/table.css">
<link rel="stylesheet" type="text/css" href="../css/comment.css">
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script> 
</head>
<body>
<div class="wapper">
<div class="header">
   <a href="/DessertHouse/index2" class="title">半亩田首页</a>
    <div class="float-right">
        <a href="/DessertHouse/chart">购物车</a>
        <a href="/DessertHouse/orders">我的订单</a>
        <a href="/DessertHouse/personalSet">个人信息</a>
        <a href="login.jsp">退出</a>
    </div>
</div>
<div class="container" style="margin-top:-30px">
<div class="order_id_title">
<p style="font-size:13px">我的一亩>订单中心>评价:</p>
</div>
  <% 
	int  orderID =( Integer)(request.getServletContext().getAttribute("orderID"));
	 String sendAddress = (String)request.getServletContext().getAttribute("sendAddress");
		String sendTime= (String)request.getServletContext().getAttribute("sendTime");
		String sendWay= (String)request.getServletContext().getAttribute("sendWay");
		String payWay = (String)request.getServletContext().getAttribute("payWay");
		double totalPrice =(Double)request.getServletContext().getAttribute("totalPrice");
		int orderState= ( Integer)request.getServletContext().getAttribute("orderState");            
                	  
		 %>
<div class="list_class">
	<form action="/DessertHouse/addComment?orderid=<%=orderID%>" method="post">	

<p align="center" style="font-size:12px">订单号:<%=orderID %></p>
<table class="comment_title" >
  <colgroup>
  <col class="comment-table_col1">
  <col class="comment-table_col2">
  </colgroup>
  
  <tr class="link_title" style="background-color:white">
  <th>商品信息</th>
  <th>评价</th>
  </tr>
   <% 
         int []dessertId = (int[])request.getServletContext().getAttribute("dessertId");
         int []dessertNum = (int[])request.getServletContext().getAttribute("dessertNum");
         double[] dessertPrice = (double[])request.getServletContext().getAttribute("dessertPrice");
         double[] desserttotalPrice=(double[])request.getServletContext().getAttribute("desserttotalPrice");
         String[] dessertPicture = (String[])request.getServletContext().getAttribute("dessertPicture");
         String[] dessertName=(String[])request.getServletContext().getAttribute("dessertName");
                        		int num_dessert = (Integer)request.getServletContext().getAttribute("num");
                        		for(int i = 0;i<num_dessert;i++){
                	     %>
           	     
        <tr class="th-notitle" style="height:20px">
          <td colspan="2"></td>
        </tr>
       
     <tr class="th-notitle">        
          <td>
         <div class="good" style="margin:0 auto">
         <div class="good-item">
           <a  href="/DessertHouse/commodity?dessertid=<%=dessertId[i] %>"><img src="<%=dessertPicture[i] %>" title="" width="60px" height="60px"></a>
         </div>
         <div class="good-mes">
            <a  href="/DessertHouse/commodity?dessertid=<%=dessertId[i] %>"><%=dessertName[i] %></a>
         </div>
         </div>        
      </td>
      <td>
        <div class="my_comment">
          <textarea class="comment_area"  id="other" name="other" cols="50" rows="5" 
    onblur="if(this.value == ''){this.style.color = '#ACA899'; this.value = '商品好用吗？分享下评价吧'; }" 
    onfocus="if(this.value == '商品好用吗？分享下评价吧'){this.value =''; this.style.color = '#000000'; }" 
                                style="color:#ACA899;">商品好用吗？分享下评价吧</textarea>
                                	<input class='a'  type="text" name="dessertid" value= <%=dessertId[i]%>>
        </div>
      </td>
      
   </tr>
 <!-- - -->
    <%
                        		}
                         %>
                          
                      
			
   <!--  -->
  </table>
 <div class="comment_commit">
   <div class="area">
     <div class="login-info-input">
		<input type="submit" value="提交评价" class="input-submit" style="marign-left:50%"></input>
	  </div>
   </div>
</div>
</form>

</div>

</div>
</div>
<div class="footer">
	<div class="seperator"></div>
	<div class="footer-info">		
		<p>Copyright@2002-2016 半亩田版权所有</p>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	
	
});
$(function(){

	   $(".a").hide();

	});
</script>

</html>