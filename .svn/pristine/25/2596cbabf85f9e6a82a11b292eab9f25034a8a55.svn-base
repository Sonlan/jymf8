<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@include file="monitor/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="renderer" content="webkit"> 
	<title>中国进口产品质量追溯平台注册</title>
	<style type="text/css">
		.login_a:HOVER{
			font-family:'STFangsong'; font-size: 15px;color: #00BBEE;text-decoration: none;
		}
		.login_a {
			font-family:'STFangsong'; font-size: 15px;color:white;
		}
		.title{
			color: white; font-family:'STFangsong'; font-size: 20px;
		}
		.error_text{
			color: red; font-family:Microsoft Yahei; font-size: 15px;
		}
		.login_top_div{
			 filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0, startColorstr='#E7EBEE', endColorstr='#FFFFFF');/*IE<9>*/
			 -ms-filter: "progid:DXImageTransform.Microsoft.gradient (GradientType=0, startColorstr='#E7EBEE', endColorstr='#FFFFFF')";/*IE8+*/
			 background: -webkit-linear-gradient(left, #E7EBEE, #FFFFFF);
			 background: -webkit-gradient(linear,left, from(#E7EBEE), to(#FFFFFF));
			 background: -moz-linear-gradient(left, #E7EBEE, #FFFFFF);
			 background: -o-linear-gradient(left, #E7EBEE, #FFFFFF);
		}
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
	    /** 表单验证    */
	    $("#registerForm").validate({
	        rules: {
	        	licenseNum: {
	                required:true,
	                remote : "${ctx}/checkCpCode"
	            },
	            name: {
	            	required:true,
	            	remote : "${ctx}/checkCpName"
	            },
	            address: {
	            	required:true
	            },
	            person: {
	                required:true
	            },
	            tel: {
	            	required:true,
	            	isPhone:true
	            }
	        },
			messages : {
				licenseNum : {
					remote : "该机构代码已注册!"
				},
				name : {
					remote : "该公司名称已注册!"
				}
			} 
	    });
	});
	</script>
</head>

<body style="width:100%;" >
	
<div style="padding:0;" class="col-md-12">
        
    <div style="margin:0px;padding-top: 10px;" class="col-md-12 login_top_div" >
        
        <div class="col-md-3" >
        	<img alt="" src="${ctx}/static/images/login_logo.png" style="float: right;">
        </div>
        <div class="col-md-3 " style="padding-top :12px; "></div>
        <div class="col-md-2 ">
        </div>
        <div class="col-md-3 " style=" padding-top:10px;padding-bottom:30px;padding-left:40px;background: url(${ctx}/static/images/login_right_top.png) no-repeat;">
            <span style="color:white">
            	<a href="javascript:void(0);" target="_blank" class="login_a">APP下载</a>&nbsp; | &nbsp;
            	<a href="http://www.cpzs.org/jymf.check/" target="_blank" class="login_a">条码查询</a>&nbsp; | &nbsp;
            	<a href="http://www.cpzhuisu.com/" target="_blank"  class="login_a">关于我们</a>
            </span>
        </div>
        <div class="col-md-1">
        </div>
        <!--/span-->
    </div><!--/row-->
	
	<br>
	<div class="col-md-6 col-md-offset-3" style="background-color: #FF8772;height:50px;margin-top: 10px;padding:15px;color: white" >
    	欢迎您注册进口产品质量追溯平台，中国追溯为您的产品保驾护航！
    </div>
    <c:if test="${result==0}">
	<div style="padding:0px;" class="col-md-12">
	 	 <div class="col-md-6 col-md-offset-3" align="center" style="border:solid 1px #E0E0E0;">
	            <form:form id="registerForm" class="form-horizontal" action="${ctx}/registerPost" modelAttribute="company" method="post" style="margin:20px auto;" >
	                <div class="col-md-12 form-group " style="vertical-align: bottom;" >
						<div class="col-md-3"><label style="padding:5px;">组织机构代码</label></div>
						<div class="col-md-9"><input type="text" class="form-control" name="licenseNum" value=""/></div>
					</div>
	                <div class="col-md-12 form-group " style="vertical-align: bottom;" >
						<div class="col-md-3"><label style="padding:5px;">公司名称</label></div>
						<div class="col-md-9"><input type="text" class="form-control" name="name" value=""/></div>
					</div>
	               
	                <div class="col-md-12 form-group " style="vertical-align: bottom;" >
						<div class="col-md-3"><label style="padding:5px;">公司地址</label></div>
						<div class="col-md-9"><input type="text" class="form-control"  name="address" value=""/></div>
					</div>
	                <div class="col-md-12 form-group " style="vertical-align: bottom;" >
						<div class="col-md-3"><label style="padding:5px;">联系人</label></div>
						<div class="col-md-9"><input type="text" class="form-control" name="person" value=""/></div>
					</div>
	                <div class="col-md-12 form-group " style="vertical-align: bottom;" >
						<div class="col-md-3"><label style="padding:5px;">联系电话</label></div>
						<div class="col-md-9"><input type="text" class="form-control" name="tel" maxlength="16" value=""/></div>
					</div>
	                <div class="col-md-12 form-group " style="vertical-align: bottom;" >
						<div class="col-md-3"><label style="padding:5px;">公司主页</label></div>
						<div class="col-md-9"><input type="text" class="form-control" name="url" value=""/></div>
					</div>
					<div class="col-md-12 form-group " style="vertical-align: bottom;" >
	                    <button id="login_btn" style="background-color: #FF8772" type="submit" class="btn red col-md-3 col-md-offset-5">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</button>
	                </div>
	                <input type="hidden" name="token" value="${token}" />
	            </form:form>
            </div>
	</div>
	</c:if>
	<c:if test="${result==1}">
		<div style="padding:200px 50px;" class="col-md-12">
			<div class="col-md-6 col-md-offset-3" align="center" >
				<span>贵公司的帐号已经申请成功，我们会在三个工作日内将审核结果电话通知您，请耐心等候。</span>
			</div>
		</div>
	</c:if>
		
	<br><br><br>
	<div style="font-family:Microsoft Yahei;padding-top:20px;" class="col-md-12">
	   <p class="col-md-12 col-sm-12 col-xs-12 " align="center">版权所有：中国检验检疫学会产品追溯专业技术委员会、国家防伪工程技术研究中心产品追溯委员会</p>
	   <p class="col-md-12 col-sm-12 col-xs-12 " align="center">京ICP备12014821号-1&nbsp;&nbsp;&nbsp;地址：北京市朝阳区红军营南路15号瑞普大厦C座1603-1703</p>
	</div>	
			
			
</div>


</body>
</html>
