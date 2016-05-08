<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>货物流向</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="importPlan" action="${ctx}/monitor/company/import/query" method="post">
			   	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${importPlan.startDate}"  class="form-control input-sm" />&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${importPlan.endDate}" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >ID号</th>
			    <th >货物名称</th>
			    <th >数量</th>
	            <th >启运国家</th>
	            <th >启运日期</th>
	            <th >拟到达口岸</th>
	            <th >到达口岸</th>
	            <th >到达日期</th>
	            <th >放行日期</th>
	            <th >运输方式</th>
	            <th >操作</th>
		    </tr>
	    </thead>
	    <tbody>
	    
		      <c:forEach var="plan" items="${pageView.records}">
			        <tr class="jymf_tr table_1_tr">
			            <td>${plan.planId}</td>
			            <td>${plan.proName}</td>
			            <td>${plan.proCount}</td>
			            <td>${plan.departCountry}</td>
			            <td>
			            	<fmt:formatDate value="${plan.departDate}" pattern="yyyy-MM-dd"/>
			            </td>
			            <td>${plan.arrivalPortPlan}</td>
			            <td>${plan.arrivalPort}</td>
			            <td><fmt:formatDate value="${plan.arrivalDate}" pattern="yyyy-MM-dd"/></td>
			            <td><fmt:formatDate value="${plan.releaseDate}" pattern="yyyy-MM-dd"/></td>
			            <td>
			            	<c:set var="type" value="${plan.shippingType}"></c:set>
			            	${shippingType[fn:trim(type)]}
			            </td>
			            <td align="center">
			                <a class="btn btn-info btn-sm" href="${ctx}/monitor/company/import/productInfo/${plan.id}">
			                	<i class="glyphicon glyphicon-search"></i>&nbsp;详细
			                </a>
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