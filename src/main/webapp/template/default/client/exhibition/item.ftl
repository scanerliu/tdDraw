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
    <title>画展活动 - ${system.webkeywords!''}</title>
    <!-- css -->
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/site.css" />
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/personal-center-common.css" />
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/lhead.css" />
	<link rel="stylesheet" href="${app.basePath}/static/default/client/style/helpcenter.css" />
	<!-- js -->
	<#include "/common/common.ftl" />
	<script type="text/javascript" src="${app.basePath}/static/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/html5.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/library.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/index.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/common.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/core.js"></script>
	<script type="text/javascript" src="${app.basePath}/static/js/client/exhibition/exhibitionlist.js"></script>
</head>
<body>
	<h1 style="display:none;">创客</h1>
	<!-- 头部 -->
	<#include "../common/commonheader.ftl">
	<!-- 头部 -->
	<!-- Center Start -->
	<div class="wrapper">
		<div class="centerwarp eicontent">
			<#if articleTitle?? && articleContent??>
			<h1 class="titlebig">${articleTitle.title!''} </h1>
			<div class="newsinfo">发布时间：<span><#if articleTitle.updateTime??>${articleTitle.updateTime?string('yyyy-MM-dd')}</#if></span></div>
			<article class="newscon">${articleContent.content!''}</article>
			<#else>
			<h1 class="titlebig">未找到相关信息。</h1>
			</#if>
		</div>
	</div>
	<!-- Center End -->
		
	<!-- 底部 -->
	<#include "../common/commonfooter.ftl">
</body>
</html>