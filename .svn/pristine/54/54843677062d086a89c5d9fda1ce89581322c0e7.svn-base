<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script type="text/javascript" src="${ctx}/static/js/jymf.js"></script>
</head>
<body>

<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>凭证申请</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="labelIndex" action="${ctx}/monitor/company/label/query" method="post">
			   	<div class="form-group">
			      	<label>货物名称&nbsp;&nbsp;</label>
			        <input name="productName" type="text" value="${labelIndex.productName}" class="form-control input-sm" value="${product.name}"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >申请单ID</th>
	            <th >货物名称</th>
	            <th >起始凭证</th>
	            <th >结束凭证</th>
	            <th >申请数量</th>
	            <th >已使用</th>
	            <th >可调计数量</th>
	            <th >创建日期</th>
		    </tr>
	    </thead>
	    <tbody>
		     <c:forEach var="labelIndex" items="${pageView.records}">
		        <tr <c:if test="${labelIndex.finalCount==0}"> style="color:#B9B5B5"</c:if>>
		            <td>${labelIndex.id}</td>
		            <td>${labelIndex.productName}</td>
		            <td>${labelIndex.startTid}</td>
		            <td>${labelIndex.endTid}</td>
		            <td>${labelIndex.count}</td>
		            <td>${labelIndex.useCount}</td>
		            <td>${labelIndex.finalCount}</td>
		            <td><fmt:formatDate value="${labelIndex.createDate}" type="both" pattern="yyyy/MM/dd"/></td>
		           
		        </tr>
		        </c:forEach>
		        <c:if test="${pageView.pageNum < pageView.pageSize }">
		            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
		                <tr>
		                    <td>&nbsp;</td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		                    <td></td>
		              		<td></td>
		                </tr> 
		            </c:forEach> 
		        </c:if>
	    </tbody>
	    </table>
	    <div align="center">
	    	<%@include file="../../../common/webfenye.jsp" %>
	    </div>
    </div>
    
    </div>
    </div>
    <!--/span-->
    </div><!--/row-->
</body>
</html>