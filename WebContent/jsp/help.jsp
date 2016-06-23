<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>帮助中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
    <script type="text/javascript">
    $(function(){

   $(".a").hide();

});
    </script>
</head>
<body>
	<div class="header">
  	  		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="/DessertHouse/index">首页</a></li>
						<li><a href="/DessertHouse/reserve">预定产品</a></li>
						<li><a href="/DessertHouse/reserveActivity">购买活动票</a></li>
						<li><a href="/DessertHouse/reserveSoil">租赁土地</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
						<%
						    String name = (String)request.getServletContext().getAttribute("account_name");
						    if(name == null){
						%>
							<li><a href="login.jsp" target="_blank">请登录</a></li>
							<li><a href="register.jsp" target="_blank">免费注册</a></li>
						<%
						    }else{
						%>
						    <li><a href="#" target="_blank">欢迎你，<%=name %></a></li>
						<%
						    }
						%>
							<li><a href="/DessertHouse/account.action">我的会员卡</a></li>
						<li><a href="/DessertHouse/profile.action">我的个人详情</a></li>
						
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.jsp"><img src="../images/mu3.png" alt="" /></a>
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
				<div class="header_bottom">		 
						 	    <!------ Slider ------------>
								  <div class="slider">
							      	<div class="slider-wrapper theme-default">
							            <div id="slider" class="nivoSlider">
							               <img src="../images/grape.jpg" data-thumb="images/grape.jpg" alt="" />
							                <img src="../images/2.jpg" data-thumb="images/2.jpg" alt="" />
							                <img src="../images/3.jpg" data-thumb="images/3.jpg" alt="" />
							                <img src="../images/4.jpg" data-thumb="images/4.jpg" alt="" />
							                 <img src="../images/5.jpg" data-thumb="images/555.jpg" alt="" />
							            </div>
							        </div>
						   		</div>
						<!------End Slider ------------>
			     <div class="clear"></div>
			</div>
   		</div>
   </div>
   <!------------End Header ------------>
  <div class="main">
  	<div class="wrap">
      <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>购物指南</h3>
    		</br>
    		</div>
    		<p>1）评价有什么好处？</p>
    			<p>答：评价可以直接得到50积分，积分可以直接在购物时抵用或者在积分商店使用。</p>
    				</br>
    				<p>2）评价时间有要求吗？</p>
    			<p>答：没有要求。只要点击导航栏中的评价XX，就可以进入评价页面进行评价。</p>
    				</br>
    				<p>3）为何商品页面有赠品，下单之后无赠品？</p>
    			<p>答：一般商品促销时，赠品的数量有限，先到先得,送完即止。具体以您提交订单信息为准。</p>
    				</br>
    				<p>4）退货会扣除包装费吗？</p>
    			<p>答：商品退货、拒收时礼品盒及贺卡费用不会扣除。</p>
    				</br>
    		<div class="heading">
    		<h3>订单问题</h3>
    				</br>
    		</div>
    		<p>1）刚刚我下了订单，我想查询下我的订单，如何查询？</p>
    			<p>答：在导航栏中可以点击已下订单进行查看。</p>
    				</br>
    				<p>2）为什么我的订单总是无法提交成功？</p>
    			<p>答： 可能存在以下几种情况：

（1）订单信息填写不完整；

（2）订单商品库存不足或者库存无货；

（3）订单商品不能配送到您所填写的收货地址；

（4）网络延时； </p>
    				</br>
    				<p>3）我能修改订单的哪些内容？</p>
    			<p>答： 1)修改购物车内的商品数量，增加或删除商品；（暂不支持添加套装）

2)修改收货人信息、配送方式、发票信息、订单备注； </p>
    				</br>
    				<p>4）为什么我的订单无法点击确认收货？</p>
    			<p>请您收货后点击确认收货，如果无法点击，可能是系统故障，请您稍后再试。 </p>
    				</br>
    				
    					<div class="heading">
    		<h3>配送方式</h3>
    		</br>
    		</div>
    		<p>1）签收时发现商品包装破损，该如何处理？ </p>
    			<p>答：一旦商品包装出现破损，建议您直接拒收商品，后续问题请联系客服为您处理。</p>
    				</br>
    				<p>2）付款以后可以当场验收商品吗？</p>
    			<p>答： 您付款签收后，可以当场验收商品，如商品本身有问题请您在“我的京东”中提交退换货申请，将有专业售后人员为您解决。 </p>
    				</br>
    				<p>3）订单已提交成功，什么时候可以发货？ </p>
    			<p>答：订单提交成功后我们会尽快发货，详细进度您可以进入“我的订单”，通过追踪功能实时查看订单进度。</p>
    				</br>
    				<p>4）快递告知丢件，怎么处理？</p>
    			<p>答：先货后款订单建议您重新下单购买；先款后货订单建议您提交退款申请，如您还需要该商品建议重新下单购买。</p>
    				</br>
    				<div class="heading">
    		<h3>其他</h3>
    		<p>如果还有问题，可以关注微信公众号~</p>
    				</br>
    		</br>
    		</div>
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
                        <li><a href="info.jsp">关于我们</a></li>
						<li><a href="help.jsp">帮助中心</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4><b>后台入口</b></h4>
                    <ul>
						<li><a href="login.jsp" target="_blank">管理员登录</a></li>
					
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
				<p>Copyright &copy; 2016.Company name All rights reserved.</p>
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

