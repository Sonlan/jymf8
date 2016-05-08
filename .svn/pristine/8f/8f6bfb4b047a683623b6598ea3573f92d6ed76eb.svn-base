<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="common.jsp" %>
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
            <img alt="金源茂丰"  src="${ctx}/static/images/main_left_top.png" class="hidden-xs" style="float:left;margin-left:10px;height:50px;"/>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <a href="javascript:void(0)" class="hidden-sm hidden-xs">${sessionScope.companyMonitors.account}</a>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="${ctx}/monitor/logout">退出系统</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
			
			<div class="pull-right" style="padding-top: 10px;color:white;font-family: Microsoft Yahei">
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
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/count/hs"><span> HS分类统计  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/count/departCountry"><span> 启运国家统计  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/count/arrivalPort"><span> 到达港统计  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/count/destAddr"><span> 目的地统计  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/count/customsMonitor"><span> 直属局统计  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/main/"><span> 综合信息  </span></a></li>
                        <li ><a target="win" class="ajax-link" href="${ctx}/monitor/editPassWord/"><span> 修改密码  </span></a></li>
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
		
			<iframe id="win" name="win" src="${ctx}/monitor/count/hs" style="width:100%;border:0;" scrolling="no" onload="setWinHeight(this)"></iframe>
	        
	    <!-- content ends -->
	    </div><!--/#content.col-md-0-->
    
   	 	<hr>
	</div><!-- 左侧导航和右侧信息栏 -->
	<footer class="row">
	        <p class="col-md-12 col-sm-12 col-xs-12 " align="center">版权所有：中国检验检疫学会产品追溯专业技术委员会、国家防伪工程技术研究中心产品追溯委员会</p>
	   		<p class="col-md-12 col-sm-12 col-xs-12 " align="center">京ICP备12014821号-1&nbsp;&nbsp;&nbsp;地址：北京市朝阳区红军营南路15号瑞普大厦C座1603-1703</p>
	</footer>
		
</div><!--/.fluid-container-->
</body>
</html>