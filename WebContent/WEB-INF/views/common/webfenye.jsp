<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link id="bs-css" href="${ctx}/static/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

<div style="float:left;">
	每页【 ${pageView.pageSize} 】行  第 ${pageView.pageNow} 页/共
	<c:if test="${pageView.pageCount==0}"> 1 </c:if>
	<c:if test="${pageView.pageCount!=0}"> ${pageView.pageCount} </c:if>
	页
</div>
<div align="center">

  <ul class="pagination">
	<c:if test="${pageView.pageCount gt 1}">
		
			<li><a href="javascript:void(0);" onclick="pageNow('1');"> 首页 </a></li>
			
			<c:if test="${pageView.pageNow eq 1}">
				<li class="disabled"><a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			</c:if>
			<c:if test="${pageView.pageNow gt 1}">
				<li><a href="javascript:pageNow('${pageView.pageNow - 1}')" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			</c:if>
			<c:forEach begin="${pageView.pageindex.startindex}"	end="${pageView.pageindex.endindex}" var="key">
				<c:if test="${pageView.pageNow==key}">
					<li><a href="javascript:void(0);">${key}</a></li>
				</c:if>
				<c:if test="${pageView.pageNow!=key}">
					<li><a href="javascript:void(0);" onclick="pageNow('${key}')">${key}</a></li>
				</c:if>
			</c:forEach>
		    <c:if test="${pageView.pageNow lt pageView.pageCount}">
			    <li><a href="javascript:void(0);" onclick="pageNow('${pageView.pageNow + 1}')" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
			<c:if test="${pageView.pageNow ge pageView.pageCount}">
				<li class="disabled"><a href="javascript:void(0);" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
			</c:if>
			
			<li><a href="javascript:void(0);" onclick="pageNow('${pageView.pageCount}')"> 尾页 </a><li>
	</c:if>
	<c:if test="${pageView.pageCount lt 1 || pageView.pageCount == 1}">
			<li class="disabled"><a href="javascript:void(0);" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
			<li><a href="javascript:void(0);" onclick="pageNow('1')">1</a></li>
			<li class="disabled"><a href="javascript:void(0);" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
		
	</c:if>
  </ul>

</div>
