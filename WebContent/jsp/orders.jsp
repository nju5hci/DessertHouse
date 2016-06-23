<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <div class="title">一亩e田</div>
    <div class="float-right">
        <a href="">购物车</a>
        <a href="">我的订单</a>
        <a href="">设置</a>
        <a href="">退出</a>
    </div>
</div>
<div class="choose_panel" style="margin-top:-30px;">
<div class="mod-main mod-comm  lefta-box" id="order02">
<div class="mt">
<ul class="extra-l">
   <% String type="all";
   if(request.getParameter("s")!=null){
	   type=request.getParameter("s");
   }
   System.out.println(type);
   %>
   <li class="fore1">
   <a href="orders.jsp" id="allorders" class="txt curr">全部订单</a>  
   </li>
   <li>
   <a href="orders.jsp?s=2" id="ordertoPay" class="txt">待订单</a>
   </li>
   <li>
   <a href="orders.jsp?s=3"  id="ordertoReceive" class="txt">待收货</a>
   </li>  
    <li>
   <a href="orders.jsp?s=4"  id="ordertoComment" class="txt">待评价</a>
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
  <tr class="noshow_row">
     <td colspan="6"></td>
   <tr>
   <tr class="th-title">
     <td colspan="6">
     <span class="gap"></span>
     <span class="dealtime" id="dealtime">2016-03-22 08:28:23</span>
     <span class="number">订单号<a name="orderidlink" id="orderidlink" href="#"></a></span>
     </td>
   </tr>
   <tr class="th-notitle">
      <td>
         <div class="good">
         <div class="good-item">
           <a href="#"><img src="#" title="" width="60px" height="60px"></a>
         </div>
         <div class="good-mes">
            <a href="#">长裤xxxxxxxx</a>
         </div>
         </div>        
      </td>
      <td>
         <div class="good-price">
         80.0
         </div>
      </td>
       <td>
         <div class="good-number">
         X1
         </div>
      </td>
        <td rowspan="2">
        <div class="good-pay">
        
        <span>总额￥227</span> 
             
        <p></p>
        <span>在线支付</span>
         </div>
      </td>
       <td rowspan="2">
        <div class="good-state">
        <div class="w">
        <span>已完成</span>
        </div>
         <a href="#" >订单详情</a>
        </div>
      </td>
       <td rowspan="2">
        <div class="good-operate">
        <span><a href="#">评价</a></span>
        <br>
        <div class="goog-buy">
        <a href="#">立即购买</a>
        </div>
        </div>
      </td>
   </tr>
    <tr class="th-notitle">
    <td>
         <div class="good">
         <div class="good-item">
           <a href="#"><img src="#" title="" width="60px" height="60px"></a>
         </div>
         <div class="good-mes">
            <a href="#">长裤xxxxxxxx</a>
         </div>
         </div>        
      </td>
      <td>
         <div class="good-price">
         80.0
         </div>
      </td>
       <td>
         <div class="good-number">
         X1
         </div>
      </td>
    </tr>
   
  </tbody>
</table>
</div>
</div>
</div>
<div class="footer">
	<div class="seperator"></div>
	<div class="footer-info">		
		<p>Copyright@2002-2016 一亩e田版权所有</p>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
	var type=<%=type%>;
	if(type=="2"){
		//alert($("#ordertoPay").attr("class"));
		$("#ordertoPay").attr("class","txt curr");
		$("#allorders").attr("class","txt");
		$("#ordertoReceive").attr("class","txt");
		$("#ordertoComment").attr("class","txt");
		}else  if(type=="all"){
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
	
	
});
</script>
</html>