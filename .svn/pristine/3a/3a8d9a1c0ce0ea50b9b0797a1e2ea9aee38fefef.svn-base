//显示选择图片的页面
function changePicUrl(type){
	showDiv();
	parent.document.getElementById("pic_iframe").contentWindow.document.getElementById("pic_order").value=type;
	parent.document.getElementById("pic_iframe").contentWindow.delPic();
}  

// 删除图片
function delPic(type){
	var version = window.navigator.userAgent;
	if(version.substr(version.indexOf("MSIE") + 5, 1) >= 9 || version.substr(version.indexOf("MSIE") + 5, 1) == 1){
		$('#img'+type+'').css("filter","progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src='')");
	}
	document.getElementById('img'+type+'').src =Date();
	$('#imgFile'+type+'Name').val('');	 
		 
}

//打开遮罩
function showDiv(){
	parent.$("#bg").fadeToggle("1000");
	parent.$("#showPic").slideToggle("1000");
}

//关闭图片遮罩
function hidePicdiv() {
	parent.$("#bg").fadeToggle("1000");
	parent.$("#showPic").slideToggle("1000");
}


//关闭遮罩
function hidediv() {
	parent.$("#bg").fadeToggle("1000");
	parent.$("#show").slideToggle("1000");
}

//------------------计划单选择产品列表----------------------
function makeProductTable(data){
	var trCount = parseInt($("#productTable > div:last").attr("id"))+1;
	var flag=true;
	for(var i=0;i<=trCount-1;i++){
		if($("#id_"+i).val()== data.productId){
			flag=false;
		}
	}
	if(flag==true){
		html = "<div id='"+trCount+"' class='col-md-12' style='padding:0' algin='center'> " +
		   "<div class=' col-md-1 div_border' style='padding:0;height:30px;'>"+ data.productId+"<input id='id_"+trCount+"' name='productList["+trCount+"].productId' type='hidden' value='"+data.productId+"'/></div>" +
		   "<div class=' col-md-4 div_border' style='padding:0;height:30px;'>" + data.productName +"</div>" +
		   "<div class=' col-md-2 div_border' style='padding:0;height:30px;'>"+ data.count+"</div>" +
		   "<div class=' col-md-4 div_border' style='padding:0;height:30px;' align='left'><input id='count_"+trCount+"' name='productList["+trCount+"].count' type='text' onblur='checkNum(this,"+data.count+","+trCount+")' />" +
		   "<input id='flag_"+trCount+"' type='hidden' value=''/> </div>" +
		   "<div class=' col-md-1 div_border' style='padding:0;height:30px;'><a href='javascript:deleteProduct("+trCount+")' style='text-decoration: underline;'>删除</a></div></div>";
		$("#productTable").append(html);
	}else{
		alert("请勿重复添加");
	}
	
	
	
}
function checkNum(obj,availableCount,trId){
	var over = "<span id='error' style='color:red;'>超过可用数量</span>";
	var notNum = "<span id='error' style='color:red;'>非数字</span>";
	
	var flag = false;
	
	if(!isNaN(obj.value) && obj.value!=""){
		if(obj.value>availableCount){
			if($(obj)){
				$("#error").remove();
				$(obj).after(over);
			}
		}else{
			flag=true;
			$("#error").remove();
		}
	}else{
		$("#error").remove();
		$(obj).after(notNum);
	}
	
	
	
	$("#flag_"+trId).val(flag);
	
}

function deleteProduct(trNum){
	$("#"+trNum).remove();
}

function checkProductList(){
	var trCount = parseInt($("#productTable > div:last").attr("id"));
	var flag=true;
	if(trCount==-1){
		flag=false;
		alert("请至少选择一个产品");
	}else{
		for(var i=0;i<=trCount;i++){
			if($("#flag_"+i).val()=="false"){
				flag=false;
			}else if($("#flag_"+i).val()==""){
				$("#error").remove();
				$("#count_"+i).after("<span id='error' style='color:red;'>未填写</span>");
				flag=false;
			}
		}
	}
	return flag;
}

/*---------------下拉列表过滤 autocomplete------------------*/
$(document).ready(function(){
	$("body").click(function(e){
		if(e.target.id!="contentDiv" && e.target.id!="content_tr" && e.target.id!="searchDiv" 
			&& e.target.id!="result_div"  && e.target.id!="hnum" && e.target.id!="searchI" 
			&& e.target.id!="searchInput" ){
			$("#contentDiv").empty();
			$("#contentDiv").hide();
		}
	});
});