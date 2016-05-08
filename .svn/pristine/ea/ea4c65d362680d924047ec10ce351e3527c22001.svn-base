<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script>
    $().ready(function() {
        $("#addBtn").click(function() {
            $(location).attr('href', '${ctx}/company/user/add');
        });
    });
    
</script>
</head>
<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>用户配置</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye"  class="form-inline" name="fenye" action="${ctx}/company/user/query" method="post">
			   	<div class="form-group">
			      	<label>用户ID&nbsp;&nbsp;</label>
			        <input  name="searchId" type="text" class="form-control input-sm" value="${user.searchId}"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
                <c:if test="${fn:contains(sessionScope.authority,'010302')}">
                <button type="button" class="btn btn-default btn-sm" id ="addBtn"> <i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;新 增</button>
				</c:if>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >用户名</th>
	            <th >组织机构代码</th>
	            <th >创建日期</th>
	            <th >状态</th>
	            <th >密码</th>
	            <c:if test="${fn:contains(sessionScope.authority,'010303')}">
	            <th >操作</th>
	            </c:if>
		    </tr>
	    </thead>
	    <tbody>
		     <c:forEach var="user" items="${pageView.records}">
		        <tr>
		            <td>${user.id}</td>
		            <td>${user.license}</td>
		            <td><fmt:formatDate value="${user.createDate}" type="both" pattern="yyyy/MM/dd"/> </td>
		            <td>
		                <c:if test="${user.status eq '0'}">启用</c:if>
		                <c:if test="${user.status eq '1'}"><font color="red">禁用</font> </c:if>
		            </td>
		            <td align="center">
		                <div class="small_btn">
		                    <a class="linke" href="${ctx}/company/user/initPwd/${user.id}" id="editLinkPwd-${user.id}">初始设置</a>
		                </div>
		            </td>
		            <c:if test="${fn:contains(sessionScope.authority,'010303')}">
		            <td align="center">
		                <div class="small_btn">
		                    <a class="linke" href="${ctx}/company/user/update/${user.id}" id="editLink-${user.id}">修改</a>
		                </div>
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
		                    <c:if test="${fn:contains(sessionScope.authority,'010303')}">
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