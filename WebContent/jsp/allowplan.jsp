<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核计划</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/component.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/date.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<style>
.btn{
    text-align:center;
    cursor:pointer;
	padding:10px 10px;
	font-family: 'ambleregular';
	background:#FC7D01;
	color: #FFF;
	text-decoration: none;
	outline: 0;
}
.btn:hover{
	  text-shadow: 0px 0px 1px #000;
	  background:#292929;
}
    input{padding:8px 5px;width:18.5%;display:block; border-radius:3px;border:1px solid #ddd;outline:none;text-align:center;color:#666;box-shadow: 2px 2px 5px 0px rgba(50, 50, 50, 0.35);}
input:focus{border-color:#ccc;color:#333;}
</style>
</head>
<body>
	<div class="header">
  	  		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="/MStores/sale">售票</a></li>
						<%
						String type = (String)request.getServletContext().getAttribute("accountType");
						if(type=="waiterBig"){
						%>
						<li><a href="/MStores/plan.action">制定甜品计划</a></li>
		
						<%
						}
						if(type=="manager"){
						%>
						<li><a href="/MStores/allowplan.action">甜品计划</a></li>
						<li><a href="/MStores/count.jsp">统计图表</a></li>
						<%
						}
						%>
					</ul>
				</div>
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
						<a href="index.jsp"><img src="../images/logo3.png" alt="" /></a>
					</div>
			 <div class="clear"></div>
  		</div>     
   		</div>
   </div>
   <!------------End Header ------------>
     <div class="main">
 	<div class="wrap">
     <div class="content">
     	<div class="content_top">
    		<div class="back-links">
    		<p><a href="/MStores/sale.action">售票</a> &gt;&gt;&gt; <a href="#" class="active">甜品计划</a></p>
    	    </div>
    		<div class="clear"></div>
    	</div>
    <div class="component">
        <form method="post" action="#">
		<table>
			<thead>
				<tr>
          <!--          <th>计划ID</th> --> 
			 <!--    		<th>制定者ID</th> --> 
					<th>分店ID</th>
					<th>甜品ID</th>
					<th>甜品名字</th>
					<th>价格</th>
					<th>数量</th>
					<th>执行日期</th>
                   	<th>批准</th>
                    <th>待修改</th>

				</tr>
			</thead>
			<%
            String[] dessert_name = (String[])request.getServletContext().getAttribute("dessert_name");
			if(dessert_name != null){
			  
				int[] dessert_id=(int [])request.getServletContext().getAttribute("dessert_id");
				int[] plan_id=(int [])request.getServletContext().getAttribute("plan_id");
				int[] waiter_id=(int [])request.getServletContext().getAttribute("waiter_id");
				int[] branch_id=(int [])request.getServletContext().getAttribute("branch_id");
				int[] dessert_num=(int [])request.getServletContext().getAttribute("dessert_num");
				double[] dessert_price=(double [])request.getServletContext().getAttribute("dessert_price");
				 String[] status = (String[])request.getServletContext().getAttribute("status");
				 String[] date = (String[])request.getServletContext().getAttribute("date");
				 
			   int num = (Integer)request.getServletContext().getAttribute("num");
             %>
			<tbody>
			<% 
			   for(int i = 0;i<num;i++){
			%>
				<tr><td><%=branch_id[i] %></td><td><%=dessert_id[i] %></td><td ><%=dessert_name[i] %></td><td><%=dessert_price[i] %></td><td><%=dessert_num[i] %></td><td><%=date[i] %></td><td><a href="/DessertHouse/allowandalter?plan_id=<%=plan_id[i]%>&&allow=1">批准</a></td><td><a href="/DessertHouse/allowandalter?plan_id=<%=plan_id[i]%>&&allow=2">待修改</a></td></tr>
			<%
			   }
			}
			%>
			</tbody>  
		</table>
        </form>
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
                        <li><a href="contact.jsp">联系我们</a></li>
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
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>