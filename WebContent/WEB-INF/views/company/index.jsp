<%@ page contentType="text/html;charset=UTF-8"%>
<%@include file="common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>金源茂丰</title>
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<link type="text/css" rel="stylesheet" href="${ctx}/static/css/zhezhao.css" /> 
	<script type="text/javascript" src="${ctx}/static/js/tab.js"></script>
	<script type="text/javascript">
		$().ready(function(){
			//phone background
			$("#phonePic").niceScroll({cursorborder:"#00F",cursorcolor:"#CAC9CE",boxzoom:false,cursorwidth: "3px"});
			var id = '${sessionScope.companyuser.id}';
			var ids = id.split("_");
			$("#user_id").html(ids[0]);
			
			$("a").bind('click',function(){
				change($(this));
			}); 
		});
		
		//iframe height self setted
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
			if(iClass.indexOf("glyphicon-chevron-right")>0){
				$(obj).children("i").attr("class","glyphicon glyphicon-chevron-down");
			}else if(iClass.indexOf("glyphicon-chevron-down")>0){
				$(obj).children("i").attr("class","glyphicon glyphicon-chevron-right");
			}
			$(obj).siblings("ul").toggle(400);
			closeOtherUl($(obj));
		}
		
		function closeOtherUl(obj){
			var lis = $(obj).parent().siblings();
			$.each($(lis),function(i,n){
				$(n).children("a").children("i").attr("class","glyphicon glyphicon-chevron-right");
				$(n).find("ul").hide(400);
			})
			
		}
	
	</script>
