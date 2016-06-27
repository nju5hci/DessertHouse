<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>半亩田-首页</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" href="../font-awesome-4.5.0/css/font-awesome.css">
    <script type="text/javascript" src="../js/script.js"></script>
        <script src="../js/jquery-2.2.3.min.js"></script>
<!-- bxSlider Javascript file -->
<script src="../plugins/bxslider/jquery.bxslider.js"></script>
<!-- bxSlider CSS file -->
<link href="../plugins/bxslider/jquery.bxslider.css" rel="stylesheet" />
</head>
<body>
<div class="header">
    <div class="title">半亩田首页</div>
    <div class="float-right">
        <a href="/DessertHouse/chart">购物车</a>
        <a href="/DessertHouse/orders">我的订单</a>
        <a href="/DessertHouse/personalSet">个人信息</a>
        <a href="login.jsp">退出</a>
    </div>
</div>
<div class="wapper">
<div class="wapper-header">
    <!--跳转到首页-->
    <a href="/DessertHouse/index2" class="title">半亩田</a>
    <div class="float-right">
        <form action="/DessertHouse/search" method="get">
          <input class="input-long" name="word" type="text" placeholder="请输入要搜索的关键词"></input>  
          <input class="input-submit" type="submit" value="搜索"></input>
        </form>
    </div>
    <div class="clear-fix"></div>
    <div class="seperator"></div>
</div>

<div class="wapper-middle">
    <div class="type-selector float-left">
        <div class="type-selector-title">全部商品分类</div>
        <div class="type-selector-list">
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=0">蔬菜</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=1">水果</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=2">肉类</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=3">海鲜</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=4">奶类</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=5">蛋类</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=6">速冻食品</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=7">调味料</a>
            </div>
            <div class="type-selector-row">
                <a href="/DessertHouse/type?typeId=8">酒类</a>
            </div>
        </div>
    </div>

    <div class="slider float-right">
        <ul class="bxslider">
  <li><img src="../img/1.jpg" /></li>
  <li><img src="../img/2.jpg" /></li>
  <li><img src="../img/3.jpg" /></li>
  <li><img src="../img/4.jpg" /></li>
</ul>
    </div>
    <div class="clear-fix"></div>
</div>

