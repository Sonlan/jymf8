<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ page import="org.jymf.utils.Constants" %>
<%@include file="../../common.jsp" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/>
<link href="${ctx}/static/css/bottom.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<style type="text/css">
	.hnum:hover{
		cursor:pointer; 
	}
</style>

<script type="text/javascript">
$(function(){
    $("#addform").validate({
        rules: {
            name: {
                required:true
            },
            hsnum: {
                required:true
            },
            description: {
                byteMaxLength:1300
            },
            url: {
                url:true
            },
            queryDes:{
            	byteMaxLength:160
            }
        }
    });
    
    $("#editform").validate({
        rules: {
            password2: {
                equalTo:"#password"
            }
        } ,
        messages:{
            password2: {
        		equalTo:"您两次输入的密码不一致，请确认"
            }
        }
    });
});

//显示遮罩层
function showdiv(ids) { 
	parent.$("#bg").fadeToggle("1000");
	parent.$("#show").slideToggle("1000");
	parent.document.getElementById("ifm_ID").src="${ctx}/company/product/save?id="+ids;
}



var hnums = '${hnumsJson}';
function putProduct(id){
	var a = $.parseJSON(hnums);
	for(var i=0;i<a.length;i++){
		if(a[i].id==id){
			$("#product").text("用于 "+a[i].productName);
		}
	}
}
function showContent(obj){
	if($("#contentDiv").children().length==0){
		var width = $(obj).outerWidth();
		var height = $(obj).outerHeight();
		var left = $(obj).offset().left;
		var top = $(obj).offset().top;
		$("#contentDiv").attr("style","width:"+width+"px;height:300px;position:absolute;z-index:99;background-color:#FAEBD6;overflow:auto;").offset({top:top+height,left:left});
		var html = "<div id='searchDiv' class='input-group'style='padding:5px 10px;' ><div id='searchI' class='input-group-addon' ><i id='searchI' class='glyphicon glyphicon-search'></i></div><input id='searchInput'  onkeyup='fillContent(this)' type='text' class='form-control'></div>"+
				   "<div id='result_div' style='padding:5px 10px;'></div>";
		$("#contentDiv").append(html);
		var json_str = $.parseJSON(hnums);
		for(var i=0;i<json_str.length;i++){
			if(i < 1000){
				var html = "<div id='content_tr' class='content_tr' onclick='chooseResult(this)'>"+json_str[i].id+"_"+json_str[i].productName+"</div>";
				$("#result_div").append(html);
			}
		}
		$("#searchInput").focus();
	}
}

function fillContent(obj){
	$("#result_div").empty();
	var value = obj.value;
	var json_str = $.parseJSON(hnums);
	var j = 0;
	for(var i=0;i<json_str.length;i++){
		if(json_str[i].id.substring(0,value.length)==value){
			j++;
			if(j<1000){
				var html = "<div id='content_tr' class='content_tr'  onclick='chooseResult(this)'>"+json_str[i].id+"_"+json_str[i].productName+"</div>";
				$("#result_div").append(html);
			}
		}
		
	}	
}


function chooseResult(obj){

	var value=$(obj).text();
	var arr = value.split("_");
	$("#hnum").val(arr[0]);
	$("#product").text(arr[1]);
	$("#contentDiv").empty();
	$("#contentDiv").hide();
}


</script>
<title>货物添加 </title>

