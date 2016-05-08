<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/admin/labelIndex/add');
        });
    });
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>标签卷</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" action="${ctx}/admin/labelIndex/query" method="post">
			   	<div class="form-group">
			      	<label>企业名称&nbsp;&nbsp;</label>
			        <input name="name" value="${labelIndex.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
				<button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >所属企业</th>
			    <th >企业ID</th>
	            <th >起始标签号</th>
	            <th >结束标签号</th>
	            <th >标签个数</th>
	            <th >追溯模式</th>
	            <th >当前状态</th>
			    <th >创建日期</th>
	            <th >操作</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="labelIndex" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${labelIndex.name}</td>
			            <td>${labelIndex.companyId}</td>
			            <td>
			            	${labelIndex.startTid}
			            </td>
			            <td>${labelIndex.endTid}</td>
			            <td>${labelIndex.count}</td>
			            <td>
			            	<c:set var ="mode" value="${labelIndex.workMode }"/>
							${workModelMap[fn:trim(mode)]}
			            </td>
			            <td>
			                <c:if test="${labelIndex.status eq '0'}"><font color="red">无效</font></c:if>
                			<c:if test="${labelIndex.status eq '1'}">有效</c:if>
			            </td>
			            <td><fmt:formatDate value="${labelIndex.createDate}" type="both" pattern="yyyy/MM/dd HH:mm:ss"/></td>
			            <td>
			            	<a class="btn btn-info btn-sm" href="${ctx}/admin/labelIndex/update/${labelIndex.id}">
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