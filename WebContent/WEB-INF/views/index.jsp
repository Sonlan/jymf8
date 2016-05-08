<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@include file="monitor/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="renderer" content="webkit"> 
	<meta property="qc:admins" content="575226062302363757215607" />
	<title>中国进口产品质量追溯平台登录</title>
	<style type="text/css">
		.login_a:HOVER{
			font-family:'SimHei' ,'STFangsong'; font-size: 15px;color: #00BBEE;text-decoration: none;
		}
		.login_a {
			font-family:'SimHei' ,'STFangsong'; font-size: 15px;color:black;
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
	<script language="JavaScript"> 
		if (window != top){ 
			top.location.href = location.href;
		}
	</script>
	<script type="text/javascript">
		function changeRole(value){
			$("#role_id").val(value);
			if(value==1){
				$("#companyId_div").remove();
				$("#companyId_div_clearfix").remove();
				$("#role").text("管理员");
				$("#account").attr("name","account");
				$("#password").attr("name","password");
				
				$("#loginForm").attr("action","${ctx}/admin/login");
				$("#loginForm").attr("modelAttribute","admin");
				hideRegister();
				
			}else if(value==2){
				$("#role").text("企业用户");
				$("#loginForm").attr("action","${ctx}/company/login");
				$("#loginForm").attr("modelAttribute","companyUser");
				$("#account").attr("name","id");
				$("#password").attr("name","password");
				
				var companyId_div ='<div id="companyId_div_clearfix" class="clearfix"><br></div><div id="companyId_div" class="input-group input-group-md">'+
                   '<span class="input-group-addon"><i class="glyphicon glyphicon-tag "></i></span>'+
                   '<input id="companyId" type="text" class="form-control" name="license" placeholder="组织机构代码">'+
                   '</div>';
                if($("#companyId_div").length==0){
					$("#role_div").after(companyId_div);
				}
                showRegister();
				
			}else if(value==3){
				$("#companyId_div").remove();
				$("#companyId_div_clearfix").remove();
				$("#role").text("监管用户");
				$("#account").attr("name","account");
				$("#password").attr("name","pwd");
				
				$("#loginForm").attr("action","${ctx}/monitor/logins");
				$("#loginForm").attr("modelAttribute","companyMonitor");
				hideRegister();
			}
		}
		
		function check(){
			if($("#account").val()==""){
				$("#error_text").text("用户名不可为空");
			}else if($("#password").val()==""){
				$("#error_text").text("密码不可为空");
			}else if($("#companyId").val()=="" && $("#role_id").val()!=null && $("#role_id").val()!=""){
				$("#error_text").text("企业代码不可为空");
			}else if($("#role_id").val()==""){
				$("#error_text").text("请选择身份");
			}else{
				$("#loginForm").submit();
			}
		}
		
	function showRegister(){
		$("#login_btn").removeClass("col-md-12").addClass("col-md-5");
		$("#register_btn").show();
	}		
	
	function hideRegister(){
		$("#login_btn").removeClass("col-md-5").addClass("col-md-12");
		$("#register_btn").hide();
	}

	document.onkeydown = function subCheck(){
		if(event.keyCode == 13){
			check();
		}
	}
	
	$(document).ready(function(){
		
		
	});

	</script>
</head>

<body style="width:100%;" >
	
	<div style="padding:0;" class="col-md-12">
        
    <div style="margin:0px;padding-top: 10px;" class="col-md-12 login_top_div" >
        
        <div class="col-md-3" >
        	
        </div>
        <div class="col-md-3 " style="padding-top :12px; "></div>
        <div class="col-md-2 ">
        </div>
        <div class="col-md-3 " style=" padding-top:10px;padding-bottom:30px;padding-left:40px;">
            <span>
            	<a href="javascript:void(0);" target="_blank" class="login_a">APP下载</a>&nbsp; | &nbsp;
            	<a href="http://www.cpzs.org/jymf.check/" target="_blank" class="login_a">条码查询</a>&nbsp; | &nbsp;
            	<a href="#" target="_blank"  class="login_a">关于我们</a>
            </span>
        </div>
        <div class="col-md-1">
        </div>
        <!--/span-->
    </div><!--/row-->
	
	<br>
	<div style="height: 500px;width:100%; padding:0px;" class="col-md-12">
	 	<img src="${ctx}/static/images/login_pic_blue.png" alt="" style="height:500px; width:100%">
	
	<!-- 
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="margin:0;">
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		  </ol>
		
		  <div class="carousel-inner" role="listbox">
		    <div class="item active">
		      <img src="${ctx}/static/images/login_pic_1.png" alt="" style="height:500px; width:100%">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="${ctx}/static/2.jpg" alt="" style="height:500px;width:100%">
		      <div class="carousel-caption">
		      </div>
		    </div>
		    <div class="item">
		      <img src="${ctx}/static/3.jpg" alt="" style="height:500px;width:100%">
		      <div class="carousel-caption">
		      </div>
		    </div>
		  </div> -->
	</div>
			
	<br><br><br>
	<div style="font-family:Microsoft Yahei;padding-top:20px;" class="col-md-12">
	   <p class="col-md-12 col-sm-12 col-xs-12 " align="center">版权所有：中国检验检疫学会产品质量追溯专业技术委员会、国家防伪工程技术研究中心产品追溯委员会</p>
	   <p class="col-md-12 col-sm-12 col-xs-12 " align="center">京ICP备12014821号-1&nbsp;&nbsp;&nbsp;地址：北京市朝阳区红军营南路15号瑞普大厦C座1603-1703</p>
	</div>	
			
			
	</div>
	
	<div class="col-md-12" style="position:absolute ;top:120px;">
		<div class="col-md-8" style="height:100%;" >
			<div class="col-md-12" >
				<img alt="" src="${ctx}/static/images/login_leftTop_pic_white.png">
			</div>
			<div class="col-md-12" style="height:100%;" align="center">
				<img alt="" src="${ctx}/static/images/login_center_words_white.png" style="width:560px;padding-top: 15%;">
			</div>	
		</div>
		
        <div class="col-md-3 " style=" padding: 0;border-radius:5px;font-family: Microsoft Yahei; max-height: 400px; border:  solid 2px #009BF5;background-color:white">
           <div class="col-md-12" style="background-color: #009BF5;padding: 10px;">
           		<div  align="center" class="title" >登录系统</div>
           </div>
           <div class="col-md-12" align="center">
	            <form:form id="loginForm" class="form-horizontal" action="" modelAttribute="admin" method="post" style="margin:20px auto;" >
	                <fieldset>
	                	<div id="role_div" class="input-group input-group-md ">
						   <span class="input-group-addon"><i class="glyphicon glyphicon-hand-right "></i></span>
		                   <button id="role" type="button" class="form-control btn btn-default dropdown-toggle " style="text-align: left;border-color: #CCCCCC" data-toggle="dropdown">点一点选择身份</button>
		                   <input id="role_id" type="hidden">
		                   <ul class="dropdown-menu" >
		                        <li><a href="javascript:changeRole(1)"> 管理员 </a></li>
		                        <li><a href="javascript:changeRole(2)"> 企业用户 </a></li>
		                        <li><a href="javascript:changeRole(3)"> 监管用户 </a></li>
		                    </ul>
				        </div>
				        <div class="clearfix"></div><br>
	                    <div class="input-group input-group-md" >
	                        <span class="input-group-addon"><i class="glyphicon glyphicon-user "></i></span>
	                        <input id="account" type="text" class="form-control" name="account" placeholder="用户名">
	                    </div>
	                    <div class="clearfix"></div><br>
	
	                    <div class="input-group input-group-md">
	                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock "></i></span>
	                        <input id="password" type="password" class="form-control" name="password" placeholder="密码">
	                    </div>
						<span class="error_text" id="error_text"> ${message}</span><br><br>
	                    <p class="center">
	                        <button id="login_btn" onclick="check()" style="background-color: #3B8EDE" type="button" class="btn  col-md-12">登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</button>
	                        <button id="register_btn" onclick="window.location.href='${ctx}/register'" style="display: none;border:1px solid #CCCCCC;" type="button" class="btn col-md-5 pull-right">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</button>
	                    </p>
	                </fieldset>
	            </form:form>
            </div>
    </div><!--/row-->
</div>
</body>

</html>
