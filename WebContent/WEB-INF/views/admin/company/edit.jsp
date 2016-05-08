<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@include file="../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<title>企业状态修改 </title>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/jquery-validation/1.11.1/validate.css" /> 
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/messages_cn.js"></script>
<link href="${ctx}/static/css/errormessage.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
$().ready(function() {
    /** 取消按钮点击 */
    $("#btnCancel").click(function() {
        $(location).attr('href', '${ctx}/admin/company/main');
    });
    $("#btnSave").click(function() {
    	var op = ${oper};
    	if(op == 1){
    		$("#editform").attr("action","${ctx}/admin/company/audit");
    	}else if(op == 2){
    		$("#editform").attr("action","${ctx}/admin/company/update");
    	}
    		
    	$("#editform").submit();
    });
    /** 表单验证    */
    $("#editform").validate({
        rules: {
            url: {
                url:true
            }
        }
    });
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

		<form:form id="editform" modelAttribute="company" method="post">
		    <table class="table">
		    <tr><td style="border:0px solid ">
		    <input type="hidden" name="id" value="${company.id}"/>
		    <input type="hidden" name="workMode" value="${company.workMode}"/>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业名称</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${company.name}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">组织机构代码</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${company.licenseNum}"/></div>
			</div>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业地址</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${company.address}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">联系电话</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${company.tel}"/></div>
			</div>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业主页</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${company.url}"/></div>
				
			</div>
			<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业描述</label></div>
				<div  class="col-md-10"><textarea class="textare" style="width:100%;border:1px solid #CCCCCC" rows="5" class="form-control" readonly="readonly">${company.depict.depicts}</textarea></div>
			</div>
	        <div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">企业图片</label></div>
			</div>  
			
			<div class="col-md-12  form-group"  >
		   		 <div class="col-md-2" ></div>
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
			
			<div class="col-md-10  form-group"  >
				<c:if test="${oper == 2}">
		   		<div class="col-md-2" align="right"><label>当前状态</label></div>
				<div class="col-md-1">
					<form:select path="status" class="select" items="${statusMap}" value="${company.status}"/>
				</div>
				</c:if>
				<c:if test="${oper == 1}">
				<div class="col-md-2" align="right"><label>审核状态</label></div>
				<div class="col-md-1">
					<input type="hidden" name="oldAuditFlag" value="${company.flag}" />
					<form:select path="flag" style="width:100px;"class="form-control" items="${flagMap}" value="${company.flag}"/>
				</div>
				<div class="col-md-2" align="right"><label>有限日期</label></div>
				<div class="col-md-2">
				<div class="input-group"><input type="text" class="form-control" name="auditValid" 
                           value="${company.auditValid}" maxlength="3"/><span class="input-group-addon">(年)</span></div>
                           </div>
                 </c:if>
			</div>
			
	        <div class="col-md-12" ><br><br><br>
				<div class="col-md-6" align="right">
					<button class="btn btn-success col-md-offset-6 col-md-5" id="btnSave" type="button">保&nbsp;&nbsp;&nbsp;存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5"  type="button" id="btnCancel">取&nbsp;&nbsp;&nbsp;消</button>
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

</body>
</html>