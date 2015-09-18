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
<div class="img_scroll_panel active_plan">
    <div class="img_card">
        <div class="screen">
        	<a href="<%=request.getContextPath()  %>/trip/activity/detail.action?activityPlanId=${activityPlan.activityPlanId}">
            	<img src="<%=request.getContextPath()  %>/${activityPlan.imageURL}">
            </a>
        </div>
    </div>
    <div class="detail">
        <h1><a href="<%=request.getContextPath()  %>/trip/activity/detail.action?activityPlanId=${activityPlan.activityPlanId}"><c:out value="${activityPlan.name }" escapeXml="false"/></a></h1>
		<h2>${activityPlan.description }</h2>
        <div class="top">
            <div class="fit">
	            <c:forEach items="${activityPlan.tags }" var="tagMap" varStatus="vs">
		            <ul>
		            	<c:forEach items="${tagMap.value}" var="tag" varStatus="xvs">
			            	<c:if test="${xvs.index == 0 }">
			            		<li class="title">${tagMap.key.tag }：</li>
			            		<li>${tag.tag }</li>
			            	</c:if>
			            	<c:if test="${xvs.index != 0 }">
			            		<li>${tag.tag }</li>
			            	</c:if>
		                </c:forEach>
		            </ul>
	            </c:forEach>
            </div>
            <hr class="divider"/>
            <div class="desc">
                <ul>
                    <li class="title">出发地：</li>
                    <li><c:out value="${activityPlan.departure }" escapeXml="false"/></li>
                </ul>
                <ul>
                    <li class="title">目的地：</li>
                    <li><c:out value="${activityPlan.destination }" escapeXml="false"/></li>
                </ul>
                <ul>
                    <li class="title">活动时间：</li>
                    <li><c:out value="${activityPlan.takeTime }" escapeXml="false"/></li>
                </ul>
                <ul>
                    <li class="title">往返交通：</li>
                    <li><c:out value="${activityPlan.traffic }" escapeXml="false"/></li>
                </ul>
                <ul>
                    <li class="title">最低团建人数：</li>
                    <li><c:out value="${activityPlan.minPepoleNum }" escapeXml="false"/></li>
                </ul>
                <ul>
                    <li class="title">提交报名：</li>
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