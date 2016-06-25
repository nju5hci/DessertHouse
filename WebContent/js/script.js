/**要引入jquery，我在js文件夹里放了jquery的文件**/




/**
使表格奇数行和偶数行颜色不一样
@param table 表格的选择器，例如"#table"
**/
function altRowColor(table){
	
		var rows = $(table).children("tr"); 
		 
		for(var i = 0; i < rows.length; i++){          
			if(i % 2 == 0){
				$(rows[i]).addClass("evenrowcolor");
			}else{
				$(rows[i]).addClass("oddrowcolor");
			}      
		}
}

/**
表格点击某一行之后变色，单选
@param table 表格的选择器，例如"#table"
**/
function altRowColor(table){
	$(table).children("tr").click(function(){
		$("tr").removeClass("selectrowcolor");
		$(this).addClass("selectrowcolor");
	});
}


function initCheckBox(){
	$(".js-check-all").on('click',function(){
		var items=$(".js-check");
		if($(this).is(':checked')){
			$(this).prop('checked',true);
			for(var i=0;i<items.length;i++){
				$(items[i]).prop('checked',true);
			}
		}else{
			$(this).prop('checked', false);
			for(var i=0; i<items.length; i++){
				$(items[i]).prop('checked', false);
			}
		}
	});
		$('.checkbox').click(function(){
		var checkAllBox = $('.js-check-all');
		var item=$(this).children(".js-check");
		if($(item).is(':checked')){
			$(item).prop('checked',true);
			if($('.js-check:checked').length == $('.js-check').length){
				$(checkAllBox).prop('checked', true);
			}
		}else{
			if($('.js-check:checked').length == 0){
				$(checkAllBox).prop('checked',false);
			}
			$(item).prop('checked',false);
		}
		if($('.js-check:checked').length == $('.js-check').length){
			$(checkAllBox).prop('checked', true);
		}else{
			$(checkAllBox).prop('checked',false);
		}
	});
}

function chartDeleteCommodity(){
	$(".chart-item-operator").click(function(){
		var confirm=window.confirm("确定从购物车中删除该商品？");
		if(confirm){
			$(this).parent().slideUp();
		}
	});
}

function altAddAddressPanel(){
	var panel=$(".wapper-add-address");
	if(panel.hasClass("hide")){
		panel.removeClass("hide");
		$(".wapper-send-operator").html("收起");
		$(".wapper-address-operator").html("删除");
		$(".wapper-address-operator").css("cursor","pointer");
		$(".wapper-address-operator").click(function(){addressDelete(this);});
	}else{
		panel.addClass("hide");
		$(".wapper-send-operator").html("管理收货地址");
		$(".wapper-address-operator").html("");
	}
}

function addressItemClicked(){
	$(".wapper-address-item").click(function(){
		$(".wapper-address-item").removeClass("wapper-address-item-active");
		$(this).addClass("wapper-address-item-active");
	});
}

function timeItemClicked(){
	$(".time-item").click(function(){
		$(".wapper-address-item").removeClass("wapper-address-item-active");
		$(this).addClass("wapper-address-item-active");
	});
}

function timeDelete(){
	$(".wapper-time-operator").click(function(){
	    $(this).parent().slideUp();
	});
}

function addressDelete(obj){
	if($(obj).html()=='删除'){
		var confirm=window.confirm("确认要删除该收货地址吗");
		if(confirm){
			$(obj).parent().slideUp();
		}
	}
}

function commodityDelete(){
	$(".chart-item-operator").click(function(){
		var confirm=window.confirm("确认要删除本商品吗");
		if(confirm){
			$(this).parent().slideUp();
		}
	});
}

function addAddress(){
	$("#add-address").click(function(){
		var person=$("#input-person-name").val();
		var tel=$("#input-tel").val();
		var detail=$(".detailed-address").val();
		var address_province=$("#province").find("option:selected").text();
		var address_city=$("#city").find("option:selected").text();
		var address=$("#area").find("option:selected").text();
		if(address_province=='---'||address_city=='---'||address=='---'){toaster("新地址信息不完整！","error");return;}
		if (person=='') {toaster("新地址信息不完整！","error");return;}
		if (tel=='') {toaster("新地址信息不完整！","error");return;}
		if (detail=='') {toaster("新地址信息不完整！","error");return;}
				var str='<div class="wapper-address-item" onclick="addressItemClicked();"> '+               
                    '<div class="wapper-address-info float-left">'+
                    '<div class="wapper-address-str">'+address_province+address_city+address+detail+'</div>'+
                    '<div class="wapper-address-person">'+person+'</div>'+
                    '<div class="wapper-address-tel">'+tel+'</div>'+
                    '</div>'+
                    '<div class="wapper-address-operator float-right" onclick="timeDelete();">删除</div>'+
                    '</div>';               
				$(".wapper-address-list").children().eq(0).before(str);
	});
}

function confirmAddToChart(){
	$(".commodity-detail .input-submit").click(function(){
		toaster("成功添加到购物车","success");
		// toaster("","error");
	});
}

function commodityAltOptions(){
	$(".detail-header-option").click(function(){
		$(".detail-header-option-now").removeClass("detail-header-option-now");
		$(this).addClass("detail-header-option-now");
		$(".wapper-detail-content").css("display","none");
		switch($(this).attr('id')){
			case 'commodity-detail':$("#detail").css("display","");break;
			case 'commodity-comment':$("#comment").css("display","");break;
			case 'commodity-trend':$("#trend").css("display","");break;
		}
	});
}

function addTime(){
	$("#add-time").click(function(){
		var date=$("#element_id").val();
		var period=$("#time-period").val();
		var str='';
		if(date!=''){
			if(period!='-1'){
				switch(period){
					case '0':str='6:00-9:00';break;
					case '1':str='9:00-12:00';break;
					case '2':str='12:00-15:00';break;
					case '3':str='15:00-18:00';break;
				}
				var str='<div class="time-item"> '+               
                    '<div class="wapper-time-info float-left">'+
                    '<div class="wapper-time-date">'+date+'</div>'+
                    '<div class="wapper-time-period">09:00-12:00</div>'+
                    '</div>'+
                    '<div class="wapper-time-operator float-right" onclick="timeDelete();">删除</div>'+
                    '<div class="clear-fix"></div>'+
                    '<div class="seperator"></div>'+
                    '</div>';               
				$(".send-time-list").children().eq(0).before(str);
			}else{
				toaster("请选择时间段","error");
			}
		}else{
			toaster("请选择日期","error");
		}
	});
}

function toaster(message, type, time) {

    $("#toaster-container").empty();
    var html = '';

    if (type == "success") {
        html += '<div class="toaster"><p class="toaster-content success">' +
            '<i class="icon fa fa-check-circle-o"></i>' + message + '</p></div>';
    } else {
        html += '<div class="toaster"><p class="toaster-content error">' +
            '<i class="icon fa fa-close"></i>' + message + '</p></div>';
    }
    $("#toaster-container").append(html);

    var toaster = $("#toaster-container").children().eq(0);
    toaster.slideDown();
    toaster.width(toaster.children().eq(0).width()+4);

    if(time === undefined) {
        setTimeout(function () {
            toaster.slideUp();
        }, 2000);
    } else {
        setTimeout(function () {
            toaster.slideUp();
        }, time);
    }
}