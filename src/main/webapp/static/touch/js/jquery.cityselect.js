/*
Ajax 三级省市联动
日期：2012-7-18

settings 参数说明
-----
url:省市数据josn文件路径
prov:默认省份
city:默认城市
dist:默认地区（县）
nodata:无数据状态
required:必选项
------------------------------ */
(function($){
	$.fn.citySelect=function(settings){
		if(this.length<1){return;};

		// 默认值
		settings=$.extend({
			url:"/client/js/city.min.js",
			prov:null,
			city:null,
			dist:null,
			nodata:null,
			required:true
		},settings);

		var box_obj=this;
		var prov_obj=box_obj.find(".prov");
		var city_obj=box_obj.find(".city");
		var dist_obj=box_obj.find(".dist");
		var prov_val=settings.prov;
		var city_val=settings.city;
		var dist_val=settings.dist;
		var select_prehtml=(settings.required) ? "" : "<option value=''>请选择</option>";
		var city_json;
		var isCentralCity;

		// 赋值市级函数
		var cityStart=function(){
			var prov_id=prov_obj.get(0).selectedIndex;
			if(!settings.required){
				prov_id--;
			};
			city_obj.empty().attr("disabled",true);
			dist_obj.empty().attr("disabled",true);

//			if(prov_id<0||typeof(city_json)=="string" || typeof(city_json) == "undefined"){
//			if(settings.nodata=="none"){
//			city_obj.css("display","none");
//			dist_obj.css("display","none");
//			}else if(settings.nodata=="hidden"){
//			city_obj.css("visibility","hidden");
//			dist_obj.css("visibility","hidden");
//			};
//			return;
//			};

			// 遍历赋值市级下拉列表
			temp_html=select_prehtml;
			var provinceId = prov_obj.val();
			$.ajax({
				type: "post",
				url: basePath+"/mobile/user/shoppingAddressDistrict",
				data: { "provinceId": provinceId },
				dataType: "json",
				async : false,
				success: function (data) 
				{ 
					if (data.code == 1)
					{
						for(var i = 0; i <data.cityList.length; i++)
						{
							temp_html+="<option value='"+data.cityList[i].id+"'>"+data.cityList[i].name+"</option>";
						}
						isCentralCity = data.isCentralCity;
					}
					city_obj.html(temp_html).attr("disabled",false).css({"display":"","visibility":""});
				},
				error:function (data)
				{
					alert(date);
				}

			});
			distStart();
		};

		// 赋值地区（县）函数
		var distStart=function(){
			var prov_id=prov_obj.get(0).selectedIndex;
			var city_id=city_obj.get(0).selectedIndex;
			if(!settings.required){
				prov_id--;
				city_id--;
			};
			dist_obj.empty().attr("disabled",true);

			if(prov_id<0||city_id<0 ||isCentralCity == true){
				if(settings.nodata=="none"){
					dist_obj.css("display","none");
				}else if(settings.nodata=="hidden"){
					dist_obj.css("visibility","hidden");
				};
				return;
			};

			// 遍历赋值市级下拉列表
			temp_html=select_prehtml;
			var ctiyId = city_obj.val();
			var provinceId = prov_obj.val();
			$.ajax({
				type: "post",
				url: basePath+"/mobile/user/shoppingAddressDistrict",
				data: { "cityId": ctiyId,"provinceId":provinceId},
				dataType: "json",
				async : false,
				success: function (data) 
				{
					if (data.code == 1)
					{
						for(var i = 0; i <data.districtList.length; i++)
						{
							temp_html+="<option value='"+data.districtList[i].id+"'>"+data.districtList[i].name+"</option>";
						}
					}
					dist_obj.html(temp_html).attr("disabled",false).css({"display":"","visibility":""});
				}
			});
		};

		var init=function(){
			// 遍历赋值省份下拉列表
			temp_html=select_prehtml;
			$.ajax({
				type: "post",
				url: basePath+"/mobile/user/shoppingAddressDistrict",
				dataType: "json",
				async : false,
				success: function (data) 
				{
					if (data.code == 1)
					{
						for(var i = 0; i <data.provinceList.length; i++)
						{
							temp_html+="<option value='"+data.provinceList[i].id+"'>"+data.provinceList[i].name+"</option>";
						}
						if(settings.nodata=="none"){
							city_obj.css("display","none");
							dist_obj.css("display","none");
						}else if(settings.nodata=="hidden"){
							city_obj.css("visibility","hidden");
							dist_obj.css("visibility","hidden");
						};
					}
					prov_obj.html(temp_html);
				}
			});

			// 若有传入省份与市级的值，则选中。（setTimeout为兼容IE6而设置）
			setTimeout(function(){
				if(settings.prov!=null){
					prov_obj.val(settings.prov);
					cityStart();
					setTimeout(function(){
						if(settings.city!=null){
							city_obj.val(settings.city);
							distStart();
							setTimeout(function(){
								if(settings.dist!=null){
									dist_obj.val(settings.dist);
								};
							},1);
						};
					},1);
				};
			},1);

			// 选择省份时发生事件
			prov_obj.bind("change",function(){
				cityStart();
			});

			// 选择市级时发生事件
			city_obj.bind("change",function(){
				distStart();
			});
		};
		init();
		city_json=settings.url;
	};
})(jQuery);