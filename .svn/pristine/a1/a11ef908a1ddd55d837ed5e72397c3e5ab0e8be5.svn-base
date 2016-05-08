<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	function downloadExcel(){
		var url = "${ctx}/monitor/count/excelHs"
		$("#fenye").attr("action",url).submit();
	}
	function querySubmit () {
		$("#fenye").attr("action","${ctx}/monitor/count/queryHs").submit();
	}
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12" >
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2 id="title_h2">HS分类统计</h2>
    </div>
    <div class="box-content">
   		<div class="alert alert-info" style="padding:5px;margin-bottom:5px;">
			<form:form id="fenye" class="form-inline" action="${ctx}/monitor/count/queryHs" method="post">
			   	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${count.startDate}"  class="form-control input-sm" />&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${count.endDate}" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm" onclick="querySubmit()"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
                <button type="submit" class="btn btn-primary btn-sm pull-right" onclick="downloadExcel()"> <i class="glyphicon glyphicon-download"></i>&nbsp;导出EXCEL</button>
			</form:form>
		</div>
   		<table id="fenye" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
	            <th >HS编码</th>
	            <th >HS编码名称</th>
	            <th >标识使用量</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="r" items="${pageView.records}">
	        <tr >
	            <td>${r.hsnum}</td>
	            <td>${r.hsname}</td>
	            <td>${r.hscount}</td>
	        </tr>
	        </c:forEach>
	        <c:if test="${pageView.pageNum < pageView.pageSize }">
	            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
	                <tr >
	                    <td>&nbsp;</td>
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
</div>	
</body>
</html>