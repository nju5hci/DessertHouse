<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一亩田-水果</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
        <script src="../js/jquery-2.2.3.min.js"></script>
        <link rel="stylesheet" href="../font-awesome-4.5.0/css/font-awesome.css">
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
    <div class="box category float-left ">
    	<div class="category-header">所有类目</div>
    	<div class="category-list-div">
    		<ul class="category-list">
    			<li class="category-item"><a href="/DessertHouse/type?typeId=0">蔬菜</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=1">水果</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=2">肉类</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=3">海鲜</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=4">奶类</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=5">蛋类</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=6">速冻食品</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=7">调味料</a></li>
    			<li class="category-item"><a href="/DessertHouse/type?typeId=8">酒类</a></li>
    		</ul>
    	</div>
    </div>
    <div class="commodity-content float-right">
    	<div class="commodity-filter">
    	    <div class="commodity-rank commodity-rank-now float-left" id="rank-default">默认</div>
    	    <div class="commodity-rank float-left" id="rank-sale">
    	        销量
    	        <i class="fa fa-arrow-down"></i>
    	    </div>
    	    <div class="commodity-rank float-left" id="rank-price">
    	        价格
    	        <i class="fa fa-arrow-up"></i>
    	    </div>
    	    <div class="commodity-rank float-left" id="rank-price-range">
    	        价格范围
    	        <input type="text" class="input-small"></input>
    	        -
    	        <input type="text" class="input-small"></input>
    	        <span class="confirm-range">确认</span>
    	    </div>
    	    
        </div>
        <div class="clear-fix"></div>
        <div class="commodity-list">
        
    	    <div class="commodity-row">
    	     <% 
                                String[] money_dessert = (String[])request.getServletContext().getAttribute("money_dessert");
    	     if(money_dessert!=null){
                        		String[] address_dessert = (String[])request.getServletContext().getAttribute("address_dessert");
                        		String[] name_dessert = (String[])request.getServletContext().getAttribute("name_dessert");
                        		int []id_dessert=(int [])request.getServletContext().getAttribute("id_dessert");
                        		int num_dessert = (Integer)request.getServletContext().getAttribute("num_dessert");
                        		if(num_dessert>4){
                        			num_dessert=4;
                        		}
                        		for(int i = 0;i<num_dessert;i++){
                	     %>
    		    <div class="type-commodity box">
                <img src="<%=address_dessert[i] %> " class="commodity-photo">
                <div class="commodity-name"><%=name_dessert[i] %> </div>
                <div class="float-left commodity-price"><%=money_dessert[i] %> </div>
                <div class="float-right add-to-chart">加入购物车</div>
                <div class="clear-fix"></div>
            </div>
         
              <%
                        		}
    	
                         %>
                          
    	    </div>
    	       <div class="commodity-row">
    	       <%
                        	if(num_dessert<4){
                        		
                         %>
    	       <%
                        		}else{
                        		    for(int i = 4;i<num_dessert;i++){
                         %>
    	 
    	
    		    <div class="type-commodity box">
                <img src="<%=address_dessert[i] %>" class="commodity-photo">
                <div class="commodity-name"><%=name_dessert[i] %></div>
                <div class="float-left commodity-price"><%=money_dessert[i] %> </div>
                <div class="float-right add-to-chart">加入购物车</div>
                <div class="clear-fix"></div>
            </div>
           <%
                        		}
                         %>
    	   
    <%
                        		}
    	     }
                         %>
        </div>
        </div>
        <div id="bottomList" class="float-right">
                <div id="pageList">
                    <a href="" class="prevPage">上一页</a>
                    <a href="" class="page pageActive">1</a>
       <!--        <a href="" class="page">2</a>
                <a href="" class="page">3</a>
                    <a href="" class="page">4</a>
                    <a href="" class="page">5</a>
                    <a href="" class="page">6</a>
                    <strong>...</strong>
                    <a href="" class="endPage">233</a> -->
                    <a href="" class="nextPage">下一页</a>
                </div>
                <div id="skipPages">
                     <span id="totalPages">共1页，跳至</span>
                     <input id="inputPages"/>
                     <span id="pageNum">页</span>
                </div>
            </div>
    </div>
    <div class="clear-fix"></div>
</div>
<div class="footer">
    <div class="seperator"></div>
    <div class="footer-info">
        <p>com.nju.edu.cn hci:20/33/100</p>
        <p>2016.6.15</p>
    </div>
</div>
</body>
</html>