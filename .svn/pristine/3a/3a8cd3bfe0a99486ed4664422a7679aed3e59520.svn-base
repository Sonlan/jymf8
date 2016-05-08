<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
</head>

<body>

<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>标识统计</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" class="form-inline" modelAttribute="companyCount" action="${ctx}/company/count/query" method="post">
			   	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${companyCount.startDate}"  class="form-control input-sm" />&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${companyCount.endDate}" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
	            <th >产品ID</th>
			    <th >产品名称</th>
	            <th >申请数量</th>
	            <th >已使用</th>
		    </tr>
	    </thead>
	    <tbody>
		     <c:forEach var="companyCount" items="${pageView.records}">
		        <tr>
		            <td>${companyCount.productId}</td>
		        	<td>${companyCount.productName}</td>
		            <td>${companyCount.activeCnt}</td>
		            <td>${companyCount.packageCnt}</td>
		        </tr>
		        </c:forEach>
		        <c:if test="${pageView.pageNum < pageView.pageSize }">
		            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
		                <tr>
		                    <td>&nbsp;</td>
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
    </div><!--/span-->
    </div><!--/row-->

</body>
</html>