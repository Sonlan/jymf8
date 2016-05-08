<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@include file="../../common.jsp" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<meta name="renderer" content="webkit"> 
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/js/ichart.1.2.min.js"></script>
<script type="text/javascript">
$().ready(function(){
	 $("#biaoshitongji").addClass("active");
	qiyundi();
});

function qiyeshenqing(){
	var t = "货物统计";
	var data = [
	        	{name : '法国原瓶进口红酒AOC干红葡萄酒',value : 25,color:'#6f83a5'},
	        	{name : '拉菲古堡干红葡萄酒',value : 35,color:'#a5c2d5'},
	        	{name : '智利干露典藏卡曼纳干红葡萄酒',value : 30,color:'#cbab4f'},
	        	{name : '路易威干红葡萄酒',value : 10,color:'#76a871'}
        	];
	$("#rate").empty();
	pie(t,data);
	$("#qiyeshenqing").show().siblings().hide();
	$("#tiaojian").show();
}

function qiyepaiming(){
	var data = [
				{name : '北京三顺',value : 35.8,color : '#aa4643'},
				{name : '上海金辉',value : 30.12,color : '#89a54e'},
				{name : '江苏神和',value : 25.05,color : '#4572a7'},
				{name : '嘉禾实业',value : 1.2, color : '#80699b'}
			];
	t = "企业申请排名";
	$("#rate").empty();
	zhu(t,data);
	$("#qiyepaiming").show().siblings().hide();
	$("#tiaojian").show();
}

function qiyundi(){
	var data = [
				{name : '美国',value : 25000,color : '#aa4643'},
				{name : '韩国',value : 35000,color : '#89a54e'},
				{name : '日本',value : 15000,color : '#4572a7'},
				{name : '泰国',value : 25000, color : '#80699b'}
			];
	t = "启运地统计";
	$("#rate").empty();
	pie(t,data);
	$("#qiyundi").show().siblings().hide();
	$("#tiaojian").show();
}

function daodakouan(){
	var data = [
				{name : '北京口岸',value : 15000,color : '#4572a7'},
				{name : '北京丰台货运口岸',value : 35000,color : '#89a54e'},
				{name : '北京朝阳口岸',value : 25000,color : '#aa4643'},
				{name : '首都机场口岸',value : 25000, color : '#80699b'}
			];
	t = "到达口岸统计";
	$("#rate").empty();
	pie(t,data);
	$("#daodakouan").show().siblings().hide();
	$("#tiaojian").show();
}
function mudidi(){
	var data = [
				{name : '北京朝阳',value : 35000,color : '#89a54e'},
				{name : '北京海淀',value : 15000,color : '#4572a7'},
				{name : '北京东城',value : 25000, color : '#80699b'},
				{name : '北京西城',value : 25000,color : '#aa4643'}
			];
	t = "目的地统计";
	$("#rate").empty();
	pie(t,data);
	$("#mudidi").show().siblings().hide();
	$("#tiaojian").show();
}



function zhu(t,value){
	var data = value;

	var chart = new iChart.Column2D({
		render : 'rate',
		data : data,
		title : {
			text : t,
			color : '#3e576f'
		},
		width : 800,
		height : 400,
		label : {
			fontsize:11,
			color : '#666666'
		},
		animation : true,//开启过渡动画
		animation_duration:800,//800ms完成动画
		shadow : true,
		shadow_blur : 2,
		shadow_color : '#aaaaaa',
		shadow_offsetx : 1,
		shadow_offsety : 0,
		column_width : 62,
		sub_option : {
			listeners : {
				parseText : function(r, t) {
					return t + "万";
				}
			},
			label : {
				fontsize:11,
				fontweight:600,
				color : '#4572a7'
			},
			border : {
				width : 2,
				color : '#ffffff'
			}
		},
		coordinate : {
			background_color : null,
			grid_color : '#c0c0c0',
			width : 680,
			axis : {
				color : '#c0d0e0',
				width : [0, 0, 1, 0]
			},
			scale : [{
				position : 'left',
				start_scale : 0,
				scale_enable : false,
				label : {
					fontsize:11,
					color : '#666666'
				},
				listeners:{//配置事件
						parseText:function(t,x,y){//设置解析值轴文本
							return {text:t+"万"}
						}
					}
			}]
		}
	});
	
	chart.draw();
	$("#title_h2").text(t);
}

