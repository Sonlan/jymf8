<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/jquery-validation/1.11.1/validate.css" /> 
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/messages_cn.js"></script>
<title>修改密码</title>
<script type="text/javascript">
$().ready(function() {
    $("#xiugaimima").addClass("active");

/** 表单验证    */
$("#pwdform").validate({
    rules: {
        oldPwd: {
            required:true,
            remote:"${ctx}/monitor/checkOldPwd"
        },
        newPwd:{
        	required:true
        },
        plainPwd:{
        	equalTo:"#newPwd"
        }
    },
    messages:{
    	oldPwd: {
            remote:"密码错误"
        },
        plainPwd:{
        	equalTo:"您两次输入的新密码不一致，请确认"
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
        <h2>修改密码</h2>
    </div>
    <div class="box-content">
   
		<form:form id="pwdform" name="pwdform" action="${ctx}/monitor/updatePwd" method="post" >
			 <table class="table">
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"></div>
				<div class="col-md-7">
					<span style="color:red;">温馨提示：密码修改成功后,将自动进入登陆页面！</span>
				</div>
			</div>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;">当前密码</label></div>
				<div class="col-md-7">
					<input class="form-control" type="password" name="oldPwd"/>
				</div>
			</div>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;">新密码</label></div>
				<div class="col-md-7">
					<input class="form-control" type="password" name="newPwd" id="newPwd" />
				</div>
			</div>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"></div>
				<div class="col-md-7">
					<span style="color:red;">区分大小写，只能使用字母、数字、特殊字符!</span>
				</div>
			</div>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;">确认新密码</label></div>
				<div class="col-md-7">
					<input class="form-control" type="password" name="plainPwd" />
				</div>
			</div>
			 <div class="col-md-9" ><br><br>
				<div class="col-md-6" align="right">
					<button class="btn btn-success col-md-offset-6 col-md-5" type="submit">保&nbsp;&nbsp;&nbsp;存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5"  type="button" onclick="history.back();" >取&nbsp;&nbsp;&nbsp;消</button>
				</div>
				<br><br><br>
			</div> 
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