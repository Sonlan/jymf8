<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="renderer" content="webkit">
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<title>管理员用户添加 </title>
<script type="text/javascript">
$(document).ready(function(){
    $("#admin-roles").addClass("active");
    /** 表单验证    */
    $("#addForm").validate({
        rules: {
        	account: {
                required:true,
                idFormat:true,
                remote:"${ctx}/admin/roles/checkAccountAdd"
            },
            name: {
            	required:true
            },
            telephone: {
            	required:true,
            	isPhone:true
            },
            mail: {
            	required:true,
            	email:true 
            },
        },
        messages : {
        	account : {
				remote : "名称重复!"
			}
		} 
    });
});
</script>
</head>
<body>
	<div id="contentDiv" ></div>
	<div class="row">
	    <div class="box col-md-12">
		    <div class="box-inner">
			    <div class="box-header well" data-original-title="">
			        <h2>管理员用户添加</h2>
			    </div>
			    <div class="box-content">
			    	<form:form id="addForm" modelAttribute="admin" action="${ctx}/admin/roles/add" method="post">
						<table class="table">
    					<tr><td style="border:0px solid ">
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">用&nbsp;户&nbsp;帐&nbsp;号</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="80" class="form-control" name="account" /></div>
							<div class="col-md-2" align="right"><label style="padding:5px;">角&nbsp;色&nbsp;设&nbsp;置</label></div>
							<div class="col-md-4"> <form:select path="role" style="width:87%" class="form-control" items="${roleMap}" /></div>
						</div>
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">用&nbsp;户&nbsp;姓&nbsp;名</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="100" class="form-control" name="name" /></div>
							<div class="col-md-2" align="right"><label style="padding:5px;">电&nbsp;&nbsp;&nbsp;话</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="40" class="form-control" name="telephone" /></div>
						</div>
			    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">邮&nbsp;&nbsp;&nbsp;箱</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input style="width:87%" class="form-control" name="mail" type="text"/></div>
						</div>
						<div class="col-md-12 form-group ">
							<div class="col-md-6" >
								<button class="btn btn-success col-md-offset-6 col-md-5" type="submit">确&nbsp;&nbsp;&nbsp;定</button>
							</div>
							<div class="col-md-6">
								<button class="btn btn-default col-md-5" type="button" 
			                           onclick="javascript:window.location.href='javascript:history.go(-1)'">取&nbsp;&nbsp;&nbsp;消</button>
							</div>					
					 </div>
					 	</td></tr>
					</table>
					</form:form>
			    </div>
		    </div>
	    </div>
    </div>
</body>
</html>