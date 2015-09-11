<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<script type="text/javascript">
<!--

$(function(){
	$('.active_plan').each(function(){
		var ap = $(this);
		ap.mouseover(function(){
			$(this).css({
				'border':'1px solid #f07600',
				/*'-webkit-box-shadow':'0 0 10px rgba(0, 204, 204, .5)',
				'-moz-box-shadow':'0 0 10px rgba(0, 204, 204, .5)',
				'box-shadow':'0 0 10px rgba(0, 204, 204, .5)'*/
			});
		});
		ap.mouseout(function(){
			$(this).css({
				'border':''/*,
				'-webkit-box-shadow':'',
				'-moz-box-shadow':'',
				'box-shadow':''*/
			});
		});
	});
});

//-->
</script>

<c:forEach items="${activityPlanList.list }" var="activityPlan">
	<div class="active_plan">
		<img src="<%=request.getContextPath()  %>/${activityPlan.imageURL}">
		<div class="desc">
		    <h1><c:out value="${activityPlan.name }" escapeXml="false"/></h1>
		    <h2>${activityPlan.description }</h2>
		    <div class="desc_table">
		    	
		    	<c:forEach items="${activityPlan.tags }" var="tagMap" varStatus="vs">
		    		<div class="tag_row">
			            <span>${tagMap.key.tag }：</span>
			            <ul class="tag_items">
			            	<c:forEach items="${tagMap.value}" var="tag">
			                <li>${tag.tag }</li>
			                </c:forEach>
			            </ul>
			        </div>
	            </c:forEach>
	            
		        <hr class="divider"/>
		        <div class="tag_row">
		            <span>出发地：</span>
		            <ul class="tag_items">
		                <li><c:out value="${activityPlan.departure }" escapeXml="false"/></li>
		            </ul>
		        </div>
		        <div class="tag_row">
		            <span>目的地：</span>
		            <ul class="tag_items">
		                <li><c:out value="${activityPlan.destination }" escapeXml="false"/></li>
		            </ul>
		        </div>
		        <div class="tag_row">
		            <span>往返交通：</span>
		            <ul class="tag_items">
		                <li><c:out value="${activityPlan.traffic }" escapeXml="false"/></li>
		            </ul>
		        </div>
		        <div class="tag_row">
		            <span>最低团建人数：</span>
		            <ul class="tag_items">
		                <li><c:out value="${activityPlan.minPepoleNum }" escapeXml="false"/></li>
		            </ul>
		        </div>
		        <div class="tag_row">
		            <span>提前报名：</span>
		            <ul class="tag_items">
		                <li><c:out value="${activityPlan.preRegDay }" escapeXml="false"/></li>
		            </ul>
		        </div>
		    </div>
		</div>
	</div>
</c:forEach>
<tags:pager
	pagerRange="6" 
   	pageSize="15" 
   	totalPage="${activityPlanList.totalPage }" 
   	curIndex="${activityPlanList.currPage}"/>