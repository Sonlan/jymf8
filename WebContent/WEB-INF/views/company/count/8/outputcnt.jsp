<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>出库统计</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" action="${ctx}/company/count/queryOutPutCnt" method="post">
			   	<div class="form-group">
			      	<label>货物名称&nbsp;&nbsp;</label>
			        <input name="productName" type="text" class="form-control input-sm" value="${outPutCount.productName}"/>&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()"  value="${outPutCount.startDate}"/>
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()"  value="${outPutCount.endDate}"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >货物ID</th>
			    <th >货物HS编码</th>
			    <th >货物名称</th>
	            <th >销售区域</th>
	            <th >出库总量</th>
	            <th >查询总次数</th>
	            <th >消费总次数</th>
	            <th >窜货量</th>
		    </tr>
	    </thead>
	    <tbody>
		     <c:forEach var="product" items="${pageView.records}">
		        <tr>
		            <td>${outPutCnt.productId}</td>
		            <td>${outPutCnt.productName}</td>
		            <td>${outPutCnt.salesName}</td>
		            <td>${outPutCnt.outPutSum}</td>
		            <td>${outPutCnt.querySum}</td>
		            <td>${outPutCnt.consNum}</td>
		            <td>${outPutCnt.acNum}</td>
		            <td>${outPutCnt.acNum}</td>
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
		                    <td></td>
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
    </div><!--/span-->
    </div><!--/row-->
</body>
</html>