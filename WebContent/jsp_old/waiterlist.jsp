<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>所有在职员工</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</head>
<div class="header">
  	  		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
					
						
					</ul>
				</div>
					<div class="account_desc">
						
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.jsp"><img src="../images/logo3.png" alt="" /></a>
					</div>
						<div class="header_top_right">
							  <div class="search_box">
					     		<form>
					     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
					     		</form>
					     	</div>
						 <div class="clear"></div>
					</div>
			 <div class="clear"></div>
  		</div>     
			
   		</div>
   </div>
<body>
    <form action="/DessertHouse/addWaiter"  method="post" id="contactform">
     <%    int[] id_allwaiter = (int[])request.getServletContext().getAttribute("id_allwaiter");
   
     int[] branch_allwaiter = (int[])request.getServletContext().getAttribute("branch_allwaiter");
                        		String[] name_allwaiter = (String[])request.getServletContext().getAttribute("name_allwaiter");
                        		
                        		int num_allwaiter = (Integer)request.getServletContext().getAttribute("num_allwaiter");
                        		for(int i = 0;i<num_allwaiter;i++){
                        		%>
                        
                        		
    <label><input name="waiter" type="checkbox" value="<%=id_allwaiter[i] %>" /><%="id:"+id_allwaiter[i]+"   name:"+name_allwaiter[i]+"   branch:"+branch_allwaiter[i]%> </label> 
                        		<p></p>  
                        		  <%
                        		  
                        			
                        		}
                        		
                         %>
<input type="submit" name="submit" value="确认添加" class="submit">
                                
                        	
 
    </form> 
</body>
</html>