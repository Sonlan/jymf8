<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<script type="text/javascript">
    $().ready(function() {
        $("#company-downfile").addClass("active");
    });
    
</script>
</head>

<body>
<form:form id="fenye" name="fenye" action="${ctx}/company/down/" method="post">
    <div style="height:50px">
        
    </div> 
    
    <table id="table_1" class="jymf_table table_border">
        <tr id="table_1_titlebar">
            <td class="jymf_td row_1" rowspan="1" colspan="1">序号</td>
            <td class="jymf_td row_6" rowspan="1" colspan="1">文件名称</td>
            <td class="jymf_td row_1" rowspan="1" colspan="1">操作</td>
           
        </tr>
        <c:set var="order" value="0"></c:set>
        <c:forEach var="list" items="${pageView.records}" >
        <tr class="jymf_tr table_1_tr">
            <td><c:set var="order" value="${order+1}"></c:set>${order}</td>
            <td>${list.fileName}</td>
            <td  align="center">
                <div class="small_btn">
                    <a class="linke" href="${ctx}/company/download/${list.tag}" >下 载</a>
                </div>
            </td>
        </tr>
        </c:forEach>
        <c:if test="${pageView.pageNum < pageView.pageSize}">
            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
                <tr class="jymf_tr table_1_tr">
                    <td></td>
                    <td></td>
                    <td></td>
                </tr> 
            </c:forEach> 
        </c:if>
    </table>
    <div><%@include file="../common/webfenye.jsp" %></div>
</form:form>
</body>
</html>