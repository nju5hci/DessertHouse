<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>半亩田-商品详情</title>
 <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../font-awesome-4.5.0/css/font-awesome.css">
        <script src="../js/jquery-2.2.3.min.js"></script>
        <script src="../js/script.js"></script>
        <!-- bxSlider Javascript file -->
<script src="../plugins/bxslider/jquery.bxslider.js"></script>
<!-- bxSlider CSS file -->
<link href="../plugins/bxslider/jquery.bxslider.css" rel="stylesheet" />
	<script type="text/javascript" src="../js/highcharts/highcharts.js"></script> 
	<script type="text/javascript" src="../js/highcharts/exporting.js"></script> 
	<script type="text/javascript">
	$(function () {
	    $('#container').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '价格趋势图'
	        },
	        xAxis: {
	            categories: [
	                '上月',
	                '上周',
	                '五天前',
	                '三天前',
	                '昨天',
	                '今天'
	            ]
	        },
	        yAxis: {
	            min: 0,
	            title: {
	                text: '金额'
	            }
	        },
	        tooltip: {
	            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	                '<td style="padding:0"><b>{point.y:.1f}元</b></td></tr>',
	            footerFormat: '</table>',
	            shared: true,
	            useHTML: true
	        },
	        plotOptions: {
	            column: {
	                pointPadding: 0.2,
	                borderWidth: 0
	            }
	        },
	        series: [ <% 
	                   
	          		double []price=(double [])request.getServletContext().getAttribute("price");
	      
	           %>{
	            name: 'Male',
	            data: [<%=price[0]%>,<%=price[1]%>, <%=price[2]%>, <%=price[3]%>,<%=price[4]%>,<%=price[5]%>]

	        }]
	    });
	});				
	</script>
	
	<script type="text/javascript">
	$(function () {
	    $('#container').highcharts({
	        title: {
	            text: '价格趋势图',
	            x: -20 //center
	        },
	        xAxis: {
	            categories: [  '上月',
	       	                '上周',
	    	                '五天前',
	    	                '三天前',
	    	                '昨天',
	    	                '今天']
	        },
	        yAxis: {
	            title: {
	                text: '价格'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	        tooltip: {
	            valueSuffix: '元'
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        series: [
	        	<% 
	        	String dessertName=(String)request.getServletContext().getAttribute("dessertName");  
          	
           %>{
            name: '<%=dessertName%>',
            data: [<%=price[0]%>,<%=price[1]%>, <%=price[2]%>, <%=price[3]%>,<%=price[4]%>,<%=price[5]%>]
	        }
	        ]
	    });
	});
	</script>
</head>
<body>
<div class="header">
 <a href="/DessertHouse/index2" class="title">半亩田首页</a>
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
          <input class="input-long"name="word" type="text" placeholder="请输入要搜索的关键词"></input>  
          <input class="input-submit" type="submit" value="搜索"></input>
        </form>
    </div>
    <div class="clear-fix"></div>
    <div class="seperator"></div>
    </div>
    <div class="wapper-detail-middle">
    <%
						    int dessertid = (int)request.getServletContext().getAttribute("dessertid");
					 int dessertStock = (int)request.getServletContext().getAttribute("dessertStock");
				    	
					   // 	String dessertName=(String)request.getServletContext().getAttribute("dessertName");
					    	double dessertPrice=(double)request.getServletContext().getAttribute("dessertPrice");
					    
					    	String dessertPicAdd=(String)request.getServletContext().getAttribute("dessertPicAdd");
					    	String dessertPicAdd1=(String)request.getServletContext().getAttribute("dessertPicAdd1");
					    	String dessertPicAdd2=(String)request.getServletContext().getAttribute("dessertPicAdd2");
					    	 int monthSale = (int)request.getServletContext().getAttribute("monthSale");
					    	 int totalSale = (int)request.getServletContext().getAttribute("totalSale");
					    	 int assessNum = (int)request.getServletContext().getAttribute("assessNum");
					    	 String dessertInfoPicAdd=(String)request.getServletContext().getAttribute("dessertInfoPicAdd");
						    	String dessertInfoPicAdd1=(String)request.getServletContext().getAttribute("dessertInfoPicAdd1");
						    	String dessertInfoPicAdd2=(String)request.getServletContext().getAttribute("dessertInfoPicAdd2");
						    	String dessertInfoPicAdd3=(String)request.getServletContext().getAttribute("dessertInfoPicAdd3");
						%>
        <div class="commodity-detail-photo float-left">
        <ul class="bxslider">
            <li><img src="<%=dessertPicAdd %>" /></li>
            <li><img src="<%=dessertPicAdd1 %>" /></li>
            <li><img src="<%=dessertPicAdd2 %>" /></li>
          
        </ul>
        </div>
        <div class="commodity-detail float-right">
        <div class="commodity-detail-title"><%=dessertName%></div>
        <div class="commodity-detail-item">
            <span class="commodity-detail-label">价格：</span>
            <span class="commodity-detail-price"><%=dessertPrice %></span>
        </div>
        <div class="commodity-detail-item">
            <span class="commodity-detail-label">送到：</span>
            <span class="commodity-detail-label">江苏省-南京市-玄武区</span>
        </div>
        <div class="commodity-detail-sale">
            <div>
                <span class="commodity-detail-label">月销量</span>
                <span class="commodity-detail-number" id="month-sale"><%=monthSale %></span>
            </div>
            <div class="vertical-seperator"></div>
            <div>
                <span class="commodity-detail-label">总销量</span>
                <span class="commodity-detail-number" id="all-sale"><%=totalSale %></span>
            </div>
            <div class="vertical-seperator"></div>
            <div>
                <span class="commodity-detail-label">评价数</span>
                <span class="commodity-detail-number" id="all-comment"><%=assessNum %></span>
            </div>
        </div>
           <form action="/DessertHouse/addToChart?dessertid=<%=dessertid %>" method="post">
        <div class="commodity-number-selector">
     	
            <span class="commodity-detail-label" >数量:</span>
            <input type="text" value="1" class="input-small" name="num"></input>
            <span class="commodity-detail-label" id="commodity-amount">库存数量：<%=dessertStock %></span>
        </div>
        	
      <!--  <div class="input-submit">加入购物车</div> --> 
          <input class="input-submit" type="submit" value="加入购物车"  >
        </form>
        </div>

        <div class="clear-fix"></div>
        
    </div>
    <div class="red-seperator"></div>
    <div class="wapper-detail-bottom">
        <div class="wapper-detail-bottom-header">
          <span class="detail-header-option detail-header-option-now float-left" id="commodity-detail">商品详情</span>
            <span class="detail-header-option float-left" id="commodity-comment">商品评价</span>
            <span class="detail-header-option float-left" id="commodity-trend">价格趋势</span>
        </div>
        <div class="clear-fix"></div>
       <div class="wapper-detail-content" id="detail">
            <img src="<%=dessertInfoPicAdd %>">
          <img src="<%=dessertInfoPicAdd1 %>">
             <img src="<%=dessertInfoPicAdd2 %>">
                <img src="<%=dessertInfoPicAdd3 %>">
                
        </div>
  <div class="wapper-detail-content" style="display: none;" id="comment">
            <div class="comment-list">
            <%
            String[] words_assess = (String[])request.getServletContext().getAttribute("words_assess");
			
			if(words_assess != null){
				
			  int[] memberId_assess = (int[])request.getServletContext().getAttribute("memberId_assess");
				
			   String[] time_assess = (String[])request.getServletContext().getAttribute("time_assess");
			   int assessNum2 = (Integer)request.getServletContext().getAttribute("assessNum2");
			   for(int i = 0;i<assessNum2;i++){
			   %>
                <div class="comment-item">
                    <div class="float-left">
                        <div class="comment-content"><%=words_assess[i] %></div>
                        <div class="comment-time"><%=time_assess[i] %></div>
                    </div>
                    <div class="float-right">
                        <div class="comment-user"><%=memberId_assess[i] %></div>
                    </div>
                </div>
              	<% 
			 
				
			%>
					<%
			   }%>
	
			<% 	}
			%>
		
               
            </div>
        </div>
           <div class="wapper-detail-content" style=" display: none;"id="trend">
           
           	<div id="container" style="min-width:1000px;height:400px"></div>
           
           
           
           
           
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
	  commodityAltOptions();
	  confirmAddToChart();
	});
</script>
</html>