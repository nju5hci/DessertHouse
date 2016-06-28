<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>半亩田-分类</title>
	<link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/script.js"></script>
        <script src="../js/jquery-2.2.3.min.js"></script>
        <link rel="stylesheet" href="../font-awesome-4.5.0/css/font-awesome.css">
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
        <form  action="/DessertHouse/search" method="get">
          <input class="input-long"name="word" type="text" placeholder="请输入要搜索的关键词"></input>  
          <input class="input-submit" type="submit" value="搜索"></input>
        </form>
    </div>
    <div class="clear-fix"></div>
    <div class="seperator"></div>
    </div>
    <div class="box category float-left ">
      <% int currentpage=0; 
      if(request.getParameter("page")!=null){
    	  currentpage=Integer.parseInt(request.getParameter("page"));    	  
    	//  System.out.println(currentpage);
      }
    System.out.println("----"+currentpage);
   %> 
 
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
    	     int maxpage=0;
    	     if(money_dessert!=null){
                        		String[] address_dessert = (String[])request.getServletContext().getAttribute("address_dessert");
                        		String[] name_dessert = (String[])request.getServletContext().getAttribute("name_dessert");
                        		int []id_dessert=(int [])request.getServletContext().getAttribute("id_dessert");
                        		int num_dessert = (Integer)request.getServletContext().getAttribute("num_dessert");
                      System.out.println(currentpage);
                      System.out.println(num_dessert);
                        	maxpage=num_dessert/8;
                    		int beginnumber=0;
                    		int endnumber=0;
                    		int beginnumber1=0;
                    		int endnumber1=0;
                    		int pagesize=8;
                    		boolean hasxia=false;
                    		if(num_dessert<=4){
                    			beginnumber=0;
                    			endnumber=num_dessert;
                    			hasxia=false;
                    		}else if(num_dessert<=8){
                    			endnumber=4;
                    			beginnumber1=4;
                    			endnumber1=num_dessert;
                    			hasxia=true;
                    		}else {
                    			beginnumber=currentpage*8;
                    			if(beginnumber+4>=num_dessert){
                    				
                    				endnumber=num_dessert;
                    			}else if(beginnumber+8>=num_dessert){
                    				hasxia=true;
                    				endnumber=beginnumber+4;
                    				beginnumber1=beginnumber+4;
                        			endnumber1=num_dessert;
                    			}else{
                    				hasxia=true;
                    				endnumber=beginnumber+4;
                    				beginnumber1=beginnumber+4;
                        			endnumber1=beginnumber1+4;
                    			}
                    		}
                        		
                        		for(int i = beginnumber;i<endnumber;i++){
                	     %>
    		    <div class="type-commodity box">
    		    
    		     <a href="/DessertHouse/commodity?dessertid=<%=id_dessert[i] %>">
                <img src="<%=address_dessert[i] %> " class="commodity-photo">
                </a>
            
                <div class="commodity-name"><%=name_dessert[i] %> </div>
                <div class="float-left commodity-price"><%=money_dessert[i] %> </div>
                <div class="float-right add-to-chart"id="<%=id_dessert[i] %>">加入购物车</div>
                <div class="clear-fix"></div>
            </div>
         
              <%
                        		}
    	
                         %>
                          
    	    </div>
    	       <div class="commodity-row">
    	       <%
    	   	if(beginnumber+4>=num_dessert){
				hasxia=false;}
    	       
                        	if(!hasxia){
                        		
                         %>
    	       <%
                        		}else{
                        		
                        			
                        		    for(int i = beginnumber1;i<endnumber1;i++){
                         %>
    	 
    	
    		    <div class="type-commodity box">
                <img src="<%=address_dessert[i] %>" class="commodity-photo">
                <div class="commodity-name"><%=name_dessert[i] %></div>
                <div class="float-left commodity-price"><%=money_dessert[i] %> </div>
                <div class="float-right add-to-chart"id="<%=id_dessert[i] %>">加入购物车</div>
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
    
                      <button class='prevPage' id='prevPage'>上一页</button>
                       <%
                      
                       int begin=0;
                       int end=0;
                       if(maxpage<=5){
                    	   end=maxpage;
                       }else{
                    	   begin=currentpage;
                    	   if(maxpage>begin+5){
                    		   end=begin+5;
                    	   }else{
                    		   end=maxpage;
                    	   }
                       }
                      
                        	for(int i=begin;i<=end;i++){
                         %>
                    <a href="type.jsp?page=<%=i%>" class="page pageActive"><%=i+1 %></a>
					 <%
                        		}
                         %>
    	   
                    
     <button class='nextPage' id='nextPage'>下一页</button>
                </div>
                <div id="skipPages">
               <span id="totalPages">共1页，跳至</span>
                     <input class="xx" id="inputPages"value="<%=currentpage+1%>" />
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
<div id="toaster-container"></div>
<script type="text/javascript">
add_to_chart();
change_page();
var pagenumber=<%=currentpage%>;
if(pagenumber==0){
//	alert(pagenumber);
	document.getElementById("prevPage").disabled=true;
	$("#prevPage").removeClass("prevPage");
	
}else{
	document.getElementById("prevPage").disabled=false;
	$("#prevPage").addClass("prevPage");
	
	}
if(pagenumber==<%=maxpage%>){
	document.getElementById("nextPage").disabled=true;
	$("#nextPage").removeClass("prevPage");
	}else{
	document.getElementById("nextPage").disabled=false;
	$("#nextPage").addClass("prevPage");
	}


$("#nextPage").click(function(){

	var number=pagenumber+1;

	var url="type.jsp?page="+number;

	window.location.href=url;
});
$("#prevPage").click(function(){

	var number=pagenumber-1;
	var url="type.jsp?page="+number;

	window.location.href=url;
});

function change_page(){
	$(".xx").click(function(){
		
		var num=$(".xx").val();
		num=num-1;
		window.location.href="type.jsp?page="+num;

	     
     });

}
</script>
</body>
</html>