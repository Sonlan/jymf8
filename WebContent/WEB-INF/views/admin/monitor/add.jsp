<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@include file="../common.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/static/css/bottom.css" type="text/css" rel="stylesheet"/>
<link href='${ctx}/static/bower_components/chosen/chosen.min.css' rel='stylesheet'>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script src="${ctx}/static/bower_components/chosen/chosen.jquery.min.js"></script>
<style type="text/css">
	.hnum:hover{
		cursor:pointer; 
	}
</style>

<script>
$(document).ready(function(){
    /** 表单验证    */
	$(".chzn-select").chosen({no_results_text: "没有匹配结果",search_contains: true});
	$.validator.setDefaults({ ignore: ":hidden:not(select)" })
    $("#addform").validate({
        rules: {
        	name:{
        		required:true,
        		remote:"${ctx}/admin/monitor/checkMonitorName"
        	},
            account: {
                required:true,
                idFormat:true,
                remote:"${ctx}/admin/monitor/checkAccount"
            },
            tel: {
            	isPhone:true
            }
        } ,
        messages:{
            name:{
            	required:"请选择监管部门!",
                remote:"该监管部门已添加,请重新输入!"
            },
        	account: {
        		remote:"账号已存在,请重新输入!"
            },
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
	    $str+="<td><input type='hidden' id='companyId' class='text' name='companyId' value="+ids+">"+ids+"</td>";
	    $str+="<td><input type='hidden' id='companyName' class='text' name='companyName' value="+names+">"+names+"</td>";
	    $str+="<td onClick='getDel(this)'><a href='#'>删除</a></td>";    
	    $str+="</tr>";
	    $("#addTr").append($str);   
	    var frameHeight = parent.$("#win").height();
	    parent.$("#win").height((frameHeight + 40)+"px") ;
	}
}

/* function hiddenValue(param){
	alert($(param).val());
	alert($(param).find("option:selected").text());
	$("#monitorNameId").val($(param).val());
	$("#monitorNameValue").val($(param).find("option:selected").text());
} */

//删除tr
function getDel(k){
	var showMsg="确定要删除该记录?";
	if(!confirm(showMsg))
        return ;
	$(k).parent().remove();    
}
</script>
<title>监管部门添加</title>

</head>
<body>
<div id="contentDiv" ></div>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>监管部门添加</h2>
    </div>
    <div class="box-content">
   
	<form:form id="addform" modelAttribute="companyMonitor" action="${ctx}/admin/relation/add" method="post">
    	<table class="table">
    		<tr><td style="border:0px solid ">
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">部门名称</label><span style="color:red" >*</span></div>
				<div class="col-md-4">
					 <select style="width:73%" class="chzn-select form-inline input-sm" name="name">
					 	<option value="">点击选择监管部门</option>
			        	<c:forEach items="${customsMontiorList}" var="list">
			        		<option value="${list.id}_${list.name}">${list.name}</option>
			        	</c:forEach>
			        </select>
				</div>
				<div class="col-md-2" align="right"><label style="padding:5px;">联系电话</label></div>
				<div class="col-md-4"><input type="text" style="width:73%" class="form-control" name="tel" id="tel" value=""/></div>
			</div>
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
    			<div class="col-md-2" align="right"><label style="padding:5px;">监管账户</label><span style="color:red" >*</span></div>
				<div class="col-md-4"><input type="text" style="width:73%" class="form-control" name="account" id="account" value=""/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">监管企业</label></div>
				<div class="col-md-4">
					<button id="imgFile3" name="summFiles" type="button" class="btn btn-primary btn-sm" onclick="showdiv();">
                    	<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加企业
                    </button>
				</div>
			</div>
				
			<div class="col-md-12 form-group " >
				<div class="col-md-2"></div>
				<div class="col-md-9">
					<table id="table_1" style="margin-top: 20px;" class="jymf_table table_border">
						<thead style="text-align: center">
							<tr>
								<td>企业编号</td>
								<td>企业名称</td>
								<td>用户操作</td>
							</tr>
						</thead>
						<tbody id="addTr">
						</tbody>
					</table>
                </div>
			</div>
			<div class="col-md-12 form-group ">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-6 col-md-5" type="submit">保&nbsp;&nbsp;&nbsp;存</button>
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
</div>
</div>
</div>
</body>
</html>