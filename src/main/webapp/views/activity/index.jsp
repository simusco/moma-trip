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

    <link type="text/css" href="<%=request.getContextPath()  %>/css/index.css" rel="stylesheet"/>
    
    <script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()  %>/scripts/index.js"></script>
    <script src="<%=request.getContextPath()  %>/public/flash-player/swfobject.js"></script>
    
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
	    	    	},3000);
	    	    	
	    	    	$('#switch_btn').css('left', $(document).width() / 2 - $('#switch_btn').width() / 2);
	    		}
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
	    	
	    	//load data from server.
	    	displayActivityPlan();
	    	
	    	$.uiAnimation.advertise();
	    	$.uiAnimation.moveUp();
	    	$.uiAnimation.imgChange();
	    });
	    
	    $.fn.extend({
	    	setCenterAlign:function(){
	    		'use strict';

	    		var obj = $(this);
	    		var marginLeft = parseFloat(obj.css('margin-left').replace("px",""));
	    		var recWidth = obj.width();
	    		var winWidth = $(window).width();
	    		var recLeft = (winWidth - recWidth - marginLeft) / 2;

	    		obj.css('left', recLeft);
	    	}
	    });

	    function redraw(){
	    	'use strict';

	    	/*
	    	$('*[ui-align=center]').each(function(){
	    		$(this).setCenterAlign();
	    	});*/
	    }

	    $(function(){
	    	'use strict';

	    	$(window).resize(function() {
	    		redraw();
	    	});

	    	redraw();
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
            <li active="true"><a href="<%=request.getContextPath()  %>/trip/activity/index.action">首页</a></li>
            <li><a href="<%=request.getContextPath()  %>/trip/activity/toQuery.action">全部方案</a></li>
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
        <div class="active_plan_content">
        	<div class="ui_mc_rec clearfix">
				<span class="title title_theme_a">热门推荐<span class="more">更多</span></span>
				<div class="rec_img_list_3 clearfix">
					<ul ui-align="center" class="clearfix">
						<li>
							<img src="<%=request.getContextPath()  %>/images/rec001.png" 
								 ui-img-change="<%=request.getContextPath()  %>/images/rec001.png,<%=request.getContextPath()  %>/images/rec001-1.png">
						</li>
						<li>
							<img src="<%=request.getContextPath()  %>/images/rec001.png"
								 ui-img-change="<%=request.getContextPath()  %>/images/rec001.png,<%=request.getContextPath()  %>/images/rec001-1.png">
						</li>
						<li>
							<img 
								src="<%=request.getContextPath()  %>/images/rec001.png"
								ui-img-change="<%=request.getContextPath()  %>/images/rec001.png,<%=request.getContextPath()  %>/images/rec001-1.png">
						</li>
					</ul>
					<ul ui-align="center" class="clearfix">
						<li><img src="<%=request.getContextPath()  %>/images/rec001.png"></li>
						<li><img src="<%=request.getContextPath()  %>/images/rec001.png"></li>
						<li><img src="<%=request.getContextPath()  %>/images/rec001.png"></li>
					</ul>
				</div>
			</div>
		
			<div class="ui_mc_rec clearfix">
				<span class="title title_theme_a">服务案例<span class="more">更多</span></span>
				<div class="rec_img_list_4 clearfix">
					<ul ui-align="center" class="clearfix">
						<li>
							<div style="position: relative;z-index: 0;margin-top: 5px;" ui-move-up="5">
								<img src="<%=request.getContextPath()  %>/images/sev_001.png">
								<div class="img_title">云筹之家</div>
							</div>
						</li>
						<li>
							<div style="position: relative;z-index: 0;margin-top: 5px;" ui-move-up="5">
								<img src="<%=request.getContextPath()  %>/images/sev_002.png">
								<div class="img_title">服务案例一</div>
							</div>
						</li>
						<li>
							<div style="position: relative;z-index: 0;margin-top: 5px;" ui-move-up="5">
								<img src="<%=request.getContextPath()  %>/images/sev_003.png">
								<div class="img_title">云筹之家</div>
							</div>
						</li>
						<li class="active">
							<div style="position: relative;z-index: 0;margin-top: 5px;" ui-move-up="5">
								<img src="<%=request.getContextPath()  %>/images/sev_002.png">
								<div class="img_title">服务案例三</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		
			<div class="ui_mc_reason clearfix">
				<span class="title">选择一起团建的4大理由</span>
				<div class="clearfix" style="float: left;position: relative;" ui-align="center">
					<div class="text clearfix">
						<div class="reason_row clearfix">
							<div class="reason">
								<a href=""><img src="<%=request.getContextPath()  %>/images/reason_001.png"></a>
								<div class="content">
									<h1>【品牌实力】</h1>
								<span>
									实力指实在的力量。一个国家是存在两种实力的，一种是硬实力，一种是软实力。
								</span>
								</div>
							</div>
							<div class="reason">
								<a href=""><img src="<%=request.getContextPath()  %>/images/reason_002.png"></a>
								<div class="content">
									<h1>【品牌实力】</h1>
							<span>
								实力指实在的力量。一个国家是存在两种实力的，一种是硬实力，一种是软实力。
							</span>
								</div>
							</div>
						</div>
		
						<div class="reason_row clearfix">
							<div class="reason">
								<a href=""><img src="<%=request.getContextPath()  %>/images/reason_003.png"></a>
								<div class="content">
									<h1>【品牌实力】</h1>
							<span>
								实力指实在的力量。一个国家是存在两种实力的，一种是硬实力，一种是软实力。
							</span>
								</div>
							</div>
							<div class="reason">
								<a href=""><img src="<%=request.getContextPath()  %>/images/reason_004.png"></a>
								<div class="content">
									<h1>【品牌实力】</h1>
							<span>
								实力指实在的力量。一个国家是存在两种实力的，一种是硬实力，一种是软实力。
							</span>
								</div>
							</div>
						</div>
					</div>
					<div class="media clearfix">
						<div class="video" id="CuPlayer">
							<script type="text/javascript">
							var so = new SWFObject("<%=request.getContextPath()  %>/public/flash-player/flash.swf","CuPlayerVM2","268","190","9","#000000");
							so.addParam("allowfullscreen","true");
							so.addParam("allowscriptaccess","always");
							so.addParam("wmode","opaque");
							so.addParam("quality","high");
							so.addParam("salign","lt");
							so.addVariable("video_file","http://admin.geely.com/upload/201304/586d9cecdddd9b512990eeb5150f5b57.flv"); //视频文件地址
							so.addVariable("playbtn_scale","1"); //播放按钮缩放
							so.addVariable("auto_play","no"); //是否自动播放
							so.addVariable("clock_display","yes"); 
							so.addVariable("fullscreen_display","y"); //是否允许全屏
							so.write("CuPlayer");
							</script>
						</div>
						<h1 style="display:block;height:36px;background-color:#f4f5f7;line-height:36px;text-align:center;color:#333333;font-size:14px;font-weight:bold;">
							公司介绍
						</h1>
					</div>
				</div>
			</div>

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
                    	<img src="<%=request.getContextPath()  %>/images/adv_02.png"/>
                        <span>
                        	<b>专业服务</b>
                        	公司所有的服务人员都是有旅游专业背景
                        </span>
                    </p>
                </div>
                <div class="advantage">
                    <p>
                    	<img src="<%=request.getContextPath()  %>/images/adv_03.png"/>
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