</head>
<body>
	<!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-inner" >
            <img alt="金源茂丰"  src="${ctx}/static/images/main_left_top.png" class="hidden-xs" style="float:left;margin-left:10px;height:50px;"/>
            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <a href="javascript:void(0)" id="user_id"></a>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="${ctx}/company/logout">退出系统</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->
			<div class="pull-right" style="padding-top: 10px;font-family: Microsoft Yahei">
				<i class=" glyphicon glyphicon-tags"></i>&nbsp;&nbsp;组织机构代码：<a href="javascript:void(0);" id="com_id"> ${sessionScope.companyuser.license} </a>&nbsp;&nbsp;&nbsp;&nbsp;
				<i class="glyphicon glyphicon-user"></i>&nbsp;&nbsp;企业用户：
			</div>
        </div>
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div id="side" class="sidebar-nav" style="height:500px;">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">
                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                       <li class="nav-header" style="font-size:15px;">系统功能</li>
                       
                       <c:if test="${fn:contains(sessionScope.authority,'010000') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       <li class="accordion">
                            <a class="ajax-link" href="javascript:void(0)" ><i class="glyphicon glyphicon-chevron-right"></i><span> 企业信息 </span></a>
                            <ul class="nav nav-pills nav-stacked">
                               	<c:if test="${fn:contains(sessionScope.authority,'010100') || fn:contains(sessionScope.companyuser.id,'admin')}">
                               		<li ><a target="win" href="${ctx}/company/update/"><span> 基本信息 </span></a></li>
                               	</c:if>
                               	<c:if test="${fn:contains(sessionScope.authority,'010200') || fn:contains(sessionScope.companyuser.id,'admin')}">
                               		<li ><a target="win" href="${ctx}/company/equipment/main/"><span> 设备管理 </span></a></li>
                       			</c:if>
                       			<c:if test="${fn:contains(sessionScope.authority,'010300') || fn:contains(sessionScope.companyuser.id,'admin')}">	
                       				<li ><a target="win" href="${ctx}/company/user/main/"><span> 账户管理 </span></a></li>
                       			</c:if>
                       			<c:if test="${fn:contains(sessionScope.authority,'010400') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       				<li ><a target="win" href="${ctx}/company/updpwd/"><span> 修改密码</span></a></li>
                       			</c:if>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${fn:contains(sessionScope.authority,'020000') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       <li class="accordion">
                            <a class="ajax-link" href="javascript:void(0)"><i class="glyphicon glyphicon-chevron-right"></i><span> 货物信息 </span></a>
                            <ul class="nav nav-pills nav-stacked">
                             <c:if test="${fn:contains(sessionScope.authority,'020100') || fn:contains(sessionScope.companyuser.id,'admin')}">
                                <li ><a target="win" href="${ctx}/company/product/main/"><span> 基本信息 </span></a></li>
                       		</c:if>
                       		<c:if test="${fn:contains(sessionScope.authority,'020200') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       			<li ><a target="win" href="${ctx}/company/beforeImport/main/"><span> 入境前信息 </span></a></li>
                       		</c:if>
                       		<c:if test="${fn:contains(sessionScope.authority,'020300') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       			<li ><a target="win" href="${ctx}/company/afterImport/main/"><span> 入境后信息 </span></a></li>
                       		</c:if>
                       		<c:if test="${fn:contains(sessionScope.authority,'020400') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       			<li ><a target="win" href="${ctx}/company/importPlan3/main/"><span> 货物流向 </span></a></li>
                       		</c:if>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${fn:contains(sessionScope.authority,'040000') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       <li class="accordion">
                            <a class="ajax-link" href="javascript:void(0)"><i class="glyphicon glyphicon-chevron-right"></i><span>标识管理</span></a>
                            <ul class="nav nav-pills nav-stacked">
                       		<c:if test="${fn:contains(sessionScope.authority,'040100') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       			<li ><a target="win" href="${ctx}/company/label/main/"><span> 标识申请 </span></a></li>
                            </c:if>
                            <c:if test="${fn:contains(sessionScope.authority,'040200') || fn:contains(sessionScope.companyuser.id,'admin')}">
                               <li class="accordion" >
                               		<a target="win" href="${ctx}/company/count/main"><span> 标识统计 </span></a>
                               		<ul class="nav nav-pills nav-stacked">
                               			<li ><a target="win" href="javascript:void(0)"><span> 启运地统计 </span></a></li>
                               			<li ><a target="win" href="javascript:void(0)"><span> 到达口岸统计 </span></a></li>
                               			<li ><a target="win" href="javascript:void(0)"><span> 目的地统计 </span></a></li>
                               			<li ><a target="win" href="javascript:void(0)"><span> 产品统计 </span></a></li>
                               		</ul>
                               </li>
		                       </c:if>
                            </ul>
                        </li>
                        </c:if>
                         <c:if test="${fn:contains(sessionScope.authority,'030000') || fn:contains(sessionScope.companyuser.id,'admin')}">
                       <li class="accordion">
                            <a class="ajax-link" href="javascript:void(0)"><i class="glyphicon glyphicon-chevron-right"></i><span> 统计信息 </span></a>
                            <ul class="nav nav-pills nav-stacked">
		                       <c:if test="${fn:contains(sessionScope.authority,'030100') || fn:contains(sessionScope.companyuser.id,'admin')}">
		                       		<li ><a target="win" href="${ctx}/company/count/outPutMain"><span> 出库统计 </span></a></li>
		                       </c:if>
                            </ul>
                        </li>
                        </c:if>
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
		<div id="content" class="col-lg-10 col-sm-10" style="padding:0"><!-- #content starts -->
		<c:if test="${fn:contains(sessionScope.authority,'010100') || fn:contains(sessionScope.companyuser.id,'admin')}">
			<iframe id="win" name="win" src="${ctx}/company/update/" style="width:100%;border:0;" scrolling="no" onload="setWinHeight(this)"></iframe>
		</c:if>
	    </div><!--/#content.col-md-0-->
   	 	<hr>
	</div><!-- 左侧导航和右侧信息栏 -->
	<br>
	<footer class="row">
	        <p class="col-md-12 col-sm-12 col-xs-12 " align="center">版权所有：中国检验检疫学会产品追溯专业技术委员会、国家防伪工程技术研究中心产品追溯委员会</p>
	   		<p class="col-md-12 col-sm-12 col-xs-12 " align="center">京ICP备12014821号-1&nbsp;&nbsp;&nbsp;地址：北京市朝阳区红军营南路15号瑞普大厦C座1603-1703</p>
	</footer>
</div><!--/.fluid-container-->
	<!-- 遮罩 -->
	<div id="bg" class="bg" style="display: none"></div>
	<!-- 图片剪切框 -->
	<div id="showPic" class="showPic" style="display: none;padding: 20px 10px;">
		<iframe src="${ctx}/common/pic" id="pic_iframe" style="width:100%;height:95%;border:0px;" scrolling="no"></iframe>   			
	</div>
	<!-- 产品参数框 -->
	<div id="show" class="show_zhezhao" style="display: none"> 
	    <div class="show_top" ><input type="button" onclick="hidediv();" value=""/></div>
	    <iframe id="ifm_ID" width="100%" height="90%" frameborder="no" scrolling="no" ></iframe>
	</div>
	<!-- 手机背景图 -->
	<div class='phoneBack'><div id='phonePic'></div></div>
</body>
</html>