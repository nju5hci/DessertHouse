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