function pie(t,value){
	var data = value;
	
	new iChart.Pie2D({
		render : 'rate',
		data: data,
		title : t,
		legend : {
			enable : true,
			offsety :150
		},
		sub_option : {
			label : {
				background_color:null,
				sign:false,//设置禁用label的小图标
				padding:'0 4',
				border:{
					enable:false,
					color:'#666666'
				},
				fontsize:11,
				fontweight:600,
				color : '#4572a7'
			},
			border : {
				width : 2,
				color : '#ffffff'
			}
		},
		animation:true,
		showpercent:true,
		decimalsnum:2,
		width : 800,
		height : 450,
		radius:100
	}).draw();
	
	$("#title_h2").text(t);
}

function show(){
	$("#bg").fadeToggle('slow');
	$("#showPic").slideToggle('slow');
}

</script>
</head>
<body>

<div class="col-md-12" style="padding:0">
<div class="col-md-2">
<div class="row">
    <div class="box col-md-12" style="height:550px;">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2 >标识统计</h2>
    </div>
    <div class="box-content">
		<ul class="nav nav-pills nav-stacked main-menu">
            <li><a  href="javascript:qiyundi()"><span>启运地统计</span></a></li>
            <li><a  href="javascript:daodakouan()"><span>到达口岸统计</span></a></li>
            <li><a  href="javascript:mudidi()"><span>目的地统计</span></a></li>
            <li><a  href="javascript:qiyeshenqing()"><span>产品统计</span></a></li>
        </ul>
	</div>
