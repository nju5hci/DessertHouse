<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>一亩田-购物车</title>
   <link rel="stylesheet" type="text/css" href="../css/style.css">
        <script src="../js/jquery-2.2.3.min.js"></script>
        <script src="../js/script.js"></script>
         <script src="http://apps.bdimg.com/libs/angular.js/1.4.6/angular.min.js"></script>
</head>
<body>
<div class="header">
    <div class="title">一亩田首页</div>
    <div class="float-right">
        <a href="">购物车</a>
        <a href="">我的订单</a>
        <a href="">设置</a>
        <a href="">退出</a>
    </div>
</div>
<div class="wapper">    
 <form action="/DessertHouse/confirmOrder"  method="post" id="contactform">
	<div class="wapper-header">
    <!--跳转到首页-->
    <a href="" class="title">一亩田</a>
    <div class="float-right">
        <form method="get">
          <input class="input-long" type="text" placeholder="请输入要搜索的关键词"></input>  
          <input class="input-submit" type="submit" value="搜索"></input>
        </form>
    </div>
    <div class="clear-fix"></div>
    <div class="seperator"></div>
    </div>
    <div class="wapper-chart-title">
        <div class="float-left checkbox">
            <input class="js-check-all" type="checkbox" id="check-all">
            <label class="checkbox-img" for="check-all"></label>
        </div>
    	<span id="title-1">全选</span>
    	<span id="title-2">商品信息</span>
    	<span id="title-3">单价（元）</span>
    	<span id="title-4">数量</span>
    	<span id="title-5">金额</span>
    	<span id="title-6">操作</span>
    </div>
    <div class="seperator"></div>
    <div class="wapper-chart-list">
       <% 
                                String[] dessertName = (String[])request.getServletContext().getAttribute("dessertName");
            		double total=0;
            		if(dessertName!=null){
                        		String[] dessertPicture = (String[])request.getServletContext().getAttribute("dessertPicture");
                        		double[] dessertPrice = (double[])request.getServletContext().getAttribute("dessertPrice");
                        		double[] totalPrice = (double[])request.getServletContext().getAttribute("totalPrice");
                          		int []dessertNum=(int [])request.getServletContext().getAttribute("dessertNum");
                        		int []dessertId=(int [])request.getServletContext().getAttribute("dessertId");
                        		int []orderListId=(int [])request.getServletContext().getAttribute("orderListId");
                        		int num = (Integer)request.getServletContext().getAttribute("num");

                        		for(int i = 0;i<num;i++){
                        		
                	     %>
                	     
    	
    	 <div class="wapper-chart-item" ng-app="" ng-init="price=29.9;n=1">
    		<div class="float-left checkbox">
    		
                <input class="js-check" type="checkbox" name="orderList" value="<%=orderListId[i] %>">
                <label class="checkbox-img"></label>
            </div>
            <div class="float-left chart-item-info">
            	<img src="<%=dessertPicture[i] %>" class="chart-item-photo">
            	<a href="" class="chart-item-name"><%=dessertName[i] %></a>
            </div>
            <div class="float-left chart-item-price"><%=dessertPrice[i] %></div>
            <div class="float-left chart-item-num">
                <input class="input-small" value="1" ng-model="n"></input>
            </div>
         
                 <div class="float-left chart-item-amount">{{price*n|number:2}}</div>
            <div class="float-left chart-item-operator">删除</div>
            <div class="clear-fix"></div>
    	</div>
        
         <%
     	total=total+totalPrice[i];
                        		}
    	     }
                         %>
      
    </div>
    <div class="wapper-chart-bottom">
    	<div class="float-right">
    	    <div class="chart-amount">总金额：<%=total %></div>
    	  <input class="confirm" type="submit" value="结算"  >

    		</a>
    	</div>
        <div class="clear-fix"></div>
    </div>
    </form>
    
</div>
<div class="footer">
    <div class="seperator"></div>
    <div class="footer-info">
        <p>com.nju.edu.cn hci:20/33/100</p>
        <p>2016.6.15</p>
    </div>
</div>
<script type="text/javascript">
    initCheckBox();
    chartDeleteCommodity();
</script>
</body>
</html>