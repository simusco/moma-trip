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
    <link type="text/css" href="<%=request.getContextPath()  %>/css/query.css" rel="stylesheet"/>
    
    <script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()  %>/scripts/index.js"></script>
    
    <script type="text/javascript">
	    function vf(){
	    }
	
	    $.extend({
	    	serializeForTags:function(array, op){
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
	    		
	    		for(m in op){
	    			var value = op[m];
	    			var e = $('<input type="hidden" name="'+m+'"/>');
	    			e.val(value);
	    			
	    			form.append(e);
	    		}
	    		
	    		return form.serialize();
	    	},
	    	activeSelect:function(o){
	    		o.parent().find('> li').each(function(){
	    			$(this).attr('active', 'false');
	    		});
	    		
	    		o.attr('active','true');
	    	}
	    });
	
	    function displayActivityPlan(op){
	    	var activityPlanContent = $('#activity_plan_content');
	    	var tags = getCheckValues();
	    	var tagsSerial = $.serializeForTags(tags, op);
	    	
	    	queryActivityPlan(tagsSerial, function(data){
	    		activityPlanContent.html(data);
	    	});
	    	
	    }
	
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
	    	$('.tag_items > li[active=true]').each(function(){
	    		var tagId = $(this).attr('tag-id');
	    		var tagPid = $(this).attr('tag-pid');
	    		var tagValue = $(this).attr('tag-value');
	    		var tagName = $(this).attr('tag');
	    		var tag = {'tagId':tagId,'parentId':tagPid,'value':tagValue,'tag':tagName};
	    		
	    		tags.push(tag);
	    	});
	    	return tags;
	    	
	    }
	
	    function gotoPage(pageIndex){
	    	displayActivityPlan({'currPage':pageIndex});
	    }
    
	    $(function(){
	    	$('.activity_plan_btn').each(function(){
	    		$(this).on('click', function(){
	    			$.activeSelect($(this));
	    			
	    			displayActivityPlan({});
	    		});
	    	});
	    	
	    	var imgs = [];
	    	$('.switch_btn li').each(function(){
	    		var adImgUrl = $(this).attr('ad-img-url');
	    		imgs.push(adImgUrl);
	    		
	    		$(this).click(function(){
	    			$('#switch_display_screen').attr('src', $(this).attr('ad-img-url'));
	    			$('.switch_btn li').each(function(){
	    				$(this).css('background-color','#ffffff');
	    			});
	    			$(this).css('background-color','#fb8300');
	    		});
	    	});
	    	
	    	var index = 0;
	    	window.setInterval(function(){
	    		if(index > imgs.length) index = 0;
	    		
	    		$('#switch_display_screen').attr('src',imgs[index]);
	    		
	    		index ++;
	    	},5000);
	    	
	    	$('#switch_btn').css('left', $(document).width() / 2 - $('#switch_btn').width() / 2);
	    	
	    	//load data from server.
	    	displayActivityPlan();
	    });
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
            <li><a href="<%=request.getContextPath()  %>/trip/activity/index.action">首页</a></li>
            <li active="true"><a href="<%=request.getContextPath()  %>/trip/activity/toQuery.action">全部方案</a></li>
            <li><a href="">企业福利</a></li>
        </ul>
    </div>

    <div class="ad">
        <ul class="switch_btn" id="switch_btn">
            <li ad-img-url='<%=request.getContextPath()  %>/images/ad_01.png'></li>
            <li ad-img-url='<%=request.getContextPath()  %>/images/ad_02.png'></li>
            <li ad-img-url='<%=request.getContextPath()  %>/images/ad_03.png'></li>
        </ul>
        <ul class="ad_img">
            <li><img src="<%=request.getContextPath()  %>/images/ad_01.png" id="switch_display_screen"></li>
        </ul>
    </div>

    <div class="ui_mc_content">
        <ul class="recommend">
            <li><img src="<%=request.getContextPath()  %>/images/ad_03.png"></li>
            <li><img src="<%=request.getContextPath()  %>/images/ad_02.png"></li>
            <li><img src="<%=request.getContextPath()  %>/images/ad_04.jpg"></li>
        </ul>
        <div class="tags">
            <div class="title">
                <span>筛选方案</span>
            </div>
            <div class="content">
            	<c:forEach items="${webResult.object }" var="tagMap" varStatus="vs">
	                <div class="tag_row">
	                    <span>
	                        <img src="<%=request.getContextPath()  %>/${tagMap.key.icon }">${tagMap.key.tag }：
	                    </span>
	                    <ul class="tag_items">
	                    	<c:forEach items="${tagMap.value}" var="tag">
	                        <li 
								<c:if test="${tag.active }">active="true"</c:if>
								tag-id="${tag.tagId }"
								tag-pid="${tag.parentId }"
								tag-value="${tag.value }"
								class="activity_plan_btn"
								tag="${tag.tag }"
								>
								<a href="javascript:vf();">${tag.tag }</a>
	                        </c:forEach>
	                    </ul>
	                </div>
	            </c:forEach>
            </div>
        </div>
        <div class="active_plan_content">
        	<section id="activity_plan_content"></section>

            <div class="ui_mc_ad_card">
                <img src="<%=request.getContextPath()  %>/images/ad_card_01.png">
            </div>

            <div class="ui_mc_advantage">
                <div class="advantage">
                    <p>
                    	<img src="<%=request.getContextPath()  %>/images/adv_01.png"/>
                        <span>
                        	<b>专业服务</b>
                        	公司所有的服务人员都是有旅游专业背景
                        </span>
                    </p>
                </div>
                <div class="advantage">
                    <p>
                    	<img src="<%=request.getContextPath()  %>/images/adv_01.png"/>
                        <span>
                        	<b>专业服务</b>
                        	公司所有的服务人员都是有旅游专业背景
                        </span>
                    </p>
                </div>
                <div class="advantage">
                    <p>
                    	<img src="<%=request.getContextPath()  %>/images/adv_01.png"/>
                        <span>
                        	<b>专业服务</b>
                        	请在此列表的末端始终定义一种普通的光标，以防没有由 URL 定义的可用光标。
                        </span>
                    </p>
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
