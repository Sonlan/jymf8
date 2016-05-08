<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@include file="../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js"></script>
<link type="text/css" rel="stylesheet" href="${ctx}/static/jquery-validation/1.11.1/validate.css" /> 
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/messages_cn.js"></script>

<link type="text/css" rel="stylesheet" href="${ctx}/static/tree/css/zTreeStyle/zTreeStyle.css" /> 
<script type="text/javascript" src="${ctx}/static/tree/js/jquery.ztree.all-3.5.min.js"></script>
<title>企业用户添加页面</title>
<script>
    $(document).ready(function(){
        $("#addform").validate({
            rules: {
                id: {
                    required:true,
                    idFormat:true,
                    byteMaxLength:20,
                    remote:"${ctx}/company/user/checkId"
                },
                password: {
                	required:true,
                },
                password2: {
                	required:true,
                	equalTo:"#password"
                }
            } ,
            messages:{
                id: {
                	remote:"用户ID重复"
                },
                password2: {
            		equalTo:"您两次输入的新密码不一致，请确认"
                }
            }
        });
    });
 
	    
		<!--
		var setting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			check:{
				enable:true,
				chkboxType: { 
					"Y":"ps",
					"N":"ps"
				}
			}
		};

		var zNodes =${rights};
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		
		function expand(){
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			treeObj.expandAll(true);
		}
		function unexpand(){
			
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			treeObj.expandAll(false);
		}
		
		function getNodes(){
			var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
			var nodes = treeObj.getCheckedNodes(true);
			var auth ="";
			$.each(nodes,function(i,n){
				auth += n.id+"#";
			});	
			$("#auth").val(auth);
		}
		
		//-->
		function check(){
			getNodes();
			$("#addform").submit();
		}
	</SCRIPT>

</head>
<body>
<div class="row">
    <div class="box col-md-12" >
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>添加用户信息</h2>
    </div>
    <div class="box-content">
    
		<form:form id="addform"  action="${ctx}/company/user/add" method="post">
			<table class="table">
			<tr><td style="border:0px solid ">
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">用户名</label></div>
				<div class="col-md-7">
					<input type="text" class="form-control" id="id" name="id" value=""/>
				</div>
			</div>
			<div class="col-md-10 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">权&nbsp;&nbsp;&nbsp;&nbsp;限</label></div>
				<div class="col-md-7" >
					<div> 
						<button type="button" class="btn btn-xs btn-primary" onclick="expand()">全部展开</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-xs btn-primary" onclick="unexpand()">全部关闭</button>
					</div>
					<br>
				 	<div id="treeDemo" class="ztree" style="border:solid 1px #CCCCCC;border-radius:5px;height:250px;overflow: scroll;"></div>
					<input type="hidden" id="auth" name="auth" >
				</div>
			</div>
			 <div class="col-md-9" >
				<div class="col-md-6" align="right">
					<button class="btn btn-success col-md-offset-6 col-md-5" type="button" onclick="check()" >保&nbsp;&nbsp;&nbsp;存</button>
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

</body>
</html>