<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>金源茂丰</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/zhezhao.css" /> 
	<script type="text/javascript" src="${ctx}/static/js/tab.js"></script>
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
            <img alt="金源茂丰"  src="${ctx}/static/images/main_left_top.png" class="hidden-xs" style="float:left;margin-left:10px;height:50px;"/>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <a href="javascript:void(0)" class="hidden-sm hidden-xs">${sessionScope.adminuser.name}</a>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="${ctx}/monitor/logout">退出系统</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
			
			<div class="pull-right" style="padding-top: 10px;color:white;font-family: Microsoft Yahei">
				<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;管理员：${sessionScope.adminuser.name}
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
                        <li ><a target="win" class="ajax-link" href="${ctx}/admin/company/main/"><span> 企业信息  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/admin/monitor/main/"><span> 监管部门  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/admin/equipment/main/"><span> 设备管理  </span></a></li>
                        <!-- <li ><a target="win" class="ajax-link" href="${ctx}/admin/agent/main/"><span> 代理商  </span></a></li> -->
                        <li ><a target="win" class="ajax-link" href="${ctx}/admin/labelIndex/main/"><span> 标签卷  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/admin/logs/main/"><span> 日志  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/admin/roles/main/"><span> 用户管理  </span></a></li>
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
		
			<iframe id="win" name="win" src="${ctx}/admin/main" style="width:100%;border:0;" scrolling="no" onload="setWinHeight(this)"></iframe>
	        
	    <!-- content ends -->
	    </div><!--/#content.col-md-0-->
    
   	 	<hr>
	</div><!-- 左侧导航和右侧信息栏 -->
	<footer class="row">
	        <p class="col-md-12 col-sm-12 col-xs-12 " align="center">版权所有：中国检验检疫学会产品追溯专业技术委员会、国家防伪工程技术研究中心产品追溯委员会</p>
	   		<p class="col-md-12 col-sm-12 col-xs-12 " align="center">京ICP备12014821号-1&nbsp;&nbsp;&nbsp;地址：北京市朝阳区红军营南路15号瑞普大厦C座1603-1703</p>
	</footer>
		
</div><!--/.fluid-container-->
<!-- 遮罩 -->
<div id="bg" class="bg" style="display: none"></div>
<!-- 信息查询选择DIV -->
<div id="show" class="show_zhezhao" style="display: none"> 
    <div class="show_top" ><input type="button" onclick="hidediv();" value=""/></div>
    <iframe id="ifm_cp" width="100%" height="90%" frameborder="no" scrolling="no" ></iframe>
</div>
</body>
</html>