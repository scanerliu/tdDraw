<#import "/common/app.ftl" as app> <!DOCTYPE html><html lang="en"><head>	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />    <meta http-equiv="Content-Language" content="zh-CN">    <meta name="keywords" content="${system.webkeywords!''}">    <meta name="description" content="${system.webkeywords!''}">    <meta name="copyright" content="${system.webkeywords!''}" />    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">    <meta content="yes" name="apple-mobile-web-app-capable">    <meta content="black" name="apple-mobile-web-app-status-bar-style">    <meta content="telephone=no" name="format-detection">    <link rel="shortcut icon" href="${app.basePath}/static/default/images/icon.ico" />    <title>商品管理 -  ${system.webkeywords!''}</title>    <!-- css -->    <link rel="stylesheet" href="${app.basePath}/static/default/client/style/site.css" type="text/css"/>    <link rel="stylesheet" type="text/css" href="${app.basePath}/static/default/client/style/personal-center-common.css">    <link rel="stylesheet" type="text/css" href="${app.basePath}/static/default/client/style/f_personal_center.css">    <link rel="stylesheet" type="text/css" href="${app.basePath}/static/default/client/style/lhead.css">    <link rel="stylesheet" type="text/css" href="${app.basePath}/static/default/client/style/index.css">    <link rel="stylesheet" type="text/css" href="${app.basePath}/static/default/client/style/has.css">    <!-- js -->    <#include "/common/common.ftl" />    <script type="text/javascript" src="${app.basePath}/static/js/jquery-1.12.3.min.js"></script>	<script type="text/javascript" src="${app.basePath}/static/js/client/html5.js"></script>	<script type="text/javascript" src="${app.basePath}/static/js/client/library.js"></script>	<!--通用js-->    <script type="text/javascript" src="${app.basePath}/static/js/client/core.js"></script>    <script type="text/javascript" src="${app.basePath}/static/js/client/common.js"></script></head><body><h1 style="display:none;"></h1><!-- header_top --><#include "../common/centerheader.ftl"><!-- header_top end --><div class="clear"></div><!-- Center Start --><!-- Center Start --><div class="index-main">    <div class="personal-center">        <!-- 左侧导航 -->        <#include "../common/centerleftmenu.ftl">                <!-- 右侧内容 -->        <div class="right-content">            <!-- 商品管理 -->            <div class="goods_conduct">                            <div class="div1" style="padding-bottom:232px;">                    <section class="sec2">                        <aside class="as1 fl">商品管理</aside>                        <aside class="as2 fr">                        	 <#if customer?? && customer.tempsupplier gt 0 && customer.supplierType gt 0>	                            <a href="${app.basePath}/user/myproduct" title="" class="a1">查看我的商品</a>	                            <a href="${app.basePath}/user/myproduct?op=2" title="" class="a2">上传商品</a>	                            <a href="${app.basePath}/user/auctionproduct" title="" class="a1">查看我的拍卖商品</a>	                            <a href="${app.basePath}/user/auctionproduct?op=2&type=2" title="" class="a3">拍卖商品上传</a>                            <#elseif customer?? && customer.tempsupplier gt 0>                            	请先进行开通店铺才能使用本功能。<a href="${app.basePath}/user/supplierApply" title="开通店铺申请">开店铺</a>                            </#if>                        </aside>                    </section>                </div>				<form id="enjoyForm">				<input type="hidden" name="pageNo" id="enjoysc_pageNo" value="1">				<input type="hidden" name="pageSize" value="4"/>				</form>                <div class="guess-like" style="width:910px;">                    <div class="title">                        <strong>猜你喜欢</strong>                        <a href="javascript:;" title="" class="fr" style="padding-left:20px;font-size:14px;background:url(${app.basePath}/static/default/client/images/y62.png) no-repeat 0 center;"  id="enjoybtn">换一批</a>                    </div>                    <div class="pro-list" style="overflow:hidden;height:276px">                        <ul id="enjoyList">                        </ul>                    </div>                </div>            </div>            <!-- 商品管理-结束 -->        </div>        <!-- 右侧内容 END -->    </div>    <div class="clear"></div></div><!-- Center End --><script>	$(function(){		getenjoyproducts();	});</script><!-- Footer Start --><#include "../common/commonfooter.ftl"><!-- Footer End --></body></html>