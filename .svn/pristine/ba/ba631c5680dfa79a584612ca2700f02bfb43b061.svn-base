<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<html>
<head>
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/company/product/add');
        });
        $("#fenye").validate({
            rules: {
                id: {
                    digits:true
                }
            }
        });
    });
</script>
</head>
<body>
	<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>货物信息</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" action="${ctx}/company/product/query" method="post">
			   	<div class="form-group">
			      	<label>货物名称&nbsp;&nbsp;</label>
			        <input name="name" type="text" class="form-control input-sm" value="${product.name}"/>&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>HS编码&nbsp;&nbsp;</label>
			        <input name="hsnum" type="text" class="form-control input-sm" value="${product.hsnum}"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
                <c:if test="${fn:contains(sessionScope.authority,'020102')}">
                    <button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>
                </c:if>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >货物ID</th>
	            <th >HS编码</th>
	            <th >货物名称</th>
	            <th >生产商</th>
	            <th >激活数量</th>
	            <th >创建日期</th>
	            <th >更新日期</th>
	            <c:if test="${fn:contains(sessionScope.authority,'020103')}">
	            	<th >操作</th>
	            </c:if>
		    </tr>
	    </thead>
	    <tbody>
		     <c:forEach var="product" items="${pageView.records}">
		        <tr>
		            <td>${product.id}</td>
		            <td>${product.hsnum}</td>
		            <td>${product.name}</td>
		            <td>${product.producer}</td>
		            <td>${product.labelCnt}</td>
		            <td><fmt:formatDate value="${product.createDate}" type="both" pattern="yyyy/MM/dd"/></td>
		            <td><fmt:formatDate value="${product.updateDate}" type="both" pattern="yyyy/MM/dd"/></td>
		            <c:if test="${fn:contains(sessionScope.authority,'020103')}">
		            <td  align="center">
                        <a  class="btn btn-info btn-sm" href="${ctx}/company/product/update/${product.id}" 
                           id="editLink-${product.id}"> <i class="glyphicon glyphicon-edit icon-white"></i>&nbsp;修改</a>
		            </td>
		            </c:if>
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
		                    <c:if test="${fn:contains(sessionScope.authority,'020103')}">
		                    	<td></td>
		                    </c:if>
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
    </div> <!--/span-->
    </div><!--/row-->
</body>
<script type="text/javascript">
parent.$('html,body').animate({scrollTop: '30px'}, 800);
</script>
</html>