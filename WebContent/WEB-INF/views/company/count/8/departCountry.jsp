<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
</head>
<body>

<div class="col-md-12" style="padding:0">
<div class="col-md-12" >
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

   		<table id="qiyundi" class="table table-striped table-hover table-bordered bootstrap-datatable datatable responsive">
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
   		 <div align="center">
	    	<%@include file="../../../common/webfenye.jsp" %>
	    </div>
	</div>
</div>
</div>
</div>	
</div>
</div>
</body>
</html>