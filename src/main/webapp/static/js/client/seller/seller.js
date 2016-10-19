function searchproducts(t){
	var url = basePath + "/product/search";
	var loadData = null;
	if(t){
		loadData = $("#searchform").serializeArray();;
	}else{
		loadData = $("#listform").serializeArray();
	}
	$("#productList").load(url,loadData);
}

//分页函数
function fnGotoPageProducts(num){
	searchproducts(false);
}
