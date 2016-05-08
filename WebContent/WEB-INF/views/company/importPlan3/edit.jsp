<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@include file="../common.jsp" %>
<html>
<head>
<title>溯源信息修改</title>
<script>
	function check(){
		if(confirm("确认提交上述信息吗？")){
			$("#addform").submit();	
		}
	}

</script>
</head>
<body>

<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>流通信息修改</h2>
    </div>
    <div class="box-content">
   
		<form:form id="addform" modelAttribute="plan" action="${ctx}/company/importPlan3/update" method="post">
	   		 <table class="table">
	   		 <tr><td style="border:0px solid ">
	   		 <input name="id" value="${plan.id}" style="display: none"/>
			<div class="col-md-8 col-md-offset-2 form-group" style="vertical-align: bottom;" >
				<div class="col-md-3" align="right"><label style="padding:5px;">一级流向</label></div>
				<div class="col-md-9"><input type="text" class="form-control" name="firstStop" value="${plan.firstStop}"/></div>
			</div>
    		<div class="col-md-8 col-md-offset-2 form-group" style="vertical-align: bottom;" >
				<div class="col-md-3" align="right"><label style="padding:5px;">二级流向</label></div>
				<div class="col-md-9"><input type="text" class="form-control" name="secondStop" value="${plan.secondStop}"/></div>
			</div>
			
			<div class="col-md-12 form-group ">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-9 col-md-3" type="button" onclick="check()">保存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-3" type="button" onclick="history.back()">取消</button>
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