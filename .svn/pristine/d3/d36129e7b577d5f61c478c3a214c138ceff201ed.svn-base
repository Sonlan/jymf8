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
        <h2>日志</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="logs" action="${ctx}/admin/logs/query" method="post">
			   	<div class="form-group">
			      	<label>用户ID&nbsp;&nbsp;</label>
			        <input name="userId" value="${logs.userId}" class="form-control input-sm"/>&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>事件&nbsp;&nbsp;</label>
			        <input name="event" value="${logs.event}" type="text" class="form-control input-sm"/>
			  	</div>
			  	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${logs.startDate}"  class="form-control input-sm" />&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${logs.endDate}" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >记录ID</th>
			    <th >用户ID</th>
	            <th >操作事件</th>
	            <th >描述信息</th>
	            <th >公司名称</th>
	            <th >时间</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="logs" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${logs.id}</td>
			            <td>${logs.userId}</td>
			            <td>
			            	${logs.event}
			            </td>
			            <td>
			            	${logs.description}
			            </td>
			            <td>
			                ${logs.companyName}
			            </td>
			            <td>
			            	<fmt:formatDate value="${logs.createTime}" type="both" pattern="yyyy/MM/dd"/>
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