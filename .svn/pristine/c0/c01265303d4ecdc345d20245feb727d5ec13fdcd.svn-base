<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${ctx}/static/css/zhezhao.css" type="text/css"
	rel="stylesheet" />
<link href="${ctx}/static/css/errormessage.css" type="text/css"
	rel="stylesheet" />

<title>设备管理更新页面</title>
<script>
	$(document).ready(function() {
		$("#admin-equipment").addClass("active");
		/** 表单验证    */
		$("#editForm").validate({
			rules : {
				id : {
					required : true,
					digits : true
				},
				name : {
					required : true
				}
			}
		});
		
	   if ($("#workMode").val() == 2) {
            document.getElementById("product").style.display = "block";
        } else {
            document.getElementById("product").style.display = "none";
        }
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
	    
	function setCompany(id, name, workMode) {
		$("#companyId").attr("value", id);
		$("#companyName").attr("value", name);
		$("#workMode").attr("value", workMode);
		
		if (workMode == 2) {
			document.getElementById("product").style.display = "block";
		} else {
			document.getElementById("product").style.display = "none";
		}
	}
	//显示遮罩层-商户
	function showProduct() {
		document.getElementById("bg").style.display = "block";
		document.getElementById("showCompany").style.display = "block";
		var companyId = $('#companyId').val();
		document.getElementById("ifm_ID").src = '${ctx}/admin/dialog/selectProduct/'
				+ companyId;
	}


	function setProduct(productId,name) {
		$("#productId").attr("value", productId);
		$("#productName").attr("value", name);
	}
</script>
</head>
<body>
<div id="contentDiv" ></div>
	<div class="row">
	    <div class="box col-md-12">
		    <div class="box-inner">
			    <div class="box-header well" data-original-title="">
			        <h2>设备管理更新页面</h2>
			    </div>
			    <div class="box-content">
			    	<form:form id="editForm" modelAttribute="equipment" action="${ctx}/admin/equipment/update" method="post">
						<input id="companyId" type="hidden" name="companyId" value="${equipment.companyId}" />
						<input id="workMode" type="hidden" name="workMode" value="${equipment.workMode}" />
						<input id="productId" type="hidden" name="productId" value="${equipment.productId}" />
						<c:if test="${not empty message}">
							<div id="message" class="alert alert-error">${message}</div>
						</c:if>
						<table class="table">
    					<tr><td style="border:0px solid ">
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">设&nbsp;备&nbsp;编&nbsp;号</label></div>
							<div class="col-md-4"><input type="text" style="width:87%" class="form-control text readonly" readonly name="id" value="${equipment.id}"/></div>
						</div>
			    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">所&nbsp;属&nbsp;企&nbsp;业</label></div>
							<div class="col-md-4"><input style="width:87%" id="companyName" class="form-control" name="name" type="text" value="${equipment.name}" readonly/></div>
							<div class="col-md-4">
								<button id="imgFile3" name="summFiles" type="button" class="btn btn-primary btn-sm" onclick="showdiv();">
			                    	<i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;选 &nbsp;择
			                    </button>
							</div>
						</div>
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">操&nbsp;做&nbsp;权&nbsp;限</label></div>
							<div class="col-md-4"><form:select path="limit" style="width:87%" class="form-control" items="${limitMap}" /></div>
						</div>
						<div class="col-md-12 form-group " style="vertical-align: bottom;" >
							<div class="col-md-2" align="right"><label style="padding:5px;">设&nbsp;备&nbsp;状&nbsp;态</label></div>
							<div class="col-md-4"><form:select path="devStatus" style="width:87%" class="form-control" items="${devStatusMap}" /></div>
						</div>
						<div id="product" style="display: none;">
							<table border="0px" cellpadding="0" cellspacing="0">
								<tr>
									<td><span class="must">商城模式下使用</span></td>
									<td></td>
								</tr>
								<tr>
									<td>商&nbsp;户&nbsp;名&nbsp;称 
									    <input id="productName" class="text" name="productName" type="text"
										       value="${equipment.productName}" readonly="readonly" />
									</td>
									<td>
									    <span style="margin-left: 113px;"> 
									        <input type="button" class="center_btn" onclick="showProduct();" value="选择" />
									    </span>
									</td>
								</tr>
							</table>
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
<!-- 			    <div id="bg" class="bg" style="display: none"></div>
				<div id="showCompany" class="showCompany" style="display: none">
					<div class="show_top">
						<input type="button" onclick="hidediv();" value="" />
					</div>
					<iframe id="ifm_ID" width="100%" height="85%" frameborder="no" scrolling="no"></iframe>
				</div> -->
		    </div>
	    </div>
    </div>
</body>
</html>