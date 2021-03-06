<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.math.BigDecimal" %>
    <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>半亩田-确认订单</title>
 <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" type="text/css" href="../font-awesome-4.5.0/css/font-awesome.css">
        <script src="../js/jquery-2.2.3.min.js"></script>
        <script src="../js/script.js"></script>
        <link rel="stylesheet" href="../plugins/cxCalendar-master/css/jquery.cxcalendar.css">
        <script src="../plugins/cxCalendar-master/js/jquery.cxcalendar.js"></script>
        <script type="text/javascript" src="../plugins/china-city-select-master/LocalList.js"></script>
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
        <div id="A_Stepbar" class="flowstep float-right">
            <ol class="flowstep-5">
                <li class="step-first">
                    <div class="step-done">
                        <div class="step-name">查看购物车</div>
                        <div class="step-no"></div>
                    </div>
                </li>
                <li>
                    <div class="step-name">拍下商品</div>
                    <div class="step-no">2</div>
                </li>
                <li>
                    <div class="step-name">付款</div>
                    <div class="step-no">3</div></li>
                <li>
                    <div class="step-name">确认收货</div>
                    <div class="step-no">4</div>
                </li>
                <li class="step-last">
                    <div class="step-name">评价</div>
                    <div class="step-no">5</div>
                </li>
            </ol>
        </div>
    <div class="clear-fix"></div>
    <div class="seperator"></div>
    </div>
    <div class="wapper-send-info">
        <div class="wapper-send-address float-left ">
            <div class="wapper-send-title float-left">选择收货地址</div>
            <div class="wapper-send-operator float-right" onclick="altAddAddressPanel();">管理收货地址</div>

            <div class="clear-fix"></div>
            <div class="seperator"></div>
            <div class="wapper-add-address hide box">
                <span class="label">地 址:</span>
                <select id="province" name="province" onchange="LocalList.mf_processStateList()" style="display: inline;"></select>
                <select id="city" name="city" onchange="LocalList.mf_processCityList()" style="display: inline;"></select>
                <select id="area" name="area" style="display: inline;"></select>
                <span class="label">详细地址:</span>
                <input class="detailed-address"></input>
                <div class="seperator"></div>
                <div class="add-address-person">
                    <span class="label">收货人：</span>
                    <input class="input-small" id="input-person-name"></input>
                </div>
                <div class="add-address-tel">
                    <span class="label">手机号码:</span>
                    <input class="input-small" id="input-tel"></input>
                </div>
                <span class="input-submit" id="add-address">确认添加</span>
            </div>
            <div class="wapper-address-list">
                <div class="wapper-address-item">
                    <div class="wapper-address-info float-left">
                        <div class="wapper-address-str">江苏省南京市南京大学鼓楼校区</div>
                        <div class="wapper-address-person">郭玥</div>
                        <div class="wapper-address-tel">15850786005</div>
                    </div>
                    <div class="wapper-address-operator float-right"></div>
                </div>
                <div class="wapper-address-item">
                    <div class="wapper-address-info float-left">
                        <div class="wapper-address-str">江苏省南京市南京大学鼓楼校区</div>
                        <div class="wapper-address-person">郭玥</div>
                        <div class="wapper-address-tel">15850786005</div>
                    </div>
                    <div class="wapper-address-operator float-right"></div>
                </div>
            </div>
        </div>
        <div class="vertical-seperator"></div>
        <div class="wapper-send-time float-right ">
            <div class="wapper-send-title">选择收货时间(可选择多个收货时间，即重复购买)</div>
            <div class="clear-fix"></div>
            <div class="seperator"></div>
            <div class="send-time-input">
                <span class="label">日期</span>
                <input id="element_id" type="text">
                <span class="label">时间段</span>
                <select id="time-period">
                    <option value="-1">--:--</option>
                    <option value="0">6:00-9:00</option>
                    <option value="1">9:00-12:00</option>
                    <option value="2">12:00-15:00</option>
                    <option value="3">15:00-18:00</option>
                </select>
                <span class="input-submit" id="add-time">确认添加</span>
            </div>
            <div class="send-time-list">  
                <div class="time-item">                
                    <div class="wapper-time-info float-left">
                        <div class="wapper-time-date">2016-12-1 </div>
                        <div class="wapper-time-period">09:00-12:00</div>
                    </div>
                    <div class="wapper-time-operator float-right">删除</div>
                    <div class="clear-fix"></div>
                    <div class="seperator"></div>
                </div>
                
                <div class="time-item">                
                    <div class="wapper-time-info float-left">
                        <div class="wapper-time-date">2016-12-1 </div>
                        <div class="wapper-time-period">09:00-12:00</div>
                    </div>
                    <div class="wapper-time-operator float-right">删除</div>
                    <div class="clear-fix"></div>
                    <div class="seperator"></div>
                </div>
                
            </div>
        </div>
    </div>
    <div class="clear-fix"></div>
    <div class="red-seperator"></div>
      <div class="wapper-chart-pay">
        <div class="wapper-pay-title">支付方式</div>
        <div class="wapper-pay-list">
            <span class="wapper-pay-item box wapper-pay-item-active">货到付款</span>
            <span class="wapper-pay-item box">微信支付</span>
            <span class="wapper-pay-item box">支付宝支付</span>
            <span class="wapper-pay-item box ">银行卡支付</span>
        </div>
    </div>
  <div class="red-seperator"></div>
    <div class="wapper-chart-title">
    	<span id="title-7">商品信息</span>
    	<span id="title-8">单价（元）</span>
    	<span id="title-9">数量</span>
    	<span id="title-10">金额</span>
    	<span id="title-11">操作</span>
    </div>
    <div class="seperator"></div>
    <div class="wapper-chart-list">
         <% 
                                String[] dessertName = (String[])request.getServletContext().getAttribute("dessertName");
            		double total=(Double)request.getServletContext().getAttribute("total");
            		double discount=(Double)request.getServletContext().getAttribute("discount");
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
                	     
    	
    	<div class="wapper-chart-item">
    	
            <div class="float-left chart-item-info">
            	<img src="<%=dessertPicture[i] %>" class="chart-item-photo">
            	<a href="" class="chart-item-name"><%=dessertName[i] %></a>
                <input class="commodity-id" type="hidden" id="1" value="1"></input>
            </div>
            <div class="float-left chart-item-price"><%=dessertPrice[i] %></div>
                      <div class="float-left chart-item-num">
            	<span class="label"><%=dessertNum[i] %></span>
            </div>
            <div class="float-left chart-item-amount"><%=totalPrice[i] %></div>
            <div class="float-left chart-item-operator">删除</div>

    	</div>
      <%
    
                        		}
    	     }
                         %>
   
    </div>
    <div class="wapper-chart-bottom">
    	<div class="float-right">
    	    <div class="chart-amount">总金额：<%=total %></div>
    	    
    	     <div class="chart-amount">折扣：<%=discount %></div>
    	     <%double total2= total*discount;
    	     BigDecimal b = new BigDecimal(total2);
			  double f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    	     %>
    	      <div id="total"class="chart-amount">折后金额：<%=f1%></div>
    	    <a href="/DessertHouse/confirmOrder2">
    		<span class="confirm">提交订单</span>
    		</a>
    	</div>
        <div class="clear-fix"></div>
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
<script type="text/javascript">
addressItemClicked();
timeDelete();
addTime();
addAddress();
deletePopup();
payItemClicked();
add_to_chart();
$('#element_id').cxCalendar();


function add_to_chart(){
	$(".confirm").click(function(){
		var sendAddress="NJU";
		var sendTime="12:34";


		var payWay="货到付款";
	//	window.location.href="/DessertHouse/addToChart2?dessertid="+id;
//	wapper-address-str


	 $.ajax({

			url:'/DessertHouse/confirmOrder2',

			data:{
				sendAddress:sendAddress,
				sendTime:sendTime, 
			
				payWay:payWay
			
			},
       
			type:'post',

			success:function(data){

			if(data=="success\n"){
				toaster("已添加到购物车","success");

			}else{
			
			  }

			}

	     
     });
	}); 
}
</script>

<script type="text/javascript">

var options = {
    country: 'province',        // “省”下拉列表的名称
    state: 'city',              // “市”下拉列表的名称
    city: 'area',               // “区”下拉列表的名称
    current: '0|0|0',        // 当前默认值，用管道符“|”分割
    language: 'zh_cn',          // 数据文件的语言
    path_to_xml: '../plugins/china-city-select-master/data/china/', // 数据文件的目录
    read_only: false            // 数据是否只读，若设置为true，则无需设置 country 和 state
};

LocalList.mf_init(options);

</script>
</body>
</html>