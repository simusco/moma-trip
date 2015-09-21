<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>178团建旅游网</title>

    <link rel="stylesheet" href="<%=request.getContextPath()  %>/css/index.css"/>
    <script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>
    <script src="<%=request.getContextPath()  %>/public/flash-player/swfobject.js"></script>

    <script type="text/javascript">
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

                    $('#blind_btn').css(
                    	{
                    		'left': $(document).width() / 2 - $('#blind_btn').width() / 2,
                    		'display':'block'
                    	}
                    );
                }
            }
        });

        $(function(){
            $.uiAnimation.advertise();
            $.uiAnimation.moveUp();
            $.uiAnimation.imgChange();
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
        <li><a href="<%=request.getContextPath()  %>/trip/activity/index.action" class="first active">首页</a></li>
        <li><a href="<%=request.getContextPath()  %>/trip/activity/toQuery.action">全部方案</a></li>
        <li><a href="">企业福利</a></li>
    </ul>
</div>

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

<div class="content">

    <div class="rec_service">
        <h1 class="title">热门推荐<a href="" class="more">更多</a></h1>
        <div class="img_list_3">
            <ul class="first_row">
                <li class="first">
                    <img src="<%=request.getContextPath()  %>/images/rec001-1.png"/>
                    <div class="rec">
                        <span class="loction">西冲</span>
                        <span class="exercise">杨梅花坑骑车</span>
                    </div>
                </li>
                <li>
                    <img src="<%=request.getContextPath()  %>/images/rec001-2.jpg"/>
                    <div class="rec">
                        <span class="loction">西冲</span>
                        <span class="exercise">杨梅花坑骑车</span>
                    </div>
                </li>
                <li class="last">
                    <img src="<%=request.getContextPath()  %>/images/rec001-3.jpg"/>
                    <div class="rec">
                        <span class="loction">西冲</span>
                        <span class="exercise">杨梅花坑骑车</span>
                    </div>
                </li>
            </ul>
            <ul>
                <li class="first">
                    <img src="<%=request.getContextPath()  %>/images/rec001-4.jpg"/>
                    <div class="rec">
                        <span class="loction">西冲</span>
                        <span class="exercise">杨梅花坑骑车</span>
                    </div>
                </li>
                <li>
                    <img src="<%=request.getContextPath()  %>/images/rec001-5.jpg"/>
                    <div class="rec">
                        <span class="loction">西冲</span>
                        <span class="exercise">杨梅花坑骑车</span>
                    </div>
                </li>
                <li class="last">
                    <img src="<%=request.getContextPath()  %>/images/rec001-1.png"/>
                    <div class="rec">
                        <span class="loction">西冲</span>
                        <span class="exercise">杨梅花坑骑车</span>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="rec_service">
        <h1 class="title">热门推荐<a href="" class="more">更多</a></h1>
        <div class="img_list_4">
            <ul class="first_row">
                <li class="first">
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
                <li class="active last">
                    <div style="position: relative;z-index: 0;margin-top: 5px;" ui-move-up="5">
                        <img src="<%=request.getContextPath()  %>/images/sev_002.png">
                        <div class="img_title">服务案例三</div>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <div class="four_reason">
        <h1>选择一起团建的4大理由</h1>
        <div class="content">
            <div class="text">
                <ul class="first">
                    <li>
                        <img src="<%=request.getContextPath()  %>/images/reason_001.png"/>
                        <h3>专业客服服务</h3>
                        <span>激光对抗系统射程超过400米，战绩，损伤可自动统计，战斗时间.</span>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath()  %>/images/reason_002.png"/>
                        <h3>专业客服服务</h3>
                        <span>激光对抗系统射程超过400米，战绩，损伤可自动统计，战斗时间.</span>
                    </li>
                </ul>
                <ul>
                    <li>
                        <img src="<%=request.getContextPath()  %>/images/reason_003.png"/>
                        <h3>专业客服服务</h3>
                        <span>激光对抗系统射程超过400米，战绩，损伤可自动统计，战斗时间.</span>
                    </li>
                    <li>
                        <img src="<%=request.getContextPath()  %>/images/reason_004.png"/>
                        <h1>专业客服服务</h1>
                        <span>激光对抗系统射程超过400米，战绩，损伤可自动统计，战斗时间.</span>
                    </li>
                </ul>
            </div>
            <div class="media">
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
                <h2>公司介绍</h2>
            </div>
        </div>
    </div>

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