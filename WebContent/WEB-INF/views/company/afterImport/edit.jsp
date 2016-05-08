<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@include file="../common.jsp" %>
<html>
<head>
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<link href='${ctx}/static/bower_components/chosen/chosen.min.css' rel='stylesheet'>
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/jquery-validation/1.11.1/validate.css" /> 
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
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
	        	hnum:{
	            	required:true
	            },
	        	hunit:{
	            	required:true
	            }
	        }
	    });
	    $(".chzn-select").chosen({no_results_text: "没有匹配结果",search_contains: true});
	});
	
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
        <h2>入境后信息修改</h2>
    </div>
    <div class="box-content">
   
		<form:form id="addform" modelAttribute="plan" action="${ctx}/company/afterImport/update" method="post">
	   		 <table class="table">
	   		 <tr><td style="border:0px solid ">
	   		 
			<div class="col-md-12 form-group" style="vertical-align: bottom;cursor: pointer;">
	   			<div class="col-md-12 jianbian" onclick="titleToggle(this,'after')" >
	   				<a id="after_arrow" class="arrow_down" href="javascript:void(0);"></a>
	   				<label style="padding:5px;cursor: pointer;color:white" id="beforemsg">入境后信息</label>
	   			</div>
	   		</div> 
			
			<div id="after">
			<input name="id" value="${plan.id}" style="display: none"/>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">ID号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" readonly="readonly" value="${plan.planId}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">货物名称</label></div>
				<div class="col-md-4">
					<input type="text" id="productName" class="form-control" value="${plan.proName}" readonly="readonly"/>
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">入境检验检疫证书编号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="hnum"  value="${plan.hnum}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">签发单位</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="hunit" value="${plan.hunit}"/></div>
			</div>
			<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">报检单号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="inspectForm" value="${plan.inspectForm}" /></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">报检日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="inspectDate"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" value='<fmt:formatDate value="${plan.inspectDate}" pattern="yyyy-MM-dd"/>'
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
			
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">到达口岸</label></div>
				<div class="col-md-4">
					<select name="arrivalPort" class="chzn-select form-control" data-placeholder='请选择到达口岸.....' style="width:100%;height:34px;" >
                	 	<c:forEach var="port" items="${ports}">
                	 		<option value="" ></option>
                    		<option value="${port.portName}"<c:if test="${plan.arrivalPort==port.portName }">selected="selected"</c:if> >${port.portName}</option>
                    	</c:forEach>
                	</select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">到港日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="arrivalDate"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"  value='<fmt:formatDate value="${plan.arrivalDate}" pattern="yyyy-MM-dd"/>'
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
						   
				</div>
			</div>
				
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
    			<div class="col-md-2" align="right"><label style="padding:5px;">目的地</label></div>
				<div class="col-md-4">
					<select name="destAddr" class="chzn-select form-control" data-placeholder='请选择目的地.....' style="width:100%;height:34px;" >
                     	<c:forEach var="city" items="${cities}">
                     		<option value="" ></option>
                    		<option value="${city.name}" <c:if test="${plan.destAddr==city.name }">selected="selected"</c:if> >${city.name}</option>
                    	</c:forEach>
                    </select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">放行日期</label></div>
				<div class="col-md-4">
					<input type="text" class="form-control Wdate" name="releaseDate" 
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" value='<fmt:formatDate value="${plan.releaseDate}" pattern="yyyy-MM-dd"/>'
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC"/>
				</div>
			</div>
			</div>
			<div class="col-md-12 form-group ">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-6 col-md-5" type="button" onclick="check()">保存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5" type="button" onclick="history.back()">取消</button>
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