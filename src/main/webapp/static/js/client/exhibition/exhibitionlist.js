//查询列表
function searchExhibitions(flag){
	var url = basePath + "/exhibition/search";
	var loadData = "";
	if(flag){
		loadData = $("#searchform").serializeArray();
	}else{
		loadData = $("#listform").serializeArray();
	}
	$("#results").loading().load(url,loadData);
}
//分页函数
function fnGotoPageExhibitions(num){
	searchExhibitions(false);
}