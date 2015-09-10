<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link type="text/css" href="<%=request.getContextPath()  %>/css/reset.css" rel="stylesheet"/>
    <link type="text/css" href="<%=request.getContextPath()  %>/css/index.css" rel="stylesheet"/>
    
    <script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>

	<script type="text/javascript">
		function vf(){
			
		}
		
		$.extend({
			serializeForTags:function(array){
				var form = $('<form style="display:none;"></form>');
				
				for(var i=0;i<array.length;i++){
					var o = array[i];
					for(x in o){
						var value = o[x];
						var e = $('<input type="hidden" name="tags['+i+'].'+x+'"/>');
						e.val(value);
						
						form.append(e);
					}
				}
				
				//$('body').append(form);
				return form.serialize();
			}
		});
		
		$(function(){
			var activityPlanContent = $('#activity_plan_content');
			
			$('.activity_plan_btn').each(function(){
				$(this).on('click', function(){
					var tags = getCheckValues();
					var tagsSerial = $.serializeForTags(tags);
					
					queryActivityPlan(tagsSerial, function(data){
						activityPlanContent.html(data);
					});
				});
			});
		});
		
		function queryActivityPlan(tags, fn){
			$.ajax({
				url : "<%=request.getContextPath()  %>/trip/activity/query.action",
				async : false,
				data : tags,
				success : function(resp) {
					fn(resp);
				},
				error : function(resp) {
					
				}
			});
		}
		
		function getCheckValues(){
			
			var tags = [];
			$('.tags_bar li[active=true]').each(function(){
				var tagId = $(this).attr('tag-id');
				var tagPid = $(this).attr('tag-pid');
				var tagValue = $(this).attr('tag-value');
				var tag = {'tagId':tagId,'parentId':tagPid,'value':tagValue};
				
				tags.push(tag);
			});
			return tags;
			
		}
	</script>

</head>
<body>
    <div class="ui_mc_top">
        <div class="ui_mc_toolbar">
            <ul class="login_info">
                <li><a href="">登陆</a></li>
                <li><a href="">注册</a></li>
                <li><a href="">关于我们</a></li>
            </ul>
        </div>
    </div>

    <div class="ui_mc_navbar">
        <ul class="menu_item">
            <li><a href="">首页</a></li>
            <li active="true"><a href="">全部方案</a></li>
            <li><a href="">企业福利</a></li>
        </ul>
    </div>

    <div class="ad">
        <ul class="switch_btn" id="switch_btn">
            <li></li>
            <li></li>
            <li></li>
        </ul>
        <ul class="ad_img">
            <li><img src="<%=request.getContextPath()  %>/images/ad_01.png"></li>
        </ul>
    </div>

    <div class="ui_mc_content">
        <ul class="recommend">
            <li><img src="<%=request.getContextPath()  %>/images/ad_01.png"></li>
            <li><img src="<%=request.getContextPath()  %>/images/ad_01.png"></li>
            <li><img src="<%=request.getContextPath()  %>/images/ad_01.png"></li>
        </ul>
        <div class="tags">
            <div class="title">
                <span>筛选方案</span>
            </div>
            <div class="content">
            	<c:forEach items="${webResult.object }" var="tagMap" varStatus="vs">
	                <div class="tag_row">
	                    <span>
	                        <img src="<%=request.getContextPath()  %>/images/tag_icon.png">${tagMap.key.tag }：
	                    </span>
	                    <ul class="tag_items">
	                    	<c:forEach items="${tagMap.value}" var="tag">
	                        <li 
								<c:if test="${tag.active }">active="true"</c:if>
								tag-id="${tag.tagId }"
								tag-pid="${tag.parentId }"
								tag-value="${tag.value }"
								class="activity_plan_btn">
								<a href="javascript:vf();">${tag.tag }</a>
	                        </c:forEach>
	                    </ul>
	                </div>
	            </c:forEach>
                <div class="tag_row">
                    <span>
                        <<%=request.getContextPath()  %>/images/>排列方式：
                    </span>
                    <ul class="tag_items">
                        <li active="true"><a>默认</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="active_plan_content">
        	<section id="activity_plan_content"></section>
            <div class="ui_mc_pagination_bar">
                <ul class="ui_mc_pagination">
                    <li><a href="">上一面</a></li>
                    <li><a href="">1</a></li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>
                    <li><a href="">6</a></li>
                    <li><a href="">下一页</a></li>
                </ul>
            </div>

            <div class="ui_mc_ad_card">
                <img src="<%=request.getContextPath()  %>/images/ad_card_01.png">
            </div>

            <div class="ui_mc_advantage">
                <div class="advantage">
                    <img src="<%=request.getContextPath()  %>/images/adv_01.png"/>
                    <div class="desc">
                        <h3>专业服务</h3>
                        <span>公司所有的服务人员都是有旅游专业背景</span>
                    </div>
                </div>
                <div class="advantage">
                    <img src="<%=request.getContextPath()  %>/images/adv_01.png"/>
                    <div class="desc">
                        <h3>专业服务</h3>
                        <span>公司所有的服务人员都是有旅游专业背景</span>
                    </div>
                </div>
                <div class="advantage">
                    <img src="<%=request.getContextPath()  %>/images/adv_01.png"/>
                    <div class="desc">
                        <h3>专业服务</h3>
                        <span>公司所有的服务人员都是有旅游专业背景</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="ui_mc_footer">
        <ul class="about">
            <li><a href="">关于我们</a></li>
            <li><a href="">加入我们</a></li>
            <li><a href="">帮助中心</a></li>
            <li><a href="">联系我们</a></li>
        </ul>
        <ul class="link">
            <li>友情链接：</li>
            <li><a href="">幽幽xxx</a></li>
            <li><a>幽幽xxx</a></li>
            <li><a>幽幽xxx</a></li>
        </ul>
        <span class="copyright">copyright©2014-2015 团建宝版权所有 京ICP备14017744号-5</span>
    </div>

</body>
</html>
