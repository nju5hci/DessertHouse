<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dessert.model.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/style.css">
<link rel="stylesheet" type="text/css" href="../css/table.css">
<link rel="stylesheet" type="text/css" href="../css/orderpage.css">
<link rel="stylesheet" type="text/css" href="../css/stepflex.css">
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script> 
<title>我的订单</title>
</head>
<body>
<div class="wapper">
<div class="header">
    <div class="title">半亩田</div>
    <div class="float-right">
        <a href="">购物车</a>
        <a href="">我的订单</a>
        <a href="/DessertHouse/personalSet">设置</a>
        <a href="/DessertHouse/personalSet">退出</a>
    </div>
</div>
<div class="choose_panel" style="margin-top:-30px;">
<div class="mod-main mod-comm  lefta-box" id="order02">
<div class="mt">
<ul class="extra-l">
   <% 
   String type="1";
   if(request.getParameter("type")!=null){
	   type=request.getParameter("type");
   }
   System.out.println("===="+type);
   %>
   <% int currentpage=0; 
      if(request.getParameter("page")!=null){
    	  currentpage=Integer.parseInt(request.getParameter("page"));    	  
    	  System.out.println(currentpage);
      }
      System.out.println("----"+currentpage);
   %> 
 
   
   <li class="fore1">
   <a href="/DessertHouse/orders" id="allorders" class="txt curr">全部订单</a>  
   </li>
   <li>
   <a href="/DessertHouse/orders2" id="ordertoPay" class="txt">待付款</a>
   </li>
   <li>
   <a href="/DessertHouse/orders3"  id="ordertoReceive" class="txt">待收货</a>
   </li>  
    <li>
   <a href="/DessertHouse/orders4"  id="ordertoComment" class="txt">待评价</a>
   </li> 
</ul>
</div>
<table class="table_title">
  <colgroup>
  <col class="bought-table_col1">
  <col class="bought-table_col2">
  <col class="bought-table_col3">
  <col class="bought-table_col4">
  <col class="bought-table_col5">
  <col class="bought-table_col6">
  </colgroup>
  
  <tr class="link_title">
  <th>宝贝</th>
  <th>单价</th>
  <th>数量</th>
  <th>金额</th>
  <th>交易状态</th>
  <th>操作</th>
  </tr>
  <tbody>
     <!-- 上一页下一页按钮 -->
     <tr class="noshow_row">     
     <td colspan="6">
     <div class="beforeafter">
     <button class='before' id='before'>上一页</button>
     <button class='before' id='next'>下一页</button>
     </div>
     </td>
     <tr>
     <!--  -->
        <%   
        int maxpage=0;
        if(request.getServletContext().getAttribute("orderDate")==null){
        	System.out.println("目前没有获得所有信息");
        }else{
                                String[] orderDate = (String[])request.getServletContext().getAttribute("orderDate");
                        	double[]totalPrice=(double[])request.getServletContext().getAttribute("totalPrice");
                        		int []orderId=(int [])request.getServletContext().getAttribute("orderId");
                        		String []orderState=(String [])request.getServletContext().getAttribute("orderState");
                    			List<List<OrderList>> list=(List<List<OrderList>>)request.getServletContext().getAttribute("list");
                        		int num_dessert = (Integer)request.getServletContext().getAttribute("num");
                        		maxpage=num_dessert/5;
                        		for(int i = 0;i<num_dessert;i++){
                %>
            <!-- 显示空白 -->
    <tr class="noshow_row">
     <td colspan="6"></td>
     <tr>
     <!-- 显示标题 -->
      <tr class="th-title">
     <td colspan="6">
     <span class="gap"></span>
     <span class="dealtime" id="dealtime"><%=orderDate[i] %></span>
     <span class="number">订单号:<%=orderId[i] %><a name="orderidlink" id="orderidlink" href="#"><%=orderId[i] %></a></span>
     </td>
     </tr>
     <!-- 显示商品 第一行 -->
     <tr class="th-notitle">
      <td>
         <div class="good">
         <div class="good-item">
           <a href="#"><img src=<%=list.get(i).get(0).getDessertPicture() %>  title="" width="60px" height="60px"></a>
         </div>
         <div class="good-mes">
            <a href="#"><%=list.get(i).get(0).getDessertName()%> </a>
         </div>
         </div>        
      </td>
      <td>
         <div class="good-price">
        <%=list.get(i).get(0).getDessertPrice() %> 
         </div>
      </td>
       <td>
         <div class="good-number">
       <%=list.get(i).get(0).getDessertNum() %> 
         </div>
      </td>
        <td rowspan="<%=list.get(i).size()%>">
        <div class="good-pay">
        
        <span><%=totalPrice[i] %></span> 
             
        <p></p>
        <span>在线支付</span>
         </div>
      </td>
       <td rowspan="<%=list.get(i).size()%>">
        <div class="good-state">
        <div class="w">
        <span><%=orderState[i] %></span>
        </div>
         <a href="/DessertHouse/orderDetail?orderid=<%=orderId[i] %>" >订单详情</a>
        </div>
      </td>
       <td rowspan="<%=list.get(i).size()%>">
        <div class="good-operate">
          <%  //System.out.println(orderState[i]); %>
        
        <div class="goog-buy">
         <% if(orderState[i].equals("待付款")){%>
        <span> <a href="/DessertHouse/confirmOrder?orderid=<%=orderId[i] %>">付款</a></span>
        <%}else if(orderState[i].equals("未收货")){ %>
         <span><a href="/DessertHouse/confirmOrder?orderid=<%=orderId[i] %>">确认收货</a></span>
         <%}else if(orderState[i].equals("未评价")){ %>
           <span><a href="#">评价</a></span>
           <%}else if(orderState[i].equals("已评价")){ %>
            <div class="no_background">
            <span>已完成</span>
            </div>
           <%} %>
       
        </div>
        </div>
      </td>
    </tr>
    <!-- 显示其余行 -->
   
   <%
                       for(int j=1;j<list.get(i).size();j++){
                    	 //  System.out.println(j+"geshuhguis");
                         %>
    <tr class="th-notitle">
    <td>
         <div class="good">
         <div class="good-item">
           <a href="#"><img src="<%=list.get(i).get(j).getDessertPicture() %> " title="" width="60px" height="60px"></a>
         </div>
         <div class="good-mes">
            <a href="#"><%=list.get(i).get(j).getDessertName()%> </a>
         </div>
         </div>        
      </td>
      <td>
         <div class="good-price">
         <%=list.get(i).get(j).getDessertPrice() %> 
         </div>
      </td>
       <td>
         <div class="good-number">
        <%=list.get(i).get(j).getDessertNum() %> 
         </div>
      </td>
    </tr>
        
     <%
                        		}
                         %>
    
     <%
                        		}
        }
                         %>
   
 
   
  </tbody>
