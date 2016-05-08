<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/admin/monitor/add');
        });
    });
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>监管部门</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="monitor" action="${ctx}/admin/monitor/query" method="post">
			   	<div class="form-group">
			      	<label>部门名称&nbsp;&nbsp;</label>
			        <input name="name" value="${monitor.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>组织代码&nbsp;&nbsp;</label>
			        <input name="id" value="${monitor.id}" type="text" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
				<button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >监管部门</th>
			    <th >监管账户</th>
	            <th >组织代码</th>
	            <th >当前状态</th>
	            <th >监管企业</th>
	            <th >操作</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		     <c:forEach var="monitor" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${monitor.name}</td>
			            <td>${monitor.account}</td>
			            <td>
			            	${monitor.id}
			            </td>
			            <td>
			            	<c:if test="${monitor.status eq '0'}">正常</c:if>
               				<c:if test="${monitor.status eq '1'}">挂起</c:if>
			            </td>
			            <td>
			            	<a class="btn btn-info btn-sm" href="${ctx}/admin/relation/view/${monitor.id}/${pageView.pageNow}">
			            	<i class="glyphicon glyphicon-search"></i>&nbsp;查看企业</a>
			            </td>
			            <td>
			            	<a class="btn btn-info btn-sm" href="${ctx}/admin/monitor/update/${monitor.id}">
			            	<i class="glyphicon glyphicon-edit"></i>&nbsp;修改</a>
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