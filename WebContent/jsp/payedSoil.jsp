<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>合同</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>

<link href="../css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="../css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<link href='../images/logo.png' rel="shortcut icon" type="image/x-icon" media="screen"/>
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript" src="../js/jquery.nivo.slider.js"></script>
</head>
<body>
	<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="/DessertHouse/index">首页</a></li>
					<li><a href="/DessertHouse/reserveSoil">租赁土地</a></li>
						
						<li><a href="/DessertHouse/mySoil">我的土地</a></li>
					
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
						<a href="/DessertHouse/index"><img src="../images/mu3.png" alt="" /></a>
					</div>
					
						  <script type="text/javascript">
								function DropDown(el) {
									this.dd = el;
									this.initEvents();
								}
								DropDown.prototype = {
									initEvents : function() {
										var obj = this;
					
										obj.dd.on('click', function(event){
											$(this).toggleClass('active');
											event.stopPropagation();
										});	
									}
								}
					
								$(function() {
					
									var dd = new DropDown( $('#dd') );
					
									$(document).click(function() {
										// all dropdowns
										$('.wrapper-dropdown-2').removeClass('active');
									});
					
								});
					    </script>
			   <div class="clear"></div>
  		    </div>     				
   		</div>
   </div>
   <div class="main">
   	 <div class="wrap">
   	 
   	 	<div class="section group">
   	 		   <div class="content_top">
               	<div class="heading">
    		<h3>合同</h3>
    		</div>
                 	</div>
				<div class="cont-desc span_1_of_2">
				  <div class="product-details">				
					
				
						<%
            String[] dessert_place = (String[])request.getServletContext().getAttribute("dessert_place");
						  String[] date = (String[])request.getServletContext().getAttribute("date");
			 int[] reserve_id =null;
			if(dessert_place != null){
				   reserve_id = (int[])request.getServletContext().getAttribute("reserve_id");
			  int[] dessert_id = (int[])request.getServletContext().getAttribute("dessert_id");
			
				 double []dessert_price=(double[])request.getServletContext().getAttribute("dessert_price");
			 // String[] dessert_name = (String[])request.getServletContext().getAttribute("dessert_name");
			
			   int num = (Integer)request.getServletContext().getAttribute("num");
			   double total=0;
			   %>
			   	<p>
			   	为保护土地租赁合同双方当事人的合法利益，规范土地管理和承租方经营行为，
			   	根据《中华人民共和国土地管理法》、《中华人民共和国合同法》及相关法律、法规和
			   	政策规定，经公开协商讨论同意，甲乙双方本着平等、自愿、公平、有偿的原则，签订
			   	本合同，共同信守。
			   	</p>
				<p>第一条 租赁位置和面积
				</p>
						<% 
			   for(int i = 0;i<num;i++){
				   total=total+dessert_price[i];
				
			%>
				<p>土地id: <span><%=dessert_id[i] %> </span>
				土地位置: <span><%=dessert_place[i] %> </span>
				土地价格: <span><%=dessert_price[i] %> </span>
				</p>
				</br>
				
			<%
			   }%>
			<h3><%="总价："+total %></h3>
			<% 	}
			%>
		

	
	

			  
		
				<pre>第二条 土地用途和承包形式
 土地用途：种农作物                                  
 承包形式：个人承包                               
第三条 租赁期限
租赁期限为1年，自<span><%=date[0] %> 起，租赁期限内土地经营使用权属乙方，所
有权属甲方。土地租赁期限内如遇国家政策性调整，另行议定。如需续租，
甲乙双方应重新商定续租事宜。
				</pre>
				<pre>第五条 甲乙双方的权利和义务
　　(一)甲方的权利和义务
	1、甲方对所租土地拥有所有权，并使乙方取得土地承包经营权。
	2、甲方有权对乙方租用的土地使用进行监督，保证土地按照合同约定的
    用途合理利用。
	3、甲方有权收回乙方不按合同约定使用的土地。
	4、甲方有权制止乙方实施的严重损害土地资源和其它资产的行为。
	5、甲方有权依据合同的约定向乙方收取租租赁费用，在合同有效期内，
    甲方不得提高租赁费用。
	6、甲方有权在租赁期限届满时提出新的租赁标准，选择确定新的承租方。
	7、甲方应保证乙方生产生活用水、用电正常，向乙方收取的水电费用价
    格不应高于本村村民用水用电的价格，并保证在村内无偿使用通往承租
    地的道路。
	8、甲方不得在租用期间内以任何理由干涉乙方企业合法的经营管理自主
    权，包括在该地上的所有收入、支出和建筑物、植被设施的使用等。
	9、甲方不得在合同履行期内重复发包该地块, 在租赁期限内，如因承包范
    围出现土地纠纷，由甲方负责解决，若致使乙方遭受经济损失，由甲方
    按国家相关规定进行赔偿。甲方必须确保乙方在承包期内不受任何干扰。
	10、为乙方提供所在地村民的其他同等待遇。
　　(二)乙方的权利和义务
	1、乙方有权依法按照合同约定的用途和期限，合法利用和经营所承包
	的土地。
	2、乙方对其所承包的土地有独立自主经营权和收益权，任何单位和个人
    不得干涉，所发生的一切债权债务由乙方独自享有和承担，与甲方无关。
	3、乙方有权在其所承包的土地上建设与合同约定用途有关的生产、生活
    设施，甲方及其甲方所在村不收任何费用。
	4、乙方有权在租赁期内对所租赁的土地进行基本改造，对改造形成的资
    产如电网、水利设施等由乙方全部投入建设的，在租赁合同到期后享有处
    置权。 
	5、租赁期满后，同等条件下，乙方对原租赁的土地有继续租赁的优先权。
	6、乙方应按本合同的约定按期足额向甲方支付租赁费用，并有权拒绝交
    纳除合同规定租赁费用外的任何其他非国家规定之费用。
	7、乙方的生产经营活动不得污染乙方所在村的水源，不得产生影响村
	民生活的其他污染。
	8、乙方应保护自然资源，合理利用土地。
				
				</pre>
	
			<div class="clear"></div>
		  </div>
		<div class="product_desc">	
			 <pre><a href="/DessertHouse/mySoil">											确认合同</a></pre>
			
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

