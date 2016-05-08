<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@include file="../common.jsp" %>
<html>
<head>
<title>凭证添加</title>
<script>
	var companyId='${companyId}';
	$(document).ready(function() {
	    $("#addform").validate({
	        rules: {
	        	productName:{
	            	required:true
	            },
	            count:{
	            	required:true,
	            	digits:true
	            }
	        },
		    messages:{
	            count: {
	            	digits:"请输入整数的数量"
	            }
	        }
	       
	    });
	});
	//显示遮罩层
	function showdiv() { 
		parent.$("#bg").fadeToggle("1000");
		parent.$("#show").removeAttr("class").addClass("showCompany");
		parent.$("#show").slideToggle("1000");
		parent.document.getElementById("ifm_ID").src="${ctx}/admin/dialog/selectProduct/"+companyId;
	}
	//隐藏遮罩层
	function hidediv() {
		parent.$("#bg").fadeToggle("1000");
		parent.$("#showCompany").slideToggle("1000");
	}
	
	function setProduct(id,name){
	    $("#productId").attr("value",id);
	    $("#productName").attr("value",name);
	}
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
        <h2>申请凭证</h2>
    </div>
    <div class="box-content">
		<form:form id="addform" modelAttribute="labelIndex" action="${ctx}/company/label/add" method="post">
	    <table class="table">
			<tr><td style="border:0px solid ">
		    <input type="hidden" name="workMode" value="${company.workMode}"/>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;">货物名称</label></div>
				<div class="col-md-7">
					<input type="text" class="form-control" readonly="readonly" id="productName" name="productName" value=""/>
					<input type="hidden" id="productId" name="productId" value=""/>
				</div>
				<div class="col-md-1"><button type="button" class="btn btn-primary btn-sm" onclick="showdiv();">选择</button></div>
			</div>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;">申请数量</label></div>
				<div class="col-md-7">
					<input type="text" maxlength="8" class="form-control" name="count" value=""/>
				</div>
				<div class="col-md-1" style="padding : 4px;" >万</div>
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