</table>
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
	var type=<%=type%>;
	//alert(type);
	if(type=="2"){
		//alert($("#ordertoPay").attr("class"));
		$("#ordertoPay").attr("class","txt curr");
		$("#allorders").attr("class","txt");
		$("#ordertoReceive").attr("class","txt");
		$("#ordertoComment").attr("class","txt");
		}else  if(type=="1"){
			$("#ordertoPay").attr("class","txt");
			$("#allorders").attr("class","txt curr");
			$("#ordertoReceive").attr("class","txt");
			$("#ordertoComment").attr("class","txt");			
		}else if(type=="3"){
			$("#ordertoPay").attr("class","txt");
			$("#allorders").attr("class","txt");
			$("#ordertoReceive").attr("class","txt curr");
			$("#ordertoComment").attr("class","txt");}
		else if(type=="4"){
			$("#ordertoPay").attr("class","txt");
			$("#allorders").attr("class","txt");
			$("#ordertoReceive").attr("class","txt");
			$("#ordertoComment").attr("class","txt curr");}
	var pagenumber=<%=currentpage%>;
	if(pagenumber==0){
		alert(pagenumber);
		document.getElementById("before").disabled=true;
		
	}else{
		document.getElementById("before").disabled=false;
		}
	if(pagenumber==<%=maxpage%>){
		document.getElementById("next").disabled=true;
		}else{
		document.getElementById("next").disabled=false;
		}
	$("#before").click(function(){
		alert(currentpage);
		var number=pagenumber-1;
		var url="orders1.jsp?type="+type+"&page="+number;
		alert(url);
		window.location.href=url;
		});
	$("#after").click(function(){
		alert(currentpage);
		var number=pagenumber+1;
		var url="orders1.jsp?type="+type+"&page="+number;
		alert(url);
		window.location.href=url;
});
	
});
</script>
</html>