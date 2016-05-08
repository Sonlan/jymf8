<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/bottom.css" />
<link type="text/css" rel="stylesheet" href="${ctx}/static/css/zhezhao.css" />
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<style type="text/css">
	.hnum:hover{
		cursor:pointer; 
	}
</style>
<title>监管部门更新页面</title>
<script>
$(function(){
    $("#admin-monitor").addClass("active");
    
    /** 表单验证    */
    $("#updateform").validate({
        rules: {
            name: {
                required:true
            },
            tel: {
            	isPhone:true
            }
        }
    });
});
</script>

<script>
//解决火狐浏览器不支持innerText属性的方法
function isIE() { //ie? 
  if (window.navigator.userAgent.toLowerCase().indexOf("msie") >= 1) return true;
  else return false;
}

if (!isIE()) { //firefox innerText define
  HTMLElement.prototype.__defineGetter__("innerText",
  function() {
    var anyString = "";
    var childS = this.childNodes;
    for (var i = 0; i < childS.length; i++) {
      if (childS[i].nodeType == 1)
      anyString += childS[i].innerText;
      else if (childS[i].nodeType == 3) anyString += childS[i].nodeValue;
    }
    return anyString;
  });
  HTMLElement.prototype.__defineSetter__("innerText",
  function(sText) {
    this.textContent = sText;
  });
}


//显示遮罩层
function showdiv() { 
	parent.$("#bg").toggle();
	parent.$("#show").removeAttr("class").addClass("showCompany");
	parent.$("#show").toggle();
	parent.document.getElementById("ifm_cp").src="${ctx}/admin/dialog/querySelectrelation";
}
//隐藏遮罩层
function hidediv() {
	parent.$("#bg").toggle();
	parent.$("#show").toggle();
}

function addtr(ids,names){
	
   //获取table的行数
	var rowcount = document.getElementById("table_1").rows.length;
	var cnt = 1;
	//循环table的每一行的第一列值
	for(var i=0;i<rowcount;i++){
		var trtd = document.getElementById("table_1").rows[i].cells[0].innerText;
		//判断文本框的值是否重复
		if(trtd==ids){
			cnt=-1;
			alert('该企业已选择,请重新选择!');
		} 	
	}
	if(cnt!=-1){
		$str='';
	    $str+="<tr align='center'>";
	    $str+="<td style='text-align: center;'><input type='hidden' id='companyId' class='text' name='companyId' value="+ids+">"+ids+"</td>";
	    $str+="<td style='text-align: center;'><input type='hidden' id='companyName' class='text' name='companyName' value="+names+">"+names+"</td>";
	    $str+="<td style='text-align: center;' onClick='getDel(this)'><a href='#'>删除</a></td>";    
	    $str+="</tr>";
	    $("#addTr").append($str); 
	    var frameHeight = parent.$("#win").height();
	    parent.$("#win").height((frameHeight + 40)+"px") ;
	}
}

//删除tr
function getDel(k){
	var showMsg="确定要删除该记录?";
	if(!confirm(showMsg))
		return ;
	$(k).parent().remove();    
}
</script>
</head>
<div id="contentDiv" ></div>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>监管部门信息更新</h2>
    </div>
    <div class="box-content">
		<form:form id="updateform" modelAttribute="monitor" action="${ctx}/admin/monitor/update?monitorIds=${monitor.id}" method="post">
    		<table class="table">
    			<tr><td style="border:0px solid ">
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">部&nbsp;门&nbsp;名&nbsp;称</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="name" value="${monitor.name}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">部&nbsp;门&nbsp;编&nbsp;号</label></div>
				<div class="col-md-4"><input id="id" name="id" type="text" class="form-control hnum" readonly="readonly" value="${monitor.id}"/></div>
			</div>
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
    			<div class="col-md-2" align="right"><label style="padding:5px;">联&nbsp;系&nbsp;电&nbsp;话 </label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="tel" maxlength="13" value="${monitor.tel}"/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">监&nbsp;管&nbsp;账&nbsp;户</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="account"  value="${monitor.account}" readonly/></div>
			</div>
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">部&nbsp;门&nbsp;状&nbsp;态 </label></div>
				<div class="col-md-4"><form:select path="status" class="form-control" items="${statusMap}" value="${monitor.status}" /></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">监&nbsp;管&nbsp;企&nbsp;业</label></div>
				<div class="col-md-4">
					<button type="button" class="btn btn-primary btn-sm" id ="addBtn" onclick="showdiv();"> 
					<i class="glyphicon glyphicon-plus icon-white"></i>&nbsp;添加企业</button>
				</div>
			</div>
			
			<table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive" style="overflow:scroll;" id="table_1">
				<thead style="text-align: center;">
				    <tr >
						<td style="text-align: center;">企业编号</td>
						<td style="text-align: center;">企业名称</td>
						<td style="text-align: center;">用户操作</td>
				    </tr>
		    	</thead>
				<tbody id="addTr">
				</tbody>
			</table>
			<div class="col-md-12 form-group">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-6 col-md-5" type="submit" style="width:">确&nbsp;&nbsp;&nbsp;定</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5" type="button" 
                           onclick="javascript:window.location.href='${ctx}/admin/monitor/main'">取&nbsp;&nbsp;&nbsp;消</button>
				</div>
			</div>
			</td></tr>
			</table>
    	</form:form>
		<!-- 遮罩层 -->
		<!-- <div id="bg" class="bg" style="display: none"></div>
			<div id="showCompany" class="showCompany" style="display: none">
				<div class="show_top">
					<input type="button" onclick="hidediv();" value="" />
				</div>
				<iframe id="ifm_ID" width="300%" height="235%" frameborder="no" scrolling="no"></iframe>
			</div>-->
	</div> 
</div>
</div>
</div>
</html>