<div class="wapper-type-list">
    <div class="type-item" id="vegetable">
        <div class="type-title">
            <span class="float-left">蔬菜</span>
            <a class="float-right" href="/DessertHouse/type?typeId=0">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
         <% 
                                String[] money_dessert = (String[])request.getServletContext().getAttribute("money_dessert");
    	     if(money_dessert!=null){
                        		String[] address_dessert = (String[])request.getServletContext().getAttribute("address_dessert");
                        		String[] name_dessert = (String[])request.getServletContext().getAttribute("name_dessert");
                        		int []id_dessert=(int [])request.getServletContext().getAttribute("id_dessert");
                        		int num_dessert = (Integer)request.getServletContext().getAttribute("num_dessert");

                        		for(int i = 0;i<num_dessert;i++){
                	     %>
            <div class="type-commodity box">
            <a href="/DessertHouse/commodity?dessertid=<%=id_dessert[i] %>">
                <img src="<%=address_dessert[i] %> " class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_dessert[i] %></div>
                <div class="float-left commodity-price"><%=money_dessert[i] %></div>
                <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_dessert[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="fruit">
        <div class="type-title">
            <span class="float-left" >水果</span>
            <a class="float-right" href="/DessertHouse/type?typeId=1">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
          <% 
                                String[] money_fruit = (String[])request.getServletContext().getAttribute("money_fruit");
    	     if(money_fruit!=null){
                        		String[] address_fruit = (String[])request.getServletContext().getAttribute("address_fruit");
                        		String[] name_fruit = (String[])request.getServletContext().getAttribute("name_fruit");
                        		int []id_fruit=(int [])request.getServletContext().getAttribute("id_fruit");
                        		int num_fruit = (Integer)request.getServletContext().getAttribute("num_fruit");

                        		for(int i = 0;i<num_fruit;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_fruit[i] %>">
                <img src="<%=address_fruit[i] %>" class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_fruit[i] %></div>
                <div class="float-left commodity-price"><%=money_fruit[i] %></div>
                 <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_fruit[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="meat">
        <div class="type-title">
            <span class="float-left">肉类</span>
            <a class="float-right" href="/DessertHouse/type?typeId=2">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
  <% 
                                String[] money_meat = (String[])request.getServletContext().getAttribute("money_meat");
    	     if(money_meat!=null){
                        		String[] address_meat = (String[])request.getServletContext().getAttribute("address_meat");
                        		String[] name_meat = (String[])request.getServletContext().getAttribute("name_meat");
                        		int []id_meat=(int [])request.getServletContext().getAttribute("id_meat");
                        		int num_meat = (Integer)request.getServletContext().getAttribute("num_meat");

                        		for(int i = 0;i<num_meat;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_meat[i] %>">
                <img src="<%=address_meat[i] %>" class="commodity-photo">
                </a>
                
                <div class="commodity-name"><%=name_meat[i] %></div>
                <div class="float-left commodity-price"><%=money_meat[i] %></div>
              <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_meat[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>

        </div>
    </div>
    <div class="type-item" id="seafood">
        <div class="type-title">
            <span class="float-left">海鲜</span>
            <a class="float-right" href="/DessertHouse/type?typeId=3">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
        
          <% 
                                String[] money_seafood = (String[])request.getServletContext().getAttribute("money_seafood");
    	     if(money_seafood!=null){
                        		String[] address_seafood = (String[])request.getServletContext().getAttribute("address_seafood");
                        		String[] name_seafood = (String[])request.getServletContext().getAttribute("name_seafood");
                        		int []id_seafood=(int [])request.getServletContext().getAttribute("id_seafood");
                        		int num_seafood = (Integer)request.getServletContext().getAttribute("num_seafood");

                        		for(int i = 0;i<num_seafood;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_seafood[i] %>">
                <img src="<%=address_seafood[i] %>" class="commodity-photo">
                </a>
                
                <div class="commodity-name"><%=name_seafood[i] %></div>
                <div class="float-left commodity-price"><%=money_seafood[i] %></div>
                <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_seafood[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="milk">
        <div class="type-title">
            <span class="float-left">奶类</span>
            <a class="float-right" href="/DessertHouse/type?typeId=4">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
        
          <% 
                                String[] money_milk = (String[])request.getServletContext().getAttribute("money_milk");
    	     if(money_milk!=null){
                        		String[] address_milk = (String[])request.getServletContext().getAttribute("address_milk");
                        		String[] name_milk = (String[])request.getServletContext().getAttribute("name_milk");
                        		int []id_milk=(int [])request.getServletContext().getAttribute("id_milk");
                        		int num_milk = (Integer)request.getServletContext().getAttribute("num_milk");

                        		for(int i = 0;i<num_milk;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_milk[i] %>">
                <img src="<%=address_milk[i] %>" class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_milk[i] %></div>
                <div class="float-left commodity-price"><%=money_milk[i] %></div>
                <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_milk[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="egg">
        <div class="type-title">
            <span class="float-left">蛋类</span>
            <a class="float-right" href="/DessertHouse/type?typeId=5">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
        
          <% 
                                String[] money_egg = (String[])request.getServletContext().getAttribute("money_egg");
    	     if(money_egg!=null){
                        		String[] address_egg = (String[])request.getServletContext().getAttribute("address_egg");
                        		String[] name_egg = (String[])request.getServletContext().getAttribute("name_egg");
                        		int []id_egg=(int [])request.getServletContext().getAttribute("id_egg");
                        		int num_egg = (Integer)request.getServletContext().getAttribute("num_egg");

                        		for(int i = 0;i<num_egg;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_egg[i] %>">
                <img src="<%=address_egg[i] %>" class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_egg[i] %></div>
                <div class="float-left commodity-price"><%=money_egg[i] %></div>
               <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_egg[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="frozen">
        <div class="type-title">
            <span class="float-left">速冻食品</span>
            <a class="float-right" href="/DessertHouse/type?typeId=6">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list"> 
          <% 
                                String[] money_sd = (String[])request.getServletContext().getAttribute("money_sd");
    	     if(money_sd!=null){
                        		String[] address_sd = (String[])request.getServletContext().getAttribute("address_sd");
                        		String[] name_sd = (String[])request.getServletContext().getAttribute("name_sd");
                        		int []id_sd=(int [])request.getServletContext().getAttribute("id_sd");
                        		int num_sd = (Integer)request.getServletContext().getAttribute("num_sd");

                        		for(int i = 0;i<num_sd;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_sd[i] %>">
                <img src="<%=address_sd[i] %>" class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_sd[i] %></div>
                <div class="float-left commodity-price"><%=money_sd[i] %></div>
               <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_sd[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="flavor">
        <div class="type-title">
            <span class="float-left">调味料</span>
            <a class="float-right" href="/DessertHouse/type?typeId=7">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
          <% 
                                String[] money_tw = (String[])request.getServletContext().getAttribute("money_tw");
    	     if(money_tw!=null){
                        		String[] address_tw = (String[])request.getServletContext().getAttribute("address_tw");
                        		String[] name_tw = (String[])request.getServletContext().getAttribute("name_tw");
                        		int []id_tw=(int [])request.getServletContext().getAttribute("id_tw");
                        		int num_tw = (Integer)request.getServletContext().getAttribute("num_tw");

                        		for(int i = 0;i<num_tw;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_tw[i] %>">
                <img src="<%=address_tw[i] %>" class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_tw[i] %></div>
                <div class="float-left commodity-price"><%=money_tw[i] %></div>
              <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_tw[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
    <div class="type-item" id="others">
        <div class="type-title">
            <span class="float-left">酒类</span>
            <a class="float-right" href="/DessertHouse/type?typeId=8">查看更多>></a>
            <div class="clear-fix"></div>
        </div>
        <div class="red-seperator"></div>
        <div class="type-commodity-list">
          <% 
                                String[] money_alcohol = (String[])request.getServletContext().getAttribute("money_alcohol");
    	     if(money_alcohol!=null){
                        		String[] address_alcohol = (String[])request.getServletContext().getAttribute("address_alcohol");
                        		String[] name_alcohol = (String[])request.getServletContext().getAttribute("name_alcohol");
                        		int []id_alcohol=(int [])request.getServletContext().getAttribute("id_alcohol");
                        		int num_alcohol = (Integer)request.getServletContext().getAttribute("num_alcohol");

                        		for(int i = 0;i<num_alcohol;i++){
                	     %>
            <div class="type-commodity box" id="">
              <a href="/DessertHouse/commodity?dessertid=<%=id_alcohol[i] %>">
                <img src="<%=address_alcohol[i] %>" class="commodity-photo">
                </a>
                <div class="commodity-name"><%=name_alcohol[i] %></div>
                <div class="float-left commodity-price"><%=money_alcohol[i] %></div>
               <a class="float-right add-to-chart" href="/DessertHouse/addToChart2?dessertid=<%=id_alcohol[i] %>">加入购物车</a>
                <div class="clear-fix"></div>
            </div>
        
              <%
                        		}
    	     }
                         %>
        </div>
    </div>
</div>

</div>
<div class="footer">
    <div class="seperator"></div>
    <div class="footer-info">
        <p>com.nju.edu.cn hci:20/33/100</p>
        <p>2016.6.15</p>
    </div>
</div>
<div id="toaster-container"></div>
</body>
<script>
$(document).ready(function(){
	  jQuery(".bxslider").bxSlider();
	  commodity_addtochart();
	});
</script>
</html>