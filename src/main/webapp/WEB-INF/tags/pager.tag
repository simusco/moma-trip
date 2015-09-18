<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="curIndex" type="java.lang.Long" required="true"%>
<%@ attribute name="pageSize" type="java.lang.Long" required="true"%>
<%@ attribute name="pagerRange" type="java.lang.Long" required="true"%>
<%@ attribute name="totalPage" type="java.lang.Long" required="true"%>
<%
	long begin = Math.max(1, curIndex - pagerRange / 2);
	long end = Math.min(begin + (pagerRange - 1), totalPage);

	request.setAttribute("p_begin", begin);
	request.setAttribute("p_end", end);
%>

<div class="pagination_bar">
    <ul class="pagination">
    	<li class="first">
	    	<%
				if (curIndex != 1) {
			%>
			<a href="javascript:gotoPage(<%=curIndex - 1%>)">上一页</a>
			<%
				} else {
			%>
			<a href="javascript:gotoPage(1)">上一页</a>
			<%
				}
			%>
		</li>
    
    	<c:forEach var="i" begin="${p_begin}" end="${p_end}">
			<c:choose>
				<c:when test="${i == curIndex}">
					<li active="true"><a href="javascript:gotoPage(${i})">${i}</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="javascript:gotoPage(${i})">${i}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
    
    	<li class="last">
    	<%
			if (curIndex < totalPage) {
		%>
			<a href="javascript:gotoPage(<%=curIndex + 1%>)">下一页</a>
		<%
			} else {
		%>
			<a href="javascript:gotoPage(<%=totalPage%>)">下一页</a></td>
		<%
			}
		%>
		</li>
    </ul>
</div>