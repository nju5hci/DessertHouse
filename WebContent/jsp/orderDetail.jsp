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
<script type="text/javascript" src="../js/jquery-2.2.3.min.js"></script> 
</head>
<body>
<div class="wapper">
<div class="header">
    <div class="title">半亩田</div>
    <div class="float-right">
        <a href="">购物车</a>
        <a href="">我的订单</a>
        <a href="">设置</a>
        <a href="">退出</a>
    </div>
</div>
<div class="container" style="margin-top:-30px">
<div class="order_id_title">
<p style="font-size:13px">我的一亩>订单中心>订单:</p>
</div>
<div class="order_state_process">

<p align="center" style="font-size:12px">订单号:xxxx</p>

<div class="right">

<div class="process">

<!--进度条-->
<table cellpadding="0" cellspacing="0" align="center" width="100%">    
        <tr>  
        <td colspan="6">
           <div class="show_state type1" id="process_show">
    
         </div>
        </tr>  
         
    </table>  

</div>


</div>
</div>
<div class="order_class">
<div class="left">

<p class="title">收货人信息</p><br>
<p class="item">地址:  xxxx</p>
</div>
<div class="left1">
<p class="title">配送信息</p><br>
<p class="item">配送方式:</p>
<p class="item">送货日期:</p>
</div>
<div class="right">
<p class="title">付款信息</p><br>
<p class="item">付款方式:</p>
<p class="item">商品总额:</p>
</div>

</div>
<div class="list_class">
<table class="table_title" >
  <colgroup>
  <col class="bought-table_col1">
  <col class="bought-table_col2">
  <col class="bought-table_col3">
  <col class="bought-table_col4">
  <col class="bought-table_col5">
  <col class="bought-table_col6">
  </colgroup>
  
  <tr class="link_title" style="background-color:white">
  <th>商品</th>
  <th>商品编号</th>
  <th>单价</th>
  <th>数量</th>
  <th>金额</th>  
  <th>操作</th>
  </tr>
  <tr class="th-notitle">
      <td >
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
         312222
         </div>
      </td>
       <td>
         <div class="good-number">
         87
         </div>
      </td>
        <td>
        <div class="good-pay">
        
        <span>X1</span> 
       
         </div>
      </td>
       <td >
        <div class="good-state">
        <span>金额227</span>
        </div>
      </td>
       <td>        
        <div class="goog-buy" style="text-align:center;border:2px solid white;">
        <a href="#">立即购买</a>
        </div>
      </td>
   </tr>
 <!-- - -->
 <tr class="th-notitle">
      <td >
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
         312222
         </div>
      </td>
       <td>
         <div class="good-number">
         87
         </div>
      </td>
        <td>
        <div class="good-pay">
        
        <span>X1</span> 
       
         </div>
      </td>
       <td >
        <div class="good-state">
        <span>金额227</span>
        </div>
      </td>
       <td>        
        <div class="goog-buy" style="text-align:center;border:2px solid white;">
        <a href="#">立即购买</a>
        </div>
      </td>
   </tr>
   <tr class="th-notitle">
      <td >
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
         312222
         </div>
      </td>
       <td>
         <div class="good-number">
         87
         </div>
      </td>
        <td>
        <div class="good-pay">
        
        <span>X1</span> 
       
         </div>
      </td>
       <td >
        <div class="good-state">
        <span>金额227</span>
        </div>
      </td>
       <td>        
        <div class="goog-buy" style="text-align:center;border:2px solid white;">
        <a href="#">立即购买</a>
        </div>
      </td>
   </tr>
   <!--  -->
  </table>
  <div class="all_pay">

<div class="left">
   <p align="center">xxxx</p>
   <p align="center"> xxx</p>
</div>
<div class="right">
   <p>商品总额:</p>
   <p>折&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;扣:</p>
</div>   
</div>
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
</html>