<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/admin/roles/add');
        });
    });
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>用户管理</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="admin" action="${ctx}/admin/roles/main" method="post">
			   	<div class="form-group">
			      	<label>用户姓名&nbsp;&nbsp;</label>
			        <input name="name" value="${admin.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
				<button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>			
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >用户ID</th>
			    <th >用户帐号</th>
	            <th >姓名</th>
	            <th >电话</th>
	            <th >邮箱</th>
	            <th >角色</th>
	            <th >状态</th>
	            <th >修改</th>
	            <th >密码初始化</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="user" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${user.id}</td>
			            <td>${user.account}</td>
			            <td>
			            	${user.name}
			            </td>
			            <td>
			            	${user.telephone}
			            </td>
			            <td>
			                ${user.mail}
			            </td>
			            <td>
		                	<c:if test="${user.role==0}">超级管理员</c:if>
		                	<c:if test="${user.role==1}">高级管理员</c:if>
		                	<c:if test="${user.role==2}">普通管理员</c:if>
		                </td>
		                <td>
		                	<c:if test="${user.status==0}">正常</c:if>
		                	<c:if test="${user.status==1}">禁用</c:if>
		                </td>
			            <td>
			            	<a class="btn btn-info btn-sm" href="${ctx}/admin/roles/edit/${user.id}">
			            	<i class="glyphicon glyphicon-edit"></i>&nbsp;修改资料</a>
			            </td>
			            <td>
			            	<a class="btn btn-info btn-sm" href="${ctx}/admin/roles/initPwd/${user.id}">
			            	<i class="glyphicon glyphicon-edit"></i>&nbsp;初始化</a>
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