</head>
<body>
<div id="contentDiv" ></div>
<div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>货物信息添加</h2>
    </div>
    <div class="box-content">
   
	<form:form id="addform" modelAttribute="product" action="${ctx}/company/product/add" method="post">
    	<table class="table">
    		<tr><td style="border:0px solid ">
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">货物名称</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="name" value=""/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">HS编码</label></div>
				<div class="col-md-4">
					<input id="hnum" name="hsnum" type="text" class="form-control hnum" readonly="readonly" onclick="showContent(this)" placeholder="点击选择HS编码"/>
				</div>
				
			</div>
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
    			<div class="col-md-2" align="right"><label style="padding:5px;">生产地</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="origin" value=""/></div>
				<div class="col-md-2" align="right"><label style="padding:5px;">生产商</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="producer"  value=""/></div>
			</div>
				
    		<div class="col-md-12 form-group " style="vertical-align: bottom;" >
				<div class="col-md-2" align="right"><label style="padding:5px;">货物主页</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="url" value=""/></div>
				<!-- 
				<div class="col-md-6"><label style="padding:5px;" id="product"></label></div>
				 -->
				<div class="col-md-2" align="right"><label style="padding:5px;">进口商</label></div>
				<div class="col-md-4"><input type="text" class="form-control" name="importer" value=""/></div> 
			</div>
			 <div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">货物描述</label></div>
				<div class="col-md-10"><textarea class="textare" maxlength="200" style="width:100%;border:1px solid #CCCCCC" rows="5" class="form-control"  name="description"></textarea></div>
			</div>  
			 <div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">查询结果描述</label></div>
				<div class="col-md-10">
					支持80个字，前缀：您所查询的是
					<textarea class="textare" maxlength="80" style="width:100%;border:1px solid #CCCCCC" rows="5" class="form-control"  name="queryDes"></textarea>
				</div>
			</div>
			<div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">货物概述图片</label></div>
				<div class="col-md-10">
                    <button id="imgFile3" name="summFiles" type="button" class="btn btn-primary btn-sm" onclick="changePicUrl(3)">
                    	<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加
                    </button>
                    <button name="dels" type="button" class="btn btn-default btn-sm" onclick="delPic(3)">
                    	<i class="glyphicon glyphicon-minus-sign"></i>&nbsp;删除
                    </button>
                    <input type="hidden" id="imgFile3Name" name="productImgs[3].fileName" value=""/> 
				</div>
			</div>  
			
			<div class="col-md-12 form-group " >
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<img style="margin-top:25px;margin-left: 30px;" id="img3"  name="imgs" 
								width="<%=Constants.PHOTO_IMG_WIDTH %>px" src="${ctx}/static/images/no_pic.png"  />
				</div>
			</div>  
			
			<div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">货物描述图片</label></div>
				 <c:forEach var="i" begin="0" end="2" step="1"> 
                   	<div class="col-md-3"> 
                       <button id="imgFile${i}" name="imgFiles"type="button" class="btn btn-primary btn-sm" onclick="changePicUrl(${i})">
  							<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加
                       </button>
                       <button name="dels" type="button" class="btn btn-default btn-sm" onclick="delPic(${i})">
							<i class="glyphicon glyphicon-minus-sign"></i>&nbsp;删除
                       </button>
                       <input type="hidden" id="imgFile${i}Name" name="productImgs[${i}].fileName" /> 
                    </div>
                </c:forEach> 
			</div>
				
			<div class="col-md-12 form-group " >
				<div class="col-md-2 " ></div>
				<c:forEach var="i" begin="0" end="2" step="1"> 
                   <div class="col-md-3" >
                       <img style="margin-top:25px;margin-left: 30px;" id="img${i}" name="imgs" 
                       		width="<%=Constants.PHOTO_IMG_WIDTH %>px" src="${ctx}/static/images/no_pic.png" />
                 	</div>
               </c:forEach> 
			</div>  
			
			<div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">规格参数</label></div>
				<div class="col-md-2">
					<button class="btn btn-primary btn-sm" type="button" onclick="showdiv('gx');">
						<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加
					</button>  
					<button class="btn btn-primary btn-sm" type="button" onclick="parent.showPhone('gx');">
						<i class="glyphicon glyphicon-search"></i>&nbsp;预览
					</button>  
				</div>
			</div>
			<div class="col-md-12 form-group " >
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<table width="80%" class="jymf_table_para">
                        <thead style="text-align:center">
                           <tr>
                               <td width="100">名称</td>
                               <td width="200">内容</td> 
                               <td width="32">操作</td>
                           </tr>
                        </thead>
                        <tbody id="gx"></tbody>
                    </table>
					
                </div>
			</div>
			
			<div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">工艺流程</label></div>
				<div class="col-md-2">
					<button class="btn btn-primary btn-sm" type="button" onclick="showdiv('bz');">
						<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加
					</button>  
				
					<button class="btn btn-primary btn-sm" type="button" onclick="parent.showPhone('bz');">
						<i class="glyphicon glyphicon-search"></i>&nbsp;预览
					</button>  
				</div>
			</div>
			<div class="col-md-12 form-group " >
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<table width="80%" class="jymf_table_para">
                        <thead style="text-align:center">
                           <tr>
                               <td width="100">名称</td>
                               <td width="200">内容</td> 
                               <td width="32">操作</td>
                           </tr>
                        </thead>
                        <tbody id="bz"></tbody>
                    </table>
                </div>
			</div>
			
			<div class="col-md-12 form-group " >
				<div class="col-md-2" align="right"><label style="padding:5px;">其他信息</label></div>
				<div class="col-md-2">
					<button class="btn btn-primary btn-sm" type="button" onclick="showdiv('yl');">
						<i class="glyphicon glyphicon-plus-sign"></i>&nbsp;添加
					</button>  
				
					<button class="btn btn-primary btn-sm" type="button" onclick="parent.showPhone('yl');">
						<i class="glyphicon glyphicon-search"></i>&nbsp;预览
					</button>  
				</div>
				
			</div>
			<div class="col-md-12 form-group " >
				<div class="col-md-2"></div>
				<div class="col-md-10">
					<table width="80%" class="jymf_table_para">
                        <thead style="text-align:center">
                           <tr>
                               <td width="100">名称</td>
                               <td width="200">内容</td> 
                               <td width="32">操作</td>
                           </tr>
                        </thead>
                        <tbody id="yl"></tbody>
                    </table>
                </div>
			</div>
			<div class="col-md-12 form-group ">
				<div class="col-md-6" >
					<button class="btn btn-success col-md-offset-6 col-md-5" type="submit">保&nbsp;&nbsp;&nbsp;存</button>
				</div>
				<div class="col-md-6">
					<button class="btn btn-default col-md-5" type="button" 
                           onclick="javascript:window.location.href='${ctx}/company/product/main/'">取&nbsp;&nbsp;&nbsp;消</button>
				</div>					
			</div>
			</td></tr>
			</table>
    	</form:form>
	
	</div>
</div>
</div>
</div>
</body>

</html>