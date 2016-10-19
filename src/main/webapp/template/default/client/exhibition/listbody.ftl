<#import "/common/app.ftl" as app>
<div class="econtent">
	<#if artList?? && artList?size gt 0 >
	<#list artList as art>
	<li>
		<div class="img130_90"><a href="${app.basePath}/exhibition/item${art.aid!'0'}" title="${art.title!''}" target="_blank"><img src="${app.basePath}${art.imageUrl!''}"></a></div>
		<div class="tw_con">
		<div class="titlename"><h2><a href="${app.basePath}/exhibition/item${art.aid!'0'}" class="newstitle" title="${art.title!''}" target="_blank">${art.title!''}</a></h2></div>
		<span class="date_browse"><#if art.updateTime??>${art.updateTime?string('yyyy-MM-dd')}</#if></span>
		<div class="twinfocon">${art.summary!''}<div class="boxtm"></div></div>
		</div>
	</li>
	</#list>
	<#else>
	<li>
		<div class="titlename">暂无画展活动.</div>
	</li>
	</#if>
</div>
<#if artList?? && artList?size gt 0 >
    <section class="goods-page-nums txtr">
	<#assign pageId="Exhibitions" />
	<#include "../common/commonpostpage.ftl" />
	</section>
</#if>
<input type="hidden" value="${sc.cid!''}" name="cid">
