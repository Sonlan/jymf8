<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script>
$(document).ready(function(){
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
        <h2>手持设备管理</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="equipment" action="${ctx}/company/equipment/query" method="post">
			   	<div class="form-group">
			      	<label>设备号&nbsp;&nbsp;</label>
			        <input name="id"  value="${equipment.id}"class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			   <td>设备号</td>
	            <c:if test="${equipment.workMode eq 2 }">
		            <td >商户名称</td>
		            <td >商户ID</td>
	            </c:if>
	            <td >领用信息</td>
	            <c:if test="${fn:contains(sessionScope.authority,'010202')}">
	            <td >操作</td>
	            </c:if>
			</tr>
	    </thead>
	    <tbody>
	    	 <c:forEach var="equip" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${equip.id}</td>
			            <td class="row_3">
			                <div class="td_name_1">
			                    <a title="${equip.devInfo}">${equip.devInfo}</a>
			                </div>
			            </td>
			            <c:if test="${fn:contains(sessionScope.authority,'010202')}">
			            <td align="center">
			                <div class="small_btn">
			                    <a class="linke" href="${ctx}/company/equipment/update/${equip.id}" id="editLink-${equip.id}">修改</a>
			                </div>
			            </td>
			            </c:if>
			        </tr>
			  </c:forEach>
      
        <c:if test="${pageView.pageNum < pageView.pageSize }">
            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
                <tr class="jymf_tr table_1_tr">
                    <td>&nbsp;</td>
                    <c:if test="${equipment.workMode eq 2 }">
	                    <td></td>
	                    <td></td>
                    </c:if>
                    <td></td>
                    <c:if test="${fn:contains(sessionScope.authority,'010202')}">
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