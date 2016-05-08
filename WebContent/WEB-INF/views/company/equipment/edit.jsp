<%@ page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>

<title>设备管理更新页面</title>
<script>
    $(document).ready(function() {
        $("#editForm").validate({
            rules: {
            	devInfo: {
                    byteMaxLength:160
                }
            }
        });
    });
</script>
</head>
<body>

<div class="col-md-12">
<div class="col-md-1"></div>
<div class="col-md-10" >
<div class="row">
    <div class="box col-md-12" style="height:500px;">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>手持设备信息更新</h2>
    </div>
    <div class="box-content">
   
		<form:form id="editForm" modelAttribute="equipment" action="${ctx}/company/equipment/update" method="post" >
		 <table class="table">
		 	<tr><td style="border:0px solid">
			 <input id="productId" type="hidden" name="productId" value="${equipment.productId}" />
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"  align="right"><label style="padding:5px;">设备编号</label></div>
				<div class="col-md-7">
					<input class="form-control " readonly="readonly" type="text" name="id" value="${equipment.id}"/>
				</div>
			</div>
			<div class="col-md-10 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2"  align="right"><label style="padding:5px;">所属企业</label></div>
				<div class="col-md-7">
					<input class="form-control " readonly="readonly" type="text" name="name" value="${equipment.name}" />
				</div>
			</div>
			
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"  align="right"><label style="padding:5px;">领用信息</label></div>
				<div class="col-md-7">
					<textarea class="product_textare" style="width:100%;" rows="4" name="devInfo">${equipment.devInfo}</textarea>
				</div>
			</div>
			 <div class="col-md-9" ><br><br><br>
				<div class="col-md-6" align="right">
					<button class="btn btn-success col-md-offset-6 col-md-5" type="submit">保&nbsp;&nbsp;&nbsp;存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5"  type="button" onclick="history.back();" >取&nbsp;&nbsp;&nbsp;消</button>
				</div>
				<br><br><br>
			</div> 
			</td></tr>
			</table>
		</form:form>
	
	</div>
</div>
</div>
</div>	
</div>
</div>


</body>
</html>