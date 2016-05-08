<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>

<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/static/css/errormessage.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/jquery-validation/1.11.1/validate.css" /> 
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/messages_cn.js"></script>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<title>溯源信息修改</title>
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
		$("#suyuanxinxi").addClass("active");
	    $("#addform").validate({
	        rules: {
	        	hnum:{
	            	required:true
	            },
	        	fromAddr:{
	            	required:true
	            },
	            toAddr:{
	            	required:true
	            },
	            releaseDate:{
	            	required:true
	            }
	        }
	    });
	    
	});
	//显示遮罩层
	function showdiv() { 
		$("#bg").fadeToggle("1000");
		$("#showCompany").slideToggle("1000");
	    document.getElementById("ifm_ID").src="${ctx}/admin/dialog/selectProduct/"+companyId;
	}
	//隐藏遮罩层
	function hidediv() {
		$("#bg").fadeToggle("1000");
		$("#showCompany").slideToggle("1000");
	}
	
	function setProduct(id,name){
	    $("#productId").attr("value",id);
	    $("#productName").attr("value",name);
	    $.ajax({
	    	url:"${ctx}/company/importPlan/getAvailableProductLabelCount",
	    	type:"post",
	    	data:"id="+id,
	    	dataType:"text",
	    	success:function(data){
	    		var param = {
	    			productId:id,
	    			productName:name,
	    			count:data
	    		};
	    		$("#productName").val(name);
	    		//makeProductTable(param);
	    	}
	    });
	    
	}
	
	function check(){
		if(checkProductList()){
			if(confirm("确认提交上述信息吗？")){
				$("#addform").submit();	
			}
		}
	}

	function showInfo(way){
		if(way=="before"){
			
		}else if(way=="after"){
			
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
   
		<form:form id="addform" modelAttribute="plan" action="${ctx}/company/importPlan/update" method="post">
	   		 <table class="table">
	   		 <tr><td style="border:0px solid ">
	   		 
	   		<div class="col-md-12 form-group" style="vertical-align: bottom;cursor: pointer;">
	   			<div class="col-md-12 jianbian" onclick="titleToggle(this,'before')"  >
	   				<a id="before_arrow" class="arrow_down" href="javascript:void(0);"></a>
	   				<label style="padding:5px;cursor: pointer;margin-bottom:0;color:white;" id="beforemsg">入境前信息</label></div>
	   		</div> 
	   		 
	   		<div id="before">
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">ID号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="id" value="${plan.id}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">货物名称</label></div>
				<div class="col-md-4"><input type="text" id="productName" style="cursor: pointer;" class="form-control" value="${plan.productName}" name="productName" readonly="readonly" onclick="showdiv();"/></div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">产地</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="origin" value="${plan.origin}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">原料信息</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="material" value="${plan.material}"/></div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">生产信息</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="produceInfo" value="${plan.produceInfo}" /></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">生产日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="produceDate" value="${plan.produceDate}"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">生产批号</label></div>
				<div class="col-md-4"><input type="text" class="form-control"  name="produceBatchNum" value="${plan.produceBatchNum}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">出厂日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="outFactoryDate" value="${plan.outFactoryDate}"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">启运地</label></div>
				<div class="col-md-4">
					 <select name="fromAddr" class="form-control"  style="width:100%;height:34px;" >
                    	<c:forEach var="worldArea" items="${worldAreas}">
                    		<option value="${worldArea.areaName}">${worldArea.areaName}</option>
                    	</c:forEach>
                    </select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">启运时间</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="fromAddrDate"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${plan.fromAddrDate}"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">运输方式</label></div>
				<div class="col-md-4">
					<select class="form-control"  style="width:100%;height:34px;" name="transport">
						<option value="海运">陆运</option>
						<option value="海运">海运</option>
						<option value="空运">空运</option>
					</select>
				</div>
			</div>
			</div> 
			
			
			<div class="col-md-12 form-group" style="vertical-align: bottom;cursor: pointer;">
	   			<div class="col-md-12 jianbian" onclick="titleToggle(this,'after')" >
	   				<a id="after_arrow" class="arrow_down" href="javascript:void(0);"></a>
	   				<label style="padding:5px;cursor: pointer;color:white" id="beforemsg">入境后信息</label>
	   			</div>
	   		</div> 
			
			<div id="after">
    		
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">入境检验检疫证书编号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="hnum"  value="${plan.hnum}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">签发单位</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="hunit" value="${plan.hunit}"/></div>
			</div>
			<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">报检单号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="baojiandan" value="${plan.baojiandan}" /></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">报检日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="baojiandanDate"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" value="${plan.baojiandanDate}"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
			<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">报关单号</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="baoguandan" value="${plan.baoguandan}" /></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">报关日期</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="baoguandanDate" 
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd'})" value="${plan.baoguandanDate}"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
    		<div class="col-md-12 form-group" style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">到达口岸</label></div>
				<div class="col-md-4">
					<select name="toAddr" class="form-control" style="width:100%;height:34px;" >
                	 	<c:forEach var="port" items="${ports}">
                    		<option value="${port.portName}">${port.portName}</option>
                    	</c:forEach>
                	</select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">到港时间</label></div>
				<div class="col-md-4"><input type="text" class="form-control Wdate" name="toAddrDate"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'})"  value="${plan.toAddrDate}"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC" />
				</div>
			</div>
				
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
    			<div class="col-md-2" align="right"><label style="padding:5px;">目的地</label></div>
				<div class="col-md-4">
					<select name="destAddr" class="form-control" style="width:100%;height:34px;" >
                     	<c:forEach var="city" items="${cities}">
                    		<option value="${city.name}">${city.name}</option>
                    	</c:forEach>
                    </select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">放行日期</label></div>
				<div class="col-md-4">
					<input type="text" class="form-control Wdate" name="releaseDate" value="${plan.releaseDate}"
						   onclick="WdatePicker({lang:'zh-cn',dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						   style="width:100%;height:34px;margin:0;border-color:#CCCCCC"/>
				</div>
			</div>
			</div>
			<!-- 
    	    <div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;">货物名称</label></div>
				<div class="col-md-1"><button type="button" class="btn btn-primary btn-sm" onclick="showdiv();">选择</button></div>
			</div>
    		 <div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2"><label style="padding:5px;"></label></div>
				<div id="productTable" class="col-md-10" >
					<div id="-1" class="col-md-12 " align="center" style="padding:0">
						<div class="div_border col-md-1">ID</div>
						<div class="div_border col-md-4">货物名称</div>
						<div class="div_border col-md-2">可用凭证数量</div>
						<div class="div_border col-md-4">当前凭证使用数量</div>
						<div class="div_border col-md-1">操作</div>
					</div>
				</div>
			</div>
    		 -->
			<div class="col-md-12 form-group ">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-6 col-md-5" type="button" onclick="check()">保存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5" type="button" 
                           onclick="javascript:window.location.href='${ctx}/company/product/main/'">取消</button>
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