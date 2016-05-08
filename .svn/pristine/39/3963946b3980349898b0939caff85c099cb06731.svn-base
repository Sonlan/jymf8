<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/company/beforeImport/add');
        });
    });
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>入境前信息</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="plan" action="${ctx}/company/beforeImport/query" method="post">
			   	<div class="form-group">
			      	<label>ID号&nbsp;&nbsp;</label>
			        <input name="planId" value="${plan.planId}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>货物名称&nbsp;&nbsp;</label>
			        <input name="proName" value="${plan.proName}" type="text" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
                <c:if test="${fn:contains(sessionScope.authority,'020202')}">
                <button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>
                </c:if>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >ID号</th>
			    <th >货物名称</th>
	            <th >启运国家</th>
	            <th >启运日期</th>
	            <th >拟到达口岸</th>
	            <th >运输方式</th>
	            <c:if test="${fn:contains(sessionScope.authority,'020203') || fn:contains(sessionScope.authority,'020204')}">
	            <th >操作</th>
	            </c:if>
		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="plan" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${plan.planId}</td>
			            <td>${plan.proName}</td>
			            <td>${plan.departCountry}</td>
			            <td>
			            	<fmt:formatDate value="${plan.departDate}" pattern="yyyy-MM-dd"/>
			            </td>
			            <td>${plan.arrivalPortPlan}</td>
			            <td>
			            	<c:set var="type" value="${plan.shippingType}"></c:set>
			            	${shippingType[fn:trim(type)]}
			            </td>
			            <c:if test="${fn:contains(sessionScope.authority,'020203') || fn:contains(sessionScope.authority,'020204')}">
			            <td align="center">
			            	<c:if test="${fn:contains(sessionScope.authority,'020203') }">
			                <a class="btn btn-info btn-sm" href="${ctx}/company/beforeImport/update/${plan.id}">
			                	<i class="glyphicon glyphicon-edit"></i>&nbsp;修改
			                </a>
			                </c:if>
			                <c:if test="${fn:contains(sessionScope.authority,'020204')}">
			                <a class="btn btn-info btn-sm" href="${ctx}/company/beforeImport/productInfo/${plan.id}">
			                	<i class="glyphicon glyphicon-search"></i>&nbsp;详细
			                </a>
			                </c:if>
			            </td>
			            </c:if>
			        </tr>
			  </c:forEach>
      
        <c:if test="${pageView.pageNum < pageView.pageSize }">
            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
                <tr class="jymf_tr table_1_tr">
                    <td>&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <c:if test="${fn:contains(sessionScope.authority,'020203') || fn:contains(sessionScope.authority,'020204')}">
                    <td></td>
                    </c:if>
                </tr> 
            </c:forEach> 
        </c:if>
  
	    </tbody>
	    </table>
	    <div align="center">
	    	<%@include file="../../common/webfenye.jsp" %>
	    </div>
    </div>
    
    </div>
    </div>
    <!--/span-->

    </div><!--/row-->
</body>
</html>