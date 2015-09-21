<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>

    <link rel="stylesheet" href="<%=request.getContextPath()  %>/css/query.css"/>
    <script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>

    <script type="text/javascript">
    
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
	    	$(window).scrollTop(0);
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
            },
            uiAnimation:{
                moveUp:function(){
                    $('*[ui-move-up]').each(function(){
                        var o = $(this);
                        o.mouseover(function(){
                            $(this).css('margin-top','0px');
                        });

                        o.mouseout(function(){
                            var v = o.attr('ui-move-up');
                            if(parseInt(v) <=0 || parseInt(v) >= 1000){
                                v = 0;
                            }

                            $(this).css('margin-top',v+'px');
                        });
                    });
                },
                imgChange:function(){
                    $('img[ui-img-change]').each(function(){
                        var o = $(this),
                                v = o.attr('ui-img-change'),
                                imgs = v.split(',');

                        o.mouseover(function(){
                            $(this).attr('src',imgs[1]);
                        });

                        o.mouseout(function(){
                            $(this).attr('src',imgs[0]);
                        });
                    });
                },
                advertise:function(){
                    var imgs = [];
                    $('.switch_btn li').each(function(){
                        var adImgUrl = $(this).attr('ad-img-url');
                        imgs.push(adImgUrl);

                        $(this).click(function(){
                            $('#screen').attr('src', $(this).attr('ad-img-url'));
                            $('.switch_btn li').each(function(){
                                $(this).css('background-color','#ffffff');
                            });
                            $(this).css('background-color','#fb8300');
                        });
                    });

                    var index = 0;
                    window.setInterval(function(){
                        if(index > imgs.length) index = 0;

                        $('#screen').attr('src',imgs[index]);

                        index ++;
                    },3000);

                    $('#blind_btn').css('left', $(document).width() / 2 - $('#blind_btn').width() / 2);
                }
            }
        });

        $(function(){
            $.uiAnimation.advertise();
            $.uiAnimation.moveUp();
            $.uiAnimation.imgChange();
            
            $('.activity_plan_btn').each(function(){
	    		$(this).on('click', function(){
	    			$.activeSelect($(this));
	    			
	    			displayActivityPlan({});
	    		});
	    	});
            
            displayActivityPlan();
        });
    </script>

</head>
<body>

<div class="topbar">
    <div class="logo"></div>

    <div class="icon_phone">
        <ul class="menu">
            <li><a href="">登陆</a></li>
            <li><a href="">注册</a></li>
            <li><a href="">关于我们</a></li>
        </ul>
    </div>
</div>

<div class="navbar">
    <ul>
        <li><a href="<%=request.getContextPath()  %>/trip/activity/index.action" class="first">首页</a></li>
        <li><a href="<%=request.getContextPath()  %>/trip/activity/toQuery.action" class="active">全部方案</a></li>
        <li><a href="">企业福利</a></li>
    </ul>
</div>

<!-- 
<div class="ad">
    <ul class="switch_btn" id="blind_btn">
        <li ad-img-url='<%=request.getContextPath()  %>/images/ad_01.png'></li>
        <li ad-img-url='<%=request.getContextPath()  %>/images/ad_02.png'></li>
        <li ad-img-url='<%=request.getContextPath()  %>/images/ad_03.png'></li>
    </ul>
    <ul class="ad_img">
        <li><img src="<%=request.getContextPath()  %>/images/ad_03.png" id="screen"></li>
    </ul>
</div>
 -->

<div class="content">

    <ul class="recommend">
        <li class="first"><img src="<%=request.getContextPath()  %>/images/ad_01.png"></li>
        <li><img src="<%=request.getContextPath()  %>/images/ad_02.png"></li>
        <li class="last"><img src="<%=request.getContextPath()  %>/images/ad_03.png"></li>
    </ul>
    
    <div class="tags">
        <div class="title">
            <span>筛选方案</span>
        </div>
        <div class="content">
        	<c:forEach items="${webResult.object }" var="tagMap" varStatus="vs">
            <div class="tag_row ${vs.index == 0 ? "first" : "" }">
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
						tag="${tag.tag }">
						<a href="javascript:vf();">${tag.tag }</a>
                    </li>
                    </c:forEach>
                 </ul>
             </div>
         	</c:forEach>
        </div>
    </div>

    <div class="active_plan_container" id="activity_plan_content"></div>

    <div class="advertise_img">
        <img src="<%=request.getContextPath()  %>/images/card-001.jpg"/>
    </div>

    <ul class="services">
        <li>
            <img src="<%=request.getContextPath()  %>/images/service_01.png"/>
            <h1>专业客服服务</h1>
            <span>激光对抗系统射程超过400米，战绩，损伤可自动统计，战斗时间.</span>
        </li>
        <li>
            <img src="<%=request.getContextPath()  %>/images/service_02.png"/>
            <h1>专业客服服务</h1>
            <span>激光对抗系统射程超过400米，战绩，损伤可自动统计，战斗时间.</span>
        </li>
        <li>
            <img src="<%=request.getContextPath()  %>/images/service_03.png"/>
            <h1>专业客服服务</h1>
            <span>激光对抗系统射程超过400米，战绩，损伤可自动统计.</span>
        </li>
    </ul>

</div>

<div class="footer">
    <ul class="about">
        <li><a href="">关于我们</a></li>
        <li><a href="">加入我们</a></li>
        <li><a href="">帮助中心</a></li>
        <li class="last"><a href="">联系我们</a></li>
    </ul>
    <span class="copyright">copyright©2014-2015 团建宝版权所有 京ICP备14017744号-5</span>
</div>

</body>
</html>