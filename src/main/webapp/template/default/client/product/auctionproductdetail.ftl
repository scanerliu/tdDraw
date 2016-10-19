<#import "/common/app.ftl" as app> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Language" content="zh-CN">
    <meta name="keywords" content="${system.webkeywords!''}">
    <meta name="description" content="${system.webdescription!''}">
    <meta name="copyright" content="${system.webcopyright!''}" />
    <link rel="shortcut icon" href="${app.basePath}/static/default/images/icon.ico" />
    <title>${product.name!''} - ${system.webkeywords!''}</title>
    <#include "/common/common.ftl" />
    <!-- css -->
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/site.css" />
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/chuangkeftt.css" />
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/lhead.css" />
	<!-- js -->
	<#include "/common/common.ftl" />
	<script type="text/javascript" src="${app.basePath}/static/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/html5.js"></script>
	<!--图片轮动js-->
    <script type="text/javascript" src="${app.basePath}/static/js/client/ftt_imgslide.js"></script>
    <script type="text/javascript" src="${app.basePath}/static/js/client/jquery.SuperSlide.2.1.1.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/index.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/common.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/core.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/product/productdetail.js"></script>
	<style>
	  .ogray {float: left;padding: 0 17px;height: 35px;line-height: 34px;margin-right: 10px;border: 1px solid #e7e7e7;border-radius: 3px;overflow: hidden;background: #fff;margin-bottom: 5px;-moz-user-select: none;-webkit-user-select: none;-ms-user-select: none;-khtml-user-select: none;user-select: none;cursor:not-allowed;color:#fff;background:#ddd;}
	</style>
</head>
<script language="javascript" type="text/javascript">
    $(function () {
        imgside();
        searchProductType(1);
        getrecommendproducts("hotrecommendList",1,10);
        getrecommendproducts("typerecommendList",2,3);
        getenjoyproducts();
        getdescribe(${product.id?c});
        
        $('#subnav').divfixed({"top":"0"});
        $('#detailcontent > div').each(function(index,ele){
            $(window).bind('scroll',function(){
                if($(window).scrollTop() >= $(ele).offset().top-80 && $('html,body,document').scrollTop() <= ($(ele).offset().top-80)+$(ele).outerHeight()+$(ele).next().outerHeight()) {
                    $('#subnav a').removeClass('on');
                    $('#subnav a').eq(index).addClass('on');
                }
            });
        });
    });
</script>
<body>
<h1 style="display:none;"></h1>
	<!-- Header Start -->
	<#include "../common/commonheader.ftl">
	<!-- 头部 -->
	
	<!-- Center Start -->
	<div class="wrapper">
	    <div class="ftt-detail1">
	        <div class="left">
	            <div class="item1">
	                <div class="imgslidebox" id="imgslide">
	                    <div class="myimages">
	                        <img src="${app.basePath}${product.imageUrl!''}" alt="${product.name!''}" class="myImgs">
	                    </div>
	                    <div class="scrollitem">
	                        <a href="javascript:void(0);" class="prev" title=""></a>
	                        <div class="scrollimg">
	                            <div class="imgitem">
	                            	<#if attachmentList?? && (attachmentList?size > 0)>
						        	<#list attachmentList as attachment>
					                <a href="javascript:;"><img src="${app.basePath}${attachment.attachment!''}" alt="${product.name!''}"/></a>
					                </#list>
					                <#else>
					                <a href="javascript:;"><img src="${app.basePath}${product.imageUrl!''}" alt="${product.name!''}"/></a>
					        		</#if>
	                            </div>
	                        </div>
	                        <a href="javascript:void(0);" class="next" title=""></a>
	                    </div>
	                </div>
	            </div>
	            <div class="item2" id="slect">
	                <span class="title1">${product.name!''}</span>
	                <span class="title2">${product.title!''}</span>
	                <div class="price">
	                    <span class="p1">当 前 价：￥<strong id="prodprice">${product.currPrice!''}</strong> 出价${product.quantum!'0'}次</span>
	                    <span class="p1">保 证 金：￥<strong>${product.bond!''}</strong></span>
	                </div>
	                <div class="program1">
	                    <span class="p1">起 拍 价：￥${product.price!''}</span>
	                    <span class="p1">加价幅度：￥${product.marketPrice!''}</span>
	                    <span class="p1">保 留 价：<#if product.base_price?? && product.base_price gt 0>有<#else>无</#if></span>
	                    
	                </div>
				    <input type="hidden" id="skustock" value="${product.quantum!'0'}">
			        <input type="hidden" id="skuId" value="${product.defaultSkuId!'0'}">
			        <input type="hidden" id="skuPrice" value="0">
			        <input type="hidden" id="propostage" value="${product.postage!'0'}">
			        <input type="hidden" id="productId" value="${product.id!''}">
			        <input type="hidden" id="productKind" value="${product.kind!'0'}">
			        <input type="hidden" id="pointpercent" value="${integralexchangerate!'1000'}">
	                <input class="txtnum" readonly value="1" type="hidden" id="prodquantity" onKeyUp="formatInputSkuNum(this)"/>
	                <div class="program1">
	                    <span class="red">剩余时间：</span>
	                    <div class="timeout" id="timeLeft">
	                        <span>00</span>
	                        <label>天</label>
	                        <span>00</span>
	                        <label>时</label>
	                        <span>00</span>
	                        <label>分</label>
	                        <span>00</span>
	                        <label>秒</label>
	                    </div>
	                    <script>
							$(document).ready(function(){
							    timer();
							    setInterval("timer()",1000);
							});
							
							function checkTime(i)  
							{  
							    if (i < 10) {  
							        i = "0" + i;  
							    }  
							    return i;  
							}
							
							function timer()
							{
								    var ts = (new Date(${product.endTime?string("yyyy")}, 
							                parseInt(${product.endTime?string("MM")}, 10)-1, 
							                ${product.endTime?string("dd")}, 
							                ${product.endTime?string("HH")}, 
							                ${product.endTime?string("mm")}, 
							                ${product.endTime?string("ss")})) - (new Date());//计算剩余的毫秒数
							  
							    var allts = (new Date(${product.endTime?string("yyyy")}, 
							                parseInt(${product.endTime?string("MM")}, 10)-1, 
							                ${product.endTime?string("dd")}, 
							                ${product.endTime?string("HH")}, 
							                ${product.endTime?string("mm")}, 
							                ${product.endTime?string("ss")}))
							               - (new Date(${product.startTime?string("yyyy")}, 
							                parseInt(${product.startTime?string("MM")}, 10)-1, 
							                ${product.startTime?string("dd")}, 
							                ${product.startTime?string("HH")}, 
							                ${product.startTime?string("mm")}, 
							                ${product.startTime?string("ss")}));//总共的毫秒数 
							    
							    if (0 == ts)
							    {
							        window.location.reload();
							    }
							  
							    var date = new Date();
							    var dd = parseInt(ts / 1000 / 60 / 60 / 24, 10);//计算剩余的天数
							    var hh = parseInt(ts / 1000 / 60 / 60 % 24, 10);//计算剩余的小时数
							    var mm = parseInt(ts / 1000 / 60 % 60, 10);//计算剩余的分钟数
							    var ss = parseInt(ts / 1000 % 60, 10);//计算剩余的秒数
							     if(ss < 0){
							    	ss = 0;
							    }
							    if(mm < 0){
							    	mm = 0;
							    }
							    if(hh < 0){
							    	hh = 0;
							    }
							    if(dd < 0){
							    	dd = 0;
							    }
							    dd = checkTime(dd);
							    hh = checkTime(hh);
							    mm = checkTime(mm);
							    ss = checkTime(ss);
							    $("#timeLeft").html("<span>"+dd+"</span><label>天</label><span>"+hh+"</span><label>时</label><span>"+mm+"</span><label>分</label><span>"+ss+"</span><label>秒</label>");
							    
							    // 结束
							    if(dd == 0 && hh == 0 && mm == 0 && ss == 0){
							    	$("#addCart").removeAttr("onclick");
							    	$("#buyNow").removeAttr("onclick");
							    	$("#addCart").css("background","#ddd")
							    	$("#buyNow").css("background","#ddd")
							    }
							}
						</script> 
	                </div>
	                <div class="btnwrap">
	                	<#if 1??>
	                    <input type="button" value="缴纳保证金"  id="buyNow" class="orange" onclick="buyNow();"/>
	                    <#else>
	                    <input type="button" value="已结束" class="grey"/>
	                    </#if>
	                </div>
	                <div class="program">
	                    <span class="title">服务支持：</span>
	                    <span class="text">不支持7天无理由退货</span>
	                </div>
	            </div>
	        </div>
	        <div class="hotrecommend">
	            <span class="title"><strong>热门推荐</strong></span>
	
	            <div class="pro-list">
	                <div class="bd">
	                    <ul class="picList" id="hotrecommendList">
	                    </ul>
	                </div>
	                <div class="hd">
	                    <a class="next"></a>
	                    <a class="prev"></a>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="ftt-detail2">
	        <div class="about-recommend">
	            <strong class="title">相关推荐</strong>
	            <ul class="pro-list1" id="typerecommendList">
	            </ul>
	        </div>
	
	        <div class="product-detail">
	            <div id="subnav" class="subnav" style="position: static; top: 0;">
	                <a href="javascript:void(0);" onclick="hreftotop($(this),1);" class="on">商品详情</a>
	                <a href="javascript:void(0);" onclick="hreftotop($(this),2)">出价记录</a>
	                <a href="javascript:void(0);" onclick="hreftotop($(this),3)">卖家承诺</a>
	                <a href="javascript:void(0);" onclick="hreftotop($(this),4)" class="noborder">保证金须知</a>
	            </div>
	            <div id="detailcontent" class="content">
	            </div>
	        </div>
	    </div>
	    <div class="guess-like">
	    	<form id="enjoyForm">
			<input type="hidden" name="pageNo" id="enjoysc_pageNo" value="1">
			<input type="hidden" name="pageSize" value="6"/>
			</form>
	        <div class="title">
	            <label>猜你喜欢</label>
	            <a href="javascript:;" class="a-change" title="" id="enjoybtn">换一批</a>
	        </div>
	        <ul class="pro-list" id="enjoyList">
	        </ul>
	    </div>
	</div>
	<!-- Center End -->
	<!-- Footer Start -->
	<#include "../common/commonfooter.ftl">
	<!-- Footer End -->
	
	<script>
		var __skuJsons = ${productjson};
		__integralexchangerate = ${integralexchangerate!'1000'};
		$(function(){
		});
	</script>
</body>  
</html>