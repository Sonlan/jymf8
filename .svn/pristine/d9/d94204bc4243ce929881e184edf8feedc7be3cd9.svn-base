<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>金源茂丰</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet"/>
	<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/jquery.validate.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/jquery-validation/1.11.1/messages_cn.js" type="text/javascript"></script>
    <script type="text/javascript">
		$().ready(function(){
			$("a").bind('click',function(){
				change($(this));
			}); 
		});
		
		function setWinHeight(obj) 
		{ 
			var win=obj; 
			if (document.getElementById) 
			{ 
				if (win && !window.opera) 
				{ 
					if (win.contentDocument && win.contentDocument.body.offsetHeight){ 
						win.height = win.contentDocument.body.offsetHeight; 
					}else if(win.Document && win.Document.body.scrollHeight){ 
						win.height = win.Document.body.scrollHeight; 
					}
				} 
			} 
		} 
		
		function change(obj){
			$("li").removeClass("active");
			$(obj).parent().toggleClass("active");
			var iClass = $(obj).children("i").attr("class");
			if(iClass.indexOf("glyphicon-plus")>0){
				$(obj).children("i").attr("class","glyphicon glyphicon-minus");
			}else if(iClass.indexOf("glyphicon-minus")>0){
				$(obj).children("i").attr("class","glyphicon glyphicon-plus");
			}
			$(obj).siblings("ul").toggle(400);
			closeOtherUl($(obj));
		}
		
		function closeOtherUl(obj){
			var lis = $(obj).parent().siblings();
			$.each($(lis),function(i,n){
				$(n).children("a").children("i").attr("class","glyphicon glyphicon-plus");
				$(n).find("ul").hide(400);
			})
			
		}
	
	</script>
    
</head>

<body>
 	
 	<!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <img alt="金源茂丰"  src="${ctx }/static/images/main_left_top.png" class="hidden-xs" style="float:left;margin-left:10px;height:50px;"/>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <span class="hidden-sm hidden-xs"> ${sessionScope.companyMonitors.account} </span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="${ctx}/admin/login">退出系统</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
			<div class="pull-right" style="padding-top: 10px;color:white;font-family: Microsoft Yahei">
				<i class=" glyphicon glyphicon-tags"></i>&nbsp;&nbsp;企业名称： ${sessionScope.companybase.name} &nbsp;&nbsp;&nbsp;&nbsp;
				<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;监管用户：${sessionScope.companyMonitors.name }
			</div>
        </div>
    </div>
    <!-- topbar ends -->

<div class="ch-container">
    <div class="row">
        
        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav" style="height:500px;">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">
                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header" style="font-size:15px;">系统功能</li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/company/import/main"><span> 货物流向  </span></a></li>
                        <li><a target="win" href="${ctx}/monitor/company/count/main"><span> 标识统计 </span></a></li>
                        <li><a target="_top" class="ajax-link" href="${ctx}/monitor/company/back"><span> 返回首页 </span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->

        <noscript>
            <div class="alert alert-block col-md-12">
                <h4 class="alert-heading">注意！</h4>

                <p>您需要 <a href="" target="_blank">JavaScript</a>功能来访问本站。</p>
            </div>
        </noscript>
		
		<!-- 右侧顶部信息展示块 -->
		<div id="content" class="col-lg-10 col-sm-10" ><!-- #content starts -->
		
	        <iframe id="win" name="win" src="${ctx}/monitor/company/import/main" style="width:100%;border:0;" scrolling="no" onload="setWinHeight(this)"></iframe>
	    <!-- content ends -->
	    </div><!--/#content.col-md-0-->
    
   	 	<hr>

		<!-- 弹出框 -->
	    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal">×</button>
	                    <h3>设置</h3>
	                </div>
	                <div class="modal-body">
	                    <p>设置内容</p>
	                </div>
	                <div class="modal-footer">
	                    <a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>
	                    <a href="#" class="btn btn-primary" data-dismiss="modal">保存</a>
	                </div>
	            </div><!-- modal-content -->
	        </div><!-- modal-dialog -->
	    </div><!-- #myModal -->
  	
	</div><!-- 左侧导航和右侧信息栏 -->
	<footer class="row">
	         <p class="col-md-12 col-sm-12 col-xs-12 " align="center">版权所有：中国检验检疫学会产品追溯专业技术委员会、国家防伪工程技术研究中心产品追溯委员会</p>
	   		 <p class="col-md-12 col-sm-12 col-xs-12 " align="center">京ICP备12014821号-1&nbsp;&nbsp;&nbsp;地址：北京市朝阳区红军营南路15号瑞普大厦C座1603-1703</p>
	</footer>
		
</div><!--/.fluid-container-->
 	
 	<div id="bg" class="bg" style="display: none"></div>
	<div id="showPic" class="showPic" style="display: none;padding: 20px 10px;width:65%;left:400px;">
		<div style="float:right"><button class="btn btn-danger btn-sm" type="button" onclick="show()">关闭</button> </div>
		<div id="rate"></div>
	</div>
 	
 	
</body>
</html>