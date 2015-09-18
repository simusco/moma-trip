<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>

    <link rel="stylesheet" href="<%=request.getContextPath()  %>/css/detail.css"/>
    <script src="<%=request.getContextPath()  %>/public/jquery/jquery.min.js"></script>

    <script type="text/javascript">
       $(function(){
           $(window).scroll( function() {
               var scrollTop = $(this).scrollTop(),
                       gobar = $('#go-bar');
               if(scrollTop <= 580){
                   gobar.removeClass('fixed');
                   gobar.css('top', '');
               }else{
                   $('#go-bar').addClass('fixed')
                   gobar.css('top', scrollTop - 140);
               }
           });

           $('#switch-left-btn').click(function(){
               var currLi = $('.switch_btn li[active=true]'),
                       preLi = currLi.prev('li').get(0),
                       preLi = $(preLi);
               switchBtn(currLi, preLi);
           });

           $('#switch-right-btn').click(function(){
               var currLi = $('.switch_btn li[active=true]'),
                       nextLi = currLi.next('li').get(0),
                       nextLi = $(nextLi);
               switchBtn(currLi, nextLi);
           });

           $('.switch_btn > li').each(function(){
               $(this).click(function(){
                   var currLi = $('.switch_btn li[active=true]');
                   switchBtn(currLi,  $(this));
               });
           });

           $('#go-bar > ul > li').each(function(){
               var li = $(this);
               li.click(function(){
                   setUnActive();//un select all li;

                   $(this).addClass("active");
               });
           });
       });

       function setUnActive(){
           $('#go-bar > ul > li').each(function(){
               $(this).removeClass("active");
           });
       }

       function switchBtn(currLi, oLi){
           if(oLi != null && oLi.length == 1){
               oLi.attr('active','true');
               $('img', oLi).addClass('active');

               currLi.removeAttr('active');
               $('img', currLi).removeClass('active');

               screen(oLi.attr('screen-url'));
           }
       }

       function screen(url){
           $('#screen').attr('src', url);
       }

       function fn(){}
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

<div class="content">
    <div class="img_scroll_panel">
        <div class="img_card">
            <div class="screen">
                <img src="<%=request.getContextPath()  %>/images/screen_001.jpg" id="screen"/>
            </div>
            <div class="switch_bar">
                <div class="switch_left_btn"><a href="javascript:fn();" id="switch-left-btn"></a></div>
                <ul class="switch_btn">
                    <li active="true" screen-url="<%=request.getContextPath()  %>/images/screen_001.jpg">
                        <a href="javascript:fn();"><img src="<%=request.getContextPath()  %>/images/screen_001.jpg" class="first active"/></a>
                    </li>
                    <li screen-url="<%=request.getContextPath()  %>/images/screen_002.jpg"><a href="javascript:fn();"><img src="<%=request.getContextPath()  %>/images/screen_002.jpg"/></a></li>
                    <li screen-url="<%=request.getContextPath()  %>/images/screen_001.jpg"><a href="javascript:fn();"><img src="<%=request.getContextPath()  %>/images/screen_001.jpg"/></a></li>
                    <li screen-url="<%=request.getContextPath()  %>/images/screen_001.jpg"><a href="javascript:fn();"><img src="<%=request.getContextPath()  %>/images/screen_001.jpg"/></a></li>
                </ul>
                <div class="switch_right_btn"><a href="javascript:fn();" id="switch-right-btn"></a></div>
            </div>
        </div>
        <div class="detail">
            <h1><c:out value="${activityPlan.name }" escapeXml="false"/></h1>
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
            
            <div class="book">
                <span>特惠价：<fmt:formatNumber pattern="###,###" value="${activityPlan.price }"/>元每人</span>
                <button class="btn">立即预定</button>
            </div>
        </div>
    </div>

    <div class="gobar" id="go-bar">
        <ul>
            <li class="active"><a href="#special_anchor">产品特色</a></li>
            <li><a href="javascript:fn();">具体行程</a></li>
            <li><a href="javascript:fn();">注意事项</a></li>
            <li><a href="#expenditure_anchor">费用说明</a></li>
            <li><a href="#remark_anchor">备注</a></li>
            <li class="last"></li>
        </ul>
    </div>

    <div class="go_detailbar"  name="special_anchor"  id="special_anchor">
        <div class="title">
            <span>产品特色</span>
        </div>
        <div class="arrow"></div>
    </div>
    <div class="go_detail">
        <ul class="ui-star-1">
            <li>产品特色就是该产品显著区别于其他产品的风格.</li>
            <li>是由产品赖以产生和发展的特定的具体的环境因素所决定的.</li>
            <li>产品特色定位是指企业为突出产品的某个特色便其在消费者心目中形成突出印象.</li>
            <li>某个特色便其在消费者心目中形成突出印象</li>
            <li>全国人大常委会副委员长陈竺14日在人民大会堂会见了到访的法国戴.</li>
        </ul>
    </div>

    <div class="go_detailbar" name="expenditure_anchor" id="expenditure_anchor">
        <div class="title">
            <span>费用说明</span>
        </div>
        <div class="arrow"></div>
    </div>
    <div class="go_detail">
        <div class="gosubbar">
            <span>费用包含</span>
        </div>
        <ul class="ui-star-1">
            <li>产品特色就是该产品显著区别于其他产品的风格.</li>
            <li>是由产品赖以产生和发展的特定的具体的环境因素所决定的.</li>
            <li>产品特色定位是指企业为突出产品的某个特色便其在消费者心目中形成突出印象.</li>
            <li>某个特色便其在消费者心目中形成突出印象</li>
            <li>全国人大常委会副委员长陈竺14日在人民大会堂会见了到访的法国戴.</li>
        </ul>
        <div class="gosubbar">
            <span>费用包含</span>
        </div>
        <ul class="ui-star-1">
            <li>产品特色就是该产品显著区别于其他产品的风格.</li>
            <li>是由产品赖以产生和发展的特定的具体的环境因素所决定的.</li>
            <li>产品特色定位是指企业为突出产品的某个特色便其在消费者心目中形成突出印象.</li>
            <li>某个特色便其在消费者心目中形成突出印象</li>
            <li>全国人大常委会副委员长陈竺14日在人民大会堂会见了到访的法国戴.</li>
        </ul>
    </div>

    <div class="go_detailbar" name="remark_anchor" id="remark_anchor">
        <div class="title">
            <span>备注</span>
        </div>
        <div class="arrow"></div>
    </div>
    <div class="go_detail">
        <ul class="ui-list-1">
            <li>产品特色就是该产品显著区别于其他产品的风格.</li>
            <li>是由产品赖以产生和发展的特定的具体的环境因素所决定的.</li>
            <li>产品特色定位是指企业为突出产品的某个特色便其在消费者心目中形成突出印象.</li>
            <li>某个特色便其在消费者心目中形成突出印象</li>
        </ul>
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