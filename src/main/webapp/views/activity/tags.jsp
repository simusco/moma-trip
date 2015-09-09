<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="" type="text/css" href="<%=request.getContextPath()  %>/css/reset.css"/>
	
	<script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>
	<style type="text/css">
		.tags_bar li[active=true] a{
			font-weight:bold;
			color:red;
		}
	</style>
	
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
<body id="xx">
	<div class="tags_bar" id="tags_bar">
		<c:forEach items="${webResult.object }" var="tagMap" varStatus="vs">
		<div>
			<span>${tagMap.key.tag }</span>
			<ul>
				<c:forEach items="${tagMap.value}" var="tag">
					<li 
						<c:if test="${tag.active }">active="true"</c:if>
						tag-id="${tag.tagId }"
						tag-pid="${tag.parentId }"
						tag-value="${tag.value }"
						class="activity_plan_btn"
					>
						<a href="javascript:vf();">${tag.tag }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		</c:forEach>
	</div>
	<div id="activity_plan_content"></div>
</body>
</html>
