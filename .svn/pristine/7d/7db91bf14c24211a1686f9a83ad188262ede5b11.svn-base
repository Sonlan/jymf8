<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit">
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>企业信息</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="company" action="${ctx}/admin/company/query" method="post">
			   	<div class="form-group">
			      	<label>企业名称&nbsp;&nbsp;</label>
			        <input name="name" value="${company.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
			   <%-- 	<div class="form-group">
			      	<label>企业ID&nbsp;&nbsp;</label>
			        <input name="id" value="${company.id}" type="text" class="form-control input-sm"/>
			  	</div>    --%>   
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >企业名称</th>
			    <th >企业代码</th>
	            <th >当前状态</th>
	            <th >工作模式</th>
	            <th >产品维护</th>
	            <th >统计</th>
	            <th >操作</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="company" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${company.name}</td>
			            <td>${company.id}</td>
			            <td>
			            	<c:if test="${company.status eq '0'}">正常</c:if>
                    		<c:if test="${company.status eq '1'}">挂起</c:if>
                    		
		                    <c:if test="${company.flag eq '1'}">、未审核</c:if>
		                    <c:if test="${company.flag eq '2'}">、已通过审核</c:if>
		                    <c:if test="${company.flag eq '3'}">、未通过审核</c:if>
			            </td>
			            <td>
			            	<c:set var ="mode" value="${company.workMode}"/>
             				${workModelMap[fn:trim(mode)]}
			            </td>
			            <td>
			            	<c:if test="${company.flag ne '2'}">
				            	<i class="glyphicon glyphicon-search"></i>&nbsp;产品详细
			            	</c:if>
			            	<c:if test="${company.flag eq '2'}">
				            	<a class="btn btn-info btn-sm" href="${ctx}/admin/company/product/${company.id}/${company.workMode}">
				            	<i class="glyphicon glyphicon-search"></i>&nbsp;产品详细</a>
			            	</c:if>
			            </td>
			            <td>
			            	<c:if test="${company.flag ne '2'}">
				            	<i class="glyphicon glyphicon-edit"></i>&nbsp;统计
			            	</c:if>
			            	<c:if test="${company.flag eq '2'}">
				            	<a class="btn btn-info btn-sm" href="${ctx}/admin/company/count/${company.id}/${company.workMode}">
				            	<i class="glyphicon glyphicon-edit"></i>&nbsp;统计</a>
			            	</c:if>
			            </td>
			            <td>
			            	<c:if test="${company.status eq '1'}">
			            		<a class="btn btn-info btn-sm" href="${ctx}/admin/company/update/${company.id}?oper=2">
			            		<i class="glyphicon glyphicon-edit"></i>&nbsp;启用</a>
			            	</c:if>
			            	<c:if test="${company.status eq '0'}">
			            		<c:if test="${company.flag eq '1' || company.flag eq '3'}">
				            	<a class="btn btn-info btn-sm" href="${ctx}/admin/company/update/${company.id}?oper=1">
				            	<i class="glyphicon glyphicon-edit"></i>&nbsp;审核</a>
				            	</c:if>
				            	<c:if test="${company.flag eq '2'}">
				            	<a class="btn btn-info btn-sm" href="${ctx}/admin/company/update/${company.id}?oper=2">
				            	<i class="glyphicon glyphicon-edit"></i>&nbsp;挂起</a>
				            	</c:if>
			            	</c:if>
			            </td>
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
                    <td></td>
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