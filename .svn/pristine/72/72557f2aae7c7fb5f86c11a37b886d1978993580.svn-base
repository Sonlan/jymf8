<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/admin/product/add');
        });
        
        $("#backBtn").click(function() {
            $(location).attr('href', '${ctx}/admin/company/main');
        });
    });
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>产品详细</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" action="${ctx}/admin/product/query" method="post">
			   	<div class="form-group">
			      	<label>产品名称&nbsp;&nbsp;</label>
			        <input name="name" value="${product.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>
			  	<div class="form-group">
			      	<label>产品ID&nbsp;&nbsp;</label>
			        <input name="id" value="${product.id}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
				<button type="button" class="btn btn-default btn-sm" id ="backBtn"> <i class="glyphicon glyphicon-circle-arrow-left icon-white"></i>&nbsp;返 回</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >产品名称</th>
			    <th >产品ID</th>
	            <th >生产商</th>
	            <th >激活数量</th>
	            <th >创建时间</th>
	            <th >最终更新时间</th>
<!-- 	            <th >状态</th>
 -->		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="product" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${product.name}</td>
            			<td>${product.id}</td>
			            <td>
			            	${product.producer}
			            </td>
			            <td>
			            	${product.labelCnt}
			            </td>
			            <td><fmt:formatDate value="${product.createDate}" type="both" pattern="yyyy/MM/dd"/></td>
            			<td><fmt:formatDate value="${product.updateDate}" type="both" pattern="yyyy/MM/dd"/></td>
		                <%-- <td>
			                <c:if test="${product.status ne '1'}">未审核</c:if>
			                <c:if test="${product.status eq '1'}">审核通过</c:if>
			            </td> --%>
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
                    <!-- <td></td> -->
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