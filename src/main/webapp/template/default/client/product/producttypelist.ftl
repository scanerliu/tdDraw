<#import "/common/app.ftl" as app>
<div class="popmenu_bg" id="pm_02">
	<div class="poptext">
		<#if producttypelist??>
		<#list producttypelist as ptype>
	  	<h1><a href="${app.basePath}/product/list?typeId=${ptype.id}" target="_blank">${ptype.name!''}</a></h1>
	  		<#if ptype.subList??>
	  		<#assign ptn = 0>
			<#list ptype.subList as subptype>
			<#if ptn gt 0>|</#if><a href="${app.basePath}/product/list?typeId=${subptype.id}" target="_blank">${subptype.name!''}</a>
			<#assign ptn++>
			</#list>
			</#if>
		</#list>
		</#if>
	</div>
</div>
<script>
	$(function(){
		<#if sc.sctype?? && sc.sctype==2>
		indexmenutoggle('menu', "menuitem", "childitem");
		/*头部菜单js*/
		<#else>
		menutoggle('menu',"menuitem","childitem");
		</#if>
	});
</script>