</div>
</div>
</div>
</div>
<div class="col-md-10" >
<div class="row">
    <div class="box col-md-12"  style="height:450px;" >
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2 id="title_h2"></h2>
        <div style="float:right;margin-top:-15px">
            <a href="javascript:show()" class="btn btn-default btn-sm"><i class="glyphicon glyphicon-cog"></i>图形展示</a>
        </div>
    </div>
    <div class="box-content">
   		<div id="tiaojian" class="alert alert-info" style="padding:5px;margin-bottom:5px;">
			<form:form id="" class="form-inline" action="" method="post">
			   	<div class="form-group">
			      	<label>开始日期&nbsp;&nbsp;</label>
			        <input name="startDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="2014-7-1"  class="form-control input-sm" />&nbsp;&nbsp;
			  	</div>      
			   	<div class="form-group">
			      	<label>结束日期&nbsp;&nbsp;</label>
			        <input name="endDate" type="text" class="Wdate form-control input-sm" onclick="WdatePicker()" value="2014-7-16" class="form-control input-sm"/>
			  	</div>      
                <button type="submit" class="btn btn-primary btn-sm"> <i class="glyphicon glyphicon-zoom-in icon-white"></i>&nbsp;查 询</button>
			</form:form>
		</div>
   		<table id="qiyeshenqing" style="display: none;" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >货物ID</th>
	            <th >货物名称</th>
	            <th >HS编码</th>
	            <th >标识使用量(万)</th>
	            <th >比例</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>100001</td>
	    		<td>法国原瓶进口红酒AOC干红葡萄酒</td>
	    		<td>2204300000</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
	    	<tr>
	    		<td>100002</td>
	    		<td>拉菲古堡干红葡萄酒</td>
	    		<td>2204290000</td>
	    		<td>35</td>
	    		<td>35%</td>
	    	</tr>
	    	<tr>
	    		<td>100003</td>
	    		<td>智利干露典藏卡曼纳干红葡萄酒</td>
	    		<td>2204210000</td>
	    		<td>30</td>
	    		<td>30%</td>
	    	</tr>
	    	<tr>
	    		<td>100004</td>
	    		<td>路易威干红葡萄酒</td>
	    		<td>2204210000</td>
	    		<td>10</td>
	    		<td>10%</td>
	    	</tr>
   		</tbody>
   		</table>
   		
   		<table id="qiyepaiming" style="display: none" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >序号</th>
	            <th >企业名称</th>
	            <th >标识使用量(万)</th>
	            <th >比例</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>1</td>
	    		<td>北京三顺</td>
	    		<td>34.8</td>
	    		<td>33.9%</td>
	    	</tr>
	    	<tr>
	    		<td>2</td>
	    		<td>上海金辉</td>
	    		<td>30.12</td>
	    		<td>30.7%</td>
	    	</tr>
	    	<tr>
	    		<td>3</td>
	    		<td>江苏神和</td>
	    		<td>25.05</td>
	    		<td>22.3%</td>
	    	</tr>
	    	<tr>
	    		<td>4</td>
	    		<td>嘉禾实业</td>
	    		<td>1.5</td>
	    		<td>1.2%</td>
	    	</tr>
   		</tbody>
   		</table>

   		<table id="qiyundi" style="display: none" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >序号</th>
	            <th >启运地名称</th>
	            <th >标识使用量(万)</th>
	            <th >比例</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>1</td>
	    		<td>美国</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
	    	<tr>
	    		<td>2</td>
	    		<td>日本</td>
	    		<td>35</td>
	    		<td>35%</td>
	    	</tr>
	    	<tr>
	    		<td>3</td>
	    		<td>韩国</td>
	    		<td>15</td>
	    		<td>15%</td>
	    	</tr>
	    	<tr>
	    		<td>4</td>
	    		<td>泰国</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
   		</tbody>
   		</table>
   		
   		<table id="daodakouan" style="display: none" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >序号</th>
	            <th >到达口岸名称</th>
	            <th >标识使用量(万)</th>
	            <th >比例</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>1</td>
	    		<td>北京口岸</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
	    	<tr>
	    		<td>2</td>
	    		<td>北京丰台货运口岸</td>
	    		<td>35</td>
	    		<td>35%</td>
	    	</tr>
	    	<tr>
	    		<td>3</td>
	    		<td>北京朝阳口岸</td>
	    		<td>15</td>
	    		<td>15%</td>
	    	</tr>
	    	<tr>
	    		<td>4</td>
	    		<td>首都机场口岸</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
   		</tbody>
   		</table>
		
   		<table id="mudidi" style="display: none" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
	    <thead style="text-align: center;">
		    <tr >
			    <th >序号</th>
	            <th >目的地名称</th>
	            <th >标识使用量(万)</th>
	            <th >比例</th>
		    </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>1</td>
	    		<td>北京朝阳</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
	    	<tr>
	    		<td>2</td>
	    		<td>北京海淀</td>
	    		<td>35</td>
	    		<td>35%</td>
	    	</tr>
	    	<tr>
	    		<td>3</td>
	    		<td>北京东城</td>
	    		<td>15</td>
	    		<td>15%</td>
	    	</tr>
	    	<tr>
	    		<td>4</td>
	    		<td>北京西城</td>
	    		<td>25</td>
	    		<td>25%</td>
	    	</tr>
   		</tbody>
   		</table>
		
	
	</div>
</div>
</div>
</div>	
</div>
</div>
	
	<div id="bg" class="bg" style="display: none"></div>
	<div id="showPic" class="showPic" style="display: none;padding: 20px 10px;width:65%;left:400px;">
		<div style="float:right"><button class="btn btn-danger btn-sm" type="button" onclick="show()">关闭</button> </div>
		<div id="rate"></div>
	</div>
	
</body>
</html>