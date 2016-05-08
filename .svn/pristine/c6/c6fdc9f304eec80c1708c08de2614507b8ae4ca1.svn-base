<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@ include file="../common.jsp" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>企业信息修改 </title>
<script type="text/javascript">
$().ready(function() {
    $("#company-update").addClass("active");
});
</script>
</head>
<body>

<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>
        	<c:if test="${company.workMode ne '2'}"><label>企业信息</label></c:if>
		    <c:if test="${company.workMode eq '2'}"><label>商城基本信息</label></c:if>
		</h2>
    </div>
    <div class="box-content">
		<table class="table">
			<tr><td style="border:0 solid">
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业名称</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" name="name" value="${company.name}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">组织机构代码</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" name="licenseNum" value="${company.licenseNum}"/></div>
			</div>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业主页</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" name="url" value="${company.url}"/></div>
				
			</div>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业描述</label></div>
				<div  class="col-md-10"><textarea class="textare" style="width:100%;background-color: #EEEEEE" readonly="readonly" rows="5" class="form-control" name="depict.depicts">${company.depict.depicts}</textarea></div>
			</div>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<c:if test="${company.tel ne null && company.tel ne ''}">
					<div class="col-md-2" align="right"><label style="padding:5px;">举报电话</label></div>
					<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" name="tel" value="${company.tel}"/></div>
	        	</c:if>  
			</div>
	        <div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"> <label style="padding:5px;">企业图片</label></div>
				<c:set var="no_img" value="-1" /> 
		        <c:forEach var="imgf" items="${company.comImgs}">
		             <div class="col-md-3" >
			             <c:set var="no_img" value="${no_img+1}" /> 
			             <img id="img${no_img}" name="imgs" width="<%=Constants.PHOTO_IMG_WIDTH %>px"
			              	  <c:if test="${imgf.fileName=='' || imgf.fileName==null}">src="${ctx}/static/images/no_pic.png"</c:if>
			              	  <c:if test="${imgf.fileName!='' && imgf.fileName!=null}">src="${imgf.fileName}"</c:if>
			                    style="margin-top:25px;margin-left:35px;" />
			         </div> 
		        </c:forEach>  
			</div>  
			</td></tr>
		</table>
	
	</div>
</div>
</div>
</div>	
</body>
</html>