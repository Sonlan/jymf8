<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@include file="../common.jsp" %>
<html>
<head>
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<link href='${ctx}/static/bower_components/chosen/chosen.min.css' rel='stylesheet'>
<link href="${ctx}/static/css/errormessage.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/jquery-validation/1.11.1/validate.css" /> 
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/messages_cn.js"></script>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<script src="${ctx}/static/bower_components/chosen/chosen.jquery.min.js"></script>
<title>入境前信息修改</title>
<style type="text/css">
.jianbian{
	filter: progid:DXImageTransform.Microsoft.Gradient(startColorStr='#393c4a',endColorStr='#e2e2e2',gradientType='1');
	background: -moz-linear-gradient(left, #393c4a, #e2e2e2);
	background: -o-linear-gradient(left,#393c4a, #e2e2e2);
	background: -webkit-gradient(linear, 0% 0%, 100% 0%, from(#393c4a), to(#e2e2e2)); 
}
.arrow_up{
	position:relative;top:-13px;border-left: 7px solid transparent; border-right: 7px solid transparent; border-bottom:  7px solid white;
}
.arrow_down{
	position:relative;top:13px;border-left: 7px solid transparent; border-right: 7px solid transparent; border-top:  7px solid white;
}
</style>
<script>
	var companyId='${companyId}';
	
	$(document).ready(function() {
	    $("#addform").validate({
	        rules: {
	        }
	    });
	    $(".chzn-select").chosen({no_results_text: "没有匹配结果",search_contains: true});
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
	
	function check(){
		if(confirm("确认提交上述信息吗？")){
			$("#addform").submit();	
		}
	}

	function titleToggle(obj,id){
		$("#"+id).toggle(
			function(){
				var flag = $("#"+id+"_arrow").attr("class");
				var arrow = "arrow_down";
				if(flag=="arrow_down"){
					arrow = "arrow_up";
				}
				$("#"+id+"_arrow").attr("class",arrow);
			}
		);		
	}
	
</script>
</head>
<body>

<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>溯源信息修改</h2>
    </div>
    <div class="box-content">
   
		<form:form id="addform" modelAttribute="plan" action="${ctx}/company/beforeImport/update" method="post">
	   		 <table class="table">
	   		 <tr><td style="border:0px solid ">
	   		 <input name="id" value="${plan.id}" style="display: none"/>
	   		<div class="col-md-12 form-group" style="vertical-align: bottom;cursor: pointer;">
	   			<div class="col-md-12 jianbian" onclick="titleToggle(this,'before')"  >
	   				<a id="before_arrow" class="arrow_down" href="javascript:void(0);"></a>
	   				<label style="padding:5px;cursor: pointer;margin-bottom:0;color:white;" id="beforemsg">入境前信息</label></div>
	   		</div> 
	   		 
	   		<div id="before">
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">ID号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${plan.planId}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">货物名称</label></div>
				<div class="col-md-4">
					<input type="text" id="productName" style="cursor: pointer;" class="form-control" value="${plan.proName}" placeHolder="点击选择货物" name="proName" readonly="readonly" onclick="showdiv();"/>
					<input type="text" id="productId" name="proId" style="display: none;"/>
				</div>
			</div>
			<div class="col-md-12 form-group" style="vertical-align: bottom;" >
					<div class="col-md-2" align="right"><label style="padding:5px;">货物数量</label></div>
					<div class="col-md-4"><input type="text" class="form-control" id="proCount" name="proCount" value="${plan.proCount}"/></div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">产地</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="proOrigin" value="${plan.proOrigin}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">原料信息</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="proMaterial" value="${plan.proMaterial}"/></div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">生产信息</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="proProduceInfo" value="${plan.proProduceInfo}" /></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">生产日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="proProduceDate" value='<fmt:formatDate value="${plan.proProduceDate}" pattern="yyyy-MM-dd"/>'
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">生产批号</label></div>
				<div class="col-md-4"><input type="text" class="form-control"  name="proProduceNum" value="${plan.proProduceNum}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">出厂日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="proFactoryDate" value='<fmt:formatDate value="${plan.proFactoryDate}" pattern="yyyy-MM-dd"/>'
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">启运国家</label></div>
				<div class="col-md-4">
					 <select name="departCountry" class="chzn-select form-control"  data-placeholder='请选择启运国家.....' style="width:100%;height:34px;" >
					 	<option value="" ></option>
                    	<c:forEach var="worldArea" items="${worldAreas}">
                    		<option value="${worldArea.areaName}" <c:if test="${plan.departCountry==worldArea.areaName }">selected="selected"</c:if>>${worldArea.areaName}</option>
                    	</c:forEach>
                    </select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">启运口岸</label></div>
					<div class="col-md-4">
						<select name="departPort" class="chzn-select form-control" data-placeholder='请选择启运口岸.....' style="width:100%;height:34px;" >
							<option value="" ></option>
	                	 	<c:forEach var="port" items="${ports}">
	                    		<option value="${port.portName}" <c:if test="${plan.departPort==port.portName }">selected="selected"</c:if>>${port.portName}</option>
	                    	</c:forEach>
	                	</select>
					</div>
			</div>	
			<div class="col-md-12 form-group" style="vertical-align: bottom;" >	
				<div class="col-md-2" align="right"><label style="padding:5px;">启运日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="departDate"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" value='<fmt:formatDate value="${plan.departDate}" pattern="yyyy-MM-dd"/>'
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">拟到达口岸</label></div>
				<div class="col-md-4">
					<select name="arrivalPortPlan" class="chzn-select form-control" data-placeholder='请选拟到达口岸.....' style="width:100%;height:34px;" >
						<option value="" ></option>
                	 	<c:forEach var="port" items="${ports}">
                    		<option value="${port.portName}" <c:if test="${plan.arrivalPortPlan == port.portName }">selected="selected"</c:if>>${port.portName}</option>
                    	</c:forEach>
                	</select>
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">运输方式</label></div>
				<div class="col-md-4">
					<select class="form-control"  style="width:100%;height:34px;" name="shippingType">
						<c:forEach items="${shippingType}" var="type">
							<option value="${type.key}" <c:if test="${type.key==plan.shippingType}">selected="selected"</c:if> >${type.value}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			</div> 
			
			<div class="col-md-12 form-group ">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-6 col-md-5" type="button" onclick="check()">保存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5" type="button" 
                           onclick="javascript:window.location.href='${ctx}/company/beforeImport/main/'">取消</button>
				</div>					
			</div>
			</td></tr>
			</table>
    	</form:form>
	
	</div>
</div>
</div>
</div>


	
	<!-- 遮罩层 -->
	<div id="bg" class="bg" style="display: none"></div>
	<div id="showCompany" class="showCompany" style="display: none"> 
	    <div class="show_top"><input type="button" onclick="hidediv();" value=""/></div>
	    <iframe id="ifm_ID" width="100%" height="90%" frameborder="no" scrolling="no" ></iframe>
	</div>
	
</body>
</html>