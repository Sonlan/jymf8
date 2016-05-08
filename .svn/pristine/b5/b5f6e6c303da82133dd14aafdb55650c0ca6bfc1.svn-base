<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta name="renderer" content="webkit">
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/> 
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<title>管理员用户修改 </title>
<script type="text/javascript">
$(document).ready(function(){
    $("#admin-roles").addClass("active");
    /** 表单验证    */
    $("#addForm").validate({
        rules: {
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
        }
    });
});

</script>

</head>
<body>
<%-- <div class="main_div" style="margin-left:200px;">
<form:form id="addForm" modelAttribute="admin" action="${ctx}/admin/roles/edit" method="post">
	<input type="hidden" name="id" value="${admin.id}">
    <div class="add_top">
        <div class="head_describe">管理员用户修改</div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="80px">用&nbsp;户&nbsp;帐&nbsp;号</td>
                <td width="465px">
                	<input type="text" maxlength="80" class="text readonly" name="account" readonly="readonly" value="${admin.account}"/>
                </td>
                <td >角&nbsp;色&nbsp;设&nbsp;置</td>
                <td width="465px">        
                    <form:select path="role" class="select" items="${roleMap}" value="${admin.role}" />
                </td>
            </tr>
            <tr>
                <td >用&nbsp;户&nbsp;姓&nbsp;名</td>
                <td width="465px">        
                    <input type="text" maxlength="100" class="text" name="name" value="${admin.name}"/>
                    <span class="must">*</span>
                </td>
                <td>电&nbsp;&nbsp;话</td>
                <td>
                    <input type="text" maxlength="40" class="text" name="telephone" value="${admin.telephone}"/>
                    <span class="must">*</span>
                </td>
               
            </tr>
            <tr>
                <td>邮&nbsp;&nbsp;箱</td>
                <td>
                    <input type="text" maxlength="40" class="text" name="mail" value="${admin.mail}"/>
                    <span class="must">*</span>
                </td>
                <td>帐&nbsp;号&nbsp;状&nbsp;态&nbsp;</td>
                <td> 
                	<form:select path="status" class="select" items="${statusMap}" value="${admin.status}" />
                </td>
            </tr>
           
        </table>
    </div>
    <br><br><br><br><br>
     <div class="add_btn">
        <table>
            <tr>
                <td><input class="ok_button" type="submit" value=""/></td>
                <td>
                    <input class="cancer_btn" type="button" value="" 
                           onclick="javascript:window.location.href='javascript:history.go(-1)'"/>
                </td>
            </tr>    
        </table>
    </div>
    </form:form>
</div> --%>

<div id="contentDiv" ></div>
	<div class="row">
	    <div class="box col-md-12">
		    <div class="box-inner">
			    <div class="box-header well" data-original-title="">
			        <h2>管理员用户修改</h2>
			    </div>
			    <div class="box-content">
			    	<form:form id="addForm" modelAttribute="admin" action="${ctx}/admin/roles/edit" method="post">
			    	<input type="hidden" name="id" value="${admin.id}">
						<table class="table">
    					<tr><td style="border:0px solid ">
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">用&nbsp;户&nbsp;帐&nbsp;号</label></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="80" class="form-control" name="account" value="${admin.account}" readonly /></div>
							<div class="col-md-2" align="right"><label style="padding:5px;">角&nbsp;色&nbsp;设&nbsp;置</label></div>
							<div class="col-md-4"> <form:select path="role" style="width:87%" value="${admin.role}" class="form-control" items="${roleMap}" /></div>
						</div>
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">用&nbsp;户&nbsp;姓&nbsp;名</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="100" class="form-control" name="name" value="${admin.name}"/></div>
							<div class="col-md-2" align="right"><label style="padding:5px;">电&nbsp;&nbsp;&nbsp;话</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="40" class="form-control" name="telephone" value="${admin.telephone}"/></div>
						</div>
			    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">邮&nbsp;&nbsp;&nbsp;箱</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input style="width:87%" class="form-control" name="mail" type="text" value="${admin.mail}"/></div>
							<div class="col-md-2" align="right"><label style="padding:5px;">帐&nbsp;号&nbsp;状&nbsp;态</label></div>
							<div class="col-md-4"><form:select path="status" style="width:87%" class="form-control" items="${statusMap}" value="${admin.status}" /></div>
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