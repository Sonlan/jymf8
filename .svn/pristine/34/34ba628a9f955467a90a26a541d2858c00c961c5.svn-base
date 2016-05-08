<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<script>
$(function(){
    /** 新增按钮点击 */
	$("#addBtn").click(function() {
		$(location).attr('href', '${ctx}/admin/company/add');
	});
    
	/** 返回按钮点击 */
    $("#backBtn").click(function() {
        $(location).attr('href', '${ctx}/admin/monitor/main');
    });
	      
    $("#admin-monitor").addClass("active");
	
    /** 表单验证    */
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
        <h2>查看企业</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" action="${ctx}/admin/relation/query" method="post">
			   	<div class="form-group">
			   		<input type="hidden" name="monitorId" value="${monitor.monitorId}">
			      	<label>企业名称&nbsp;&nbsp;</label>
			        <input name="name" value="${monitor.name}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
				<button type="button" class="btn btn-default btn-sm" id ="backBtn"> <i class="glyphicon glyphicon-circle-arrow-left icon-white"></i>&nbsp;返 回</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >企业名称</th>
			    <th >组织代码</th>
	            <th >当前状态</th>
	            <th >操作</th>
		    </tr>
	    </thead>
	    <tbody>
		      <c:forEach var="monitor" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${monitor.name}</td>
            			<td>${monitor.companyId}</td>
		                <td>
			               <c:if test="${monitor.status eq '0'}">正常</c:if>
                    	   <c:if test="${monitor.status eq '1'}">挂起</c:if>
			            </td>
			            <td>
				            <c:if test="${monitor.status eq '0'}"> 
	                    		<div style="background-image:url('${ctx}/static/images/x_btn.png'); border:0px solid;width:50px;height:25px;text-align: center;line-height: 25px;">
	                    			<a style="color:hsl(0, 0%, 98%);"class="linke" href="${ctx}/admin/relation/updateStatus/${monitor.id}/${monitor.monitorId}/${pageView.pageNow}">挂起</a>
	                    	 	</div>
	                    	</c:if>
		                    <c:if test="${monitor.status eq '1'}">
		                    	<div style="background-image:url('${ctx}/static/images/x_hong_btn.png'); border:0px solid;width:50px;height:25px;text-align: center;line-height: 25px;">
		                    		<a class="linke" href="${ctx}/admin/relation/updateStatus/${monitor.id}/${monitor.monitorId}/${pageView.pageNow}">启用</a>
		                    	</div>
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