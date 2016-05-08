<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="common.jsp" %>
<html>
<head>
<link href="${ctx}/static/tree/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/static/tree/css/tree.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/tree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript">
	var customsMonitor = eval('${customsMonitor}');
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, customsMonitor);
	});
	var setting = {
		view: {
			dblClickExpand: false
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick: onClick
		}
	};

	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
		nodes = zTree.getSelectedNodes(),
		v = "";
		nodes.sort(function compare(a,b){return a.id-b.id;});
		for (var i=0, l=nodes.length; i<l; i++) {
			v += nodes[i].name + ",";
		}
		if (v.length > 0 ) { v = v.substring(0, v.length-1);}
		$("#monitor").val(v);
		$("#monitorValue").val(treeNode.id);
		
		hideMenu();
	}

	function showMenu() {
		var cityObj = $("#monitor");
		var cityOffset = $("#monitor").offset();
		$("#menuContent").css({left:(cityOffset.left +15)+ "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
		parent.$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#menuContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
		parent.$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
			hideMenu();
		}
	}

</script>
</head>

<body>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>综合信息</h2>
    </div>
    <div class="box-content">
    	<div class="alert alert-info">
			<form:form id="fenye" name="fenye" class="form-inline" modelAttribute="company" action="${ctx}/monitor/main" method="post">
			   	<div class="form-group">
			      	<label>监管部门&nbsp;&nbsp;&nbsp;</label>
					<input id="monitorValue" name="monitorId" value="${company.monitorId}" type="text" style="display: none;"/>
			      	<input id="monitor"  name="monitorName" value="${company.monitorName}" type="text" class="form-control input-sm" onclick="showMenu(); return false;" placeHolder="点击选择" style="cursor: pointer;"/>
			      	<div id="menuContent" class="menuContent" style="display:none; position: absolute; z-index: 999">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:260px;"></ul>
					</div>
			  	</div>      
			   	<div class="form-group">
			      	<label>企业名称&nbsp;&nbsp;&nbsp;</label>
			        <input  type="text" class="form-control input-sm" name="name" value="${company.name}"/>&nbsp;&nbsp;
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
	    <table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >企业名称</th>
	            <th >组织机构代码</th>
	            <th >企业地址</th>
	            <th >企业电话</th>
	            <th >联系人</th>
	            <th >当前状态</th>
	            <th >产品详细</th>
		    </tr>
	    </thead>
	    <tbody>
		      <c:forEach var="company" items="${pageView.records}">
	            <tr >
	                <td >
	                    <a title="${company.name}">${company.name}</a>
	                </td>
	                <td>${company.licenseNum}</td>
	                <td>${company.address}</td>
	                <td>${company.tel}</td>
	                <td>${company.person}</td>
	                <td>
	             		<c:if test="${company.status eq '0'}">正常</c:if>
	                    <c:if test="${company.status eq '1'}">挂起</c:if>
	                </td>
					<td align="center">
					    <c:if test="${company.workMode ne '1' }">
	                        <div class="small_btn">
	                        <a class="btn btn-info btn-sm" target="_top" href="${ctx}/monitor/company/${company.id}" >
	                        	<i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;详细
	                        </a>
	                        </div>
	                     </c:if>
	                </td>
	            </tr>
            </c:forEach>
		        
	        <c:if test="${pageView.pageNum < pageView.pageSize }">
	            <c:forEach begin="${pageView.pageNum}" end="${pageView.pageSize -1 }" step="1"> 
	                <tr>
	                    <td>&nbsp;</td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                    <td></td>
	                </tr> 
	            </c:forEach> 
	        </c:if>
	    </tbody>
	    </table>
	    <div align="center">
	    	<%@include file="../common/webfenye.jsp" %>
	    </div>
    </div>
    </div>
    </div><!--/span-->
    </div><!--/row-->
</body>
</html>