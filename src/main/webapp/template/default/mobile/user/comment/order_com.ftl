<#import "/common/app.ftl" as app> <#include "/common/common.ftl" /><!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="Content-Language" content="zh-CN"><meta name="keywords" content="${system.webkeywords!''}"><meta name="description" content="${system.webdescription!''}"><meta name="copyright" content="${system.webcopyright!''}" /><link rel="shortcut icon" href="${app.basePath}/static/default/images/icon.ico" /><meta name="viewport" content="initial-scale=1,maximum-scale=1,minimum-scale=1"><meta content="yes" name="apple-mobile-web-app-capable"><meta content="black" name="apple-mobile-web-app-status-bar-style"><meta content="telephone=no" name="format-detection"><title>我的评价</title><!-- css --><link href="${app.basePath}/static/default/mobile/css/common.css" rel="stylesheet" type="text/css" /><link href="${app.basePath}/static/default/mobile/css/main.css" rel="stylesheet" type="text/css" /><link href="${app.basePath}/static/default/mobile/css/x_pc.css" rel="stylesheet" type="text/css" /><!-- js --><script type="text/javascript" src="${app.basePath}/static/touch/js/jquery-1.9.1.min.js"></script><script type="text/javascript" src="${app.basePath}/static/touch/js/common.js"></script><link rel="stylesheet" type="text/css" href="${app.basePath}/static/js/huploadify/Huploadify.css"><script src="${app.basePath}/static/js/huploadify/jquery.Huploadify.js" type="text/javascript"></script><script>function subComment(){	$("#form").submit();}</script></head><body class="body_gray">  <!-- header_top -->  <div class="top_heater">    <a href="javascript:history.go(-1);" title="" class="hleft hback"></a>    <span>发表评价</span>  </div>  <!-- header_top end --><form  id="form" action="${app.basePath}/mobile/user/comment/add" method="post">	<input type="hidden" value="${order.orderId?c}" name="orderId">  <!-- Center Start -->  <section class="container my-evaluate">    <#if order.skuList??>    <#list order.skuList as sku>    <div class="">      <article class="text">      	<input type="hidden" value="${sku.orderSkuId?c}" name="skuId">      	<input type="hidden" value="${sku.productId?c}" name="productId">        <img src="${app.basePath}${sku.productImage!''}" alt="">        <textarea name="content" placeholder="亲，请在这里输入您对商品的评价哦"></textarea>      </article>      <article class="imgupload">        <!-- 预览图片div-->        <div class="imgwrap">        </div>        <div class="input-file" id="showImgs${sku_index}">        	<!--        	<a href="javascript:;" title="" id="file_upload${sku_index}" class="a1"></a>        	-->        	<input type="hidden" name="imgUrl" id="fileUrl${sku_index}">        	<div id="file_uploads${sku_index}"><div>        </div>      </article>    </div>    <script>    $(function(){    	var num = 0;		$('#file_uploads${sku_index}').Huploadify({				'multi': true, // 限制单图上传				'auto': true,				'formData' : {'type' : 'comment'},				'swf'      : basePath+'/static/js/uploadify/uploadify.swf', // swf存放的路径				'fileObjName' : 'file',				'uploader' : basePath+'/uploadify/upload/singleFile',    // 处理上传的Servlet				'fileBrowserButtonId':'file_upload${sku_index}',				'onUploadSuccess' : function(file, data, response) {					var result = eval("("+data+")");										var imgs = $("#showImgs${sku_index} img").length;					var file = '';					if(imgs < 3){						num ++;						$("#showImgs${sku_index}").prepend("<img src='"+basePath+result.savedFile+"' style='width:1.22rem;height:1.22rem;float:left;margin-right:.1rem' />");						//$("#showImgs${sku_index}").prepend("<input id='input${sku_index}_"+num+"' type='hidden' name='imgUrl' value='"+basePath+result.savedFile+"'>");										}else{						alert("最多上传图片数量为3张")					}					var imglistobj = $('#showImgs${sku_index}').find('img');					var strimg = "";					imglistobj.each(function(){						if($(this).attr('src')!="" || $(this).attr('src')!=null){							if($(this).index()==imglistobj.length-1){								strimg= strimg+$(this).attr('src');							}else{								strimg = strimg+$(this).attr('src')+",";							}						}					});					$("#fileUrl${sku_index}").val(strimg)		        },		        'onUploadError' : function(file, errorCode, errorMsg, errorString) {		        	alert("上传失败。");		        }		});	});    </script>    </#list>    </#if>    <article class="satisfaction">      <label>满意程度</label>      <!--评价星星-->      <input type="hidden" value="" id="score" name="score">      <menu id="reviewsbox" class="reviewsbox">        <a href="javascript:void(0);" title="">&nbsp;</a>        <a href="javascript:void(0);" title="">&nbsp;</a>        <a href="javascript:void(0);" title="">&nbsp;</a>        <a href="javascript:void(0);" title="">&nbsp;</a>        <a href="javascript:void(0);" title="">&nbsp;</a>      </menu>    </article>    <script type="text/javascript">      $(function(){        function reviewsBox(boxid,_name,_hover){          var _box = $(boxid);          var _arr = _box.find(_name);          var _index = 0;          var _now = _box.find("."+_hover).length;                    var _checkNow = function(_num){            _arr.removeClass(_hover);              for(var i=0;i<=_num;i++){                _arr.eq(i).addClass(_hover);                }            };//fun END                      // hover效果          _arr.hover(function(){            _index = $(this).index();            _checkNow(_index);            },function(){              _checkNow(_now-1);              $("#score").attr("value",_now)          });          // 点击效果          _arr.click(function(){                _now = $(this).index();                for(var i=0;i<=_now;i++){                _arr.eq(i).addClass(_hover);                }              _now += 1;              $("#score").attr("value",_now)            });        };        reviewsBox("#reviewsbox","a","sel");      })    </script>  </section>  <!-- Center End -->  <!-- Footer Start -->  <footer>    <div class="publishcomment">      <label class="lblcheckbox smallcheckbox"><i class="fl"></i>匿名发表<input type="checkbox" name="anonymous" id="checkbox"/></label>      <a href="javascript:;" onclick="subComment();" class="a-publish" title="发表评论">发表评论</a>    </div>    <span class="footclear"></span>  </footer></form>  <script>    $(function(){      $("#checkbox").click(function(){        var checkval = $("input[type='checkbox']").is(':checked');        if(checkval==true){          $(this).siblings('i').addClass('checked');        }else{          $(this).siblings('i').removeClass('checked');        }      });    });  </script>  <!-- Footer End --></body></html>