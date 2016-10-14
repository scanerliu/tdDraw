<#import "/common/app.ftl" as app>
<#include "/common/common.ftl" />
<script src="${app.basePath}/static/js/admin/common.js" type="text/javascript"></script>
<script src="${app.basePath}/static/js/easyui/jquery.easyui.min.js" type="text/javascript"></script>
<script src="${app.basePath}/static/js/easyui/easyui-lang-zh_CN.js" type="text/javascript"></script>
<script src="${app.basePath}/static/js/admin/report/report.js" type="text/javascript"></script>

<div id="rightlist">
	<div class="subnav">
		<div class="content_menu ib_a blue line_x">
		</div>
	</div>
	<form id="searchform">
		<table width="100%" cellspacing="0" class="search_form">
			<tbody>
				<tr>
					<td>
						<div class="explain_col">
							收入时间：
							<input type="text" value="" style="width:100px;" size="12" class="easyui-datebox" id="beginDate" name="beginDate">
							-<input type="text" value="" style="width:100px;" size="12" class="easyui-datebox" id="endDate" name="endDate">
							&nbsp;&nbsp;会员账号 :
							<input type="text" value="" size="25" class="input-text" name="username">
							&nbsp;&nbsp;
							收入类型
							<select name="type" class="J_cate_select mr10">
								<option value="2">分润收入</option>
								<option value="4">用户提现</option>
								<option value="1">后台调整</option>
								<option value="3">退货退款</option>
								<option value="5">购买商品</option>
							</select>
							&nbsp;&nbsp;
							<select name="isAsc" class="J_cate_select mr10">
								<option value="false">-收入降序-</option>
								<option value="true">-收入升序-</option>
							</select>
							<input type="button" value="搜索" class="btn" name="search" onclick="searchUserIncome(true)">
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<form id="userIncomeListForm">
		<div id="results"></div>
	</form>
</div>
<div id="rightform"></div>

<script type="text/javascript">
	$(function(){
		searchUserIncome(true);
	});
</script>
