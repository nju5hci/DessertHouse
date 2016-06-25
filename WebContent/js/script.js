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

function confirmAddAddress(){

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