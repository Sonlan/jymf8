<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/admin/equipment/add');
        });
    });
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>设备管理</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="equipment" action="${ctx}/admin/equipment/query" method="post">
			   	<div class="form-group">
			      	<label>企业名称&nbsp;&nbsp;</label>
			        <input name="name" value="${equipment.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>设备号&nbsp;&nbsp;</label>
			        <input name="id" value="${equipment.id}" type="text" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
				<button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >设备号</th>
			    <th >所属企业</th>
	            <th >企业ID</th>
	           <!--  <th >商户名称</th>
	            <th >商户ID</th> -->
	            <th >追溯模式</th>
	            <th >当前状态</th>
	            <th >操作</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		     <c:forEach var="equip" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${equip.id}</td>
			            <td>${equip.name}</td>
			            <td>
			            	${equip.companyId}
			            </td>
			            <%-- <td>
			            	${equip.productName}
			            </td>
			            <td>
			            	${equip.productId}
			            </td> --%>
			            <td>
			                <c:if test="${equip.devStatus eq '0'}">挂起</c:if>
			                <c:if test="${equip.devStatus eq '1'}">启用</c:if>
			                <c:if test="${equip.devStatus eq '2'}">作废</c:if>
			            </td>
			            <td>
			            	<c:set var ="mode" value="${equip.workMode}"/>
							${workModelMap[fn:trim(mode)]}
			            </td>
			            <td>
			            	<a class="btn btn-info btn-sm" href="${ctx}/admin/equipment/update/${equip.id}">
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
                    <!-- <td></td>
                    <td></td> -->
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