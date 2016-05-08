<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/tree/js/jquery.ztree.all-3.5.min.js"></script>
<link href="${ctx}/static/tree/css/zTreeStyle/zTreeStyle.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/static/tree/css/tree.css" type="text/css" rel="stylesheet"/>
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
		$("#monitorPid").val(treeNode.pId);
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
    <div class="box col-md-12" >
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2 id="title_h2">直属局统计</h2>
    </div>
    <div class="box-content">
   		<div  class="alert alert-info" style="padding:5px;margin-bottom:5px;">
			<form:form id="fenye" class="form-inline" action="${ctx}/monitor/count/queryCustomsMonitor" method="post">
				<div class="form-group">
			      	<label>监管部门&nbsp;&nbsp;&nbsp;</label>
			      	<input id="monitorValue" name="monitor.id" value="${count.monitor.id}" type="text" style="display: none;"/>
			      	<input id="monitorPid" name="monitor.pId" value="${count.monitor.pId}" type="hidden"/>
			      	<input id="monitor"  name="monitor.name" value="${count.monitor.name}" type="text" class="form-control input-sm" onclick="showMenu(); return false;" placeHolder="点击选择" style="cursor: pointer;"/>
			      	<div id="menuContent" class="menuContent" style="display:none; position: absolute; z-index: 999">
						<ul id="treeDemo" class="ztree" style="margin-top:0; width:260px;"></ul>
					</div>
			  	</div>          
			   	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${count.startDate}"  class="form-control input-sm" />&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="${count.endDate}" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
   		<table class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
	            <th >直属局</th>
	            <th >HS编码</th>
	            <th >HS编码名称</th>
	            <th >标识使用量</th>
		    </tr>
	    </thead>
	    <tbody>
			<c:forEach var="r" items="${pageView.records}">
	        <tr >
	         	<td>${r.monitorName}</td>
	            <td>${r.hsnum}</td>
	            <td>${r.hsname}</td>
	            <td>
	            	<c:if test="${r.hsname!=null && r.hsname!=''}">${r.hscount}</c:if>  
	            	<c:if test="${r.hsname==null || r.hsname==''}">&nbsp;</c:if>  
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
	                </tr> 
	            </c:forEach> 
	        </c:if>
   		</tbody>
   		</table>
   		<div align="center">
	    	<%@include file="../../common/webfenye.jsp" %>
	    </div>
	</div>
</div>
</div>
</div>	
</body>
</html>