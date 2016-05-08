<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../common.jsp" %>
<html>
<head>
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/static/css/errormessage.css" type="text/css" rel="stylesheet"/>
<title>标签卷添加页面</title>
<script>
$(document).ready(function() {
    $("#admin-label").addClass("active");

    /** 表单验证    */
    $("#addform").validate({
        rules: {
        	startTid: {
                required:true,
                digits:true,
                minlength:16,
                remote: "${ctx}/admin/labelIndex/startChk"
            },
            endTid: {
                required:true,
                digits:true,
                minlength:16,
                remote: "${ctx}/admin/labelIndex/endChk"
            },	
            name:{
            	required:true
            }
        },
        messages:{
        	startTid: {
        		digits:"请输入16位有效追溯凭证码",
                minlength:"请输入16位有效追溯凭证码",
                remote:"起始标签有错误，请重新输入"
            },
            endTid: {
            	digits:"请输入16位有效追溯凭证码",
                minlength:"请输入16位有效追溯凭证码",
                remote:"结束标签有错误，请重新输入"
            }
        }
    });
});
//显示遮罩层
function showdiv() { 
    parent.$("#bg").toggle();
	parent.$("#show").removeAttr("class").addClass("showCompany");
	parent.$("#show").toggle();
	parent.document.getElementById("ifm_cp").src="${ctx}/admin/dialog/querySelect";
}
//隐藏遮罩层
function hidediv() {
	parent.$("#bg").toggle();
	parent.$("#show").toggle();
}

function setCompany(id,name){
    $("#companyId").attr("value",id);
    $("#companyName").attr("value",name);
}
</script>
</head>
<body>
	<div id="contentDiv" ></div>
	<div class="row">
	    <div class="box col-md-12">
		    <div class="box-inner">
			    <div class="box-header well" data-original-title="">
			        <h2>标签卷添加页面</h2>
			    </div>
			    <div class="box-content">
			    	<form:form id="addform" modelAttribute="labelIndex" action="${ctx}/admin/labelIndex/add" method="post">
					<input id="companyId" type="hidden" name="companyId" value="${labelIndex.companyId}"/>
						<c:if test="${not empty message}">
							<div id="message" class="alert alert-error">${message}</div>
						</c:if>
						<table class="table">
    					<tr><td style="border:0px solid ">
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">起&nbsp;始&nbsp;标&nbsp;签</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="16" class="form-control" name="startTid" value="${labelIndex.startTid}"/></div>
						</div>
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">结&nbsp;束&nbsp;标&nbsp;签</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input type="text" style="width:87%" maxlength="16" class="form-control" name="endTid" value="${labelIndex.endTid}"/></div>
						</div>
			    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">所&nbsp;属&nbsp;企&nbsp;业</label><span style="color:red" >*</span></div>
							<div class="col-md-4"><input style="width:87%" id="companyName" class="form-control" name="name" type="text" value="${labelIndex.name}" readonly/></div>
							<div class="col-md-4">
								<button id="imgFile3" name="summFiles" type="button" class="btn btn-primary btn-sm" onclick="showdiv();">
			                    	<i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;选 &nbsp;择
			                    </button>
							</div>
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
			    <!-- 遮罩层 -->
					<!-- <div id="bg" class="bg" style="display: none"></div>
					<div id="showCompany" class="showCompany" style="display: none"> 
					    <div class="show_top"><input type="button" onclick="hidediv();" value=""/></div>
					    <iframe id="ifm_ID" width="100%" height="85%" frameborder="no" scrolling="no" ></iframe>
					</div> -->
		    </div>
	    </div>
    </div>

</body>
</html>