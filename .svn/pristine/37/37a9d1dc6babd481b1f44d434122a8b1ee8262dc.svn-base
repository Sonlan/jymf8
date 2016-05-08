
//隐藏遮罩层
function hidediv() {
	$("#bg").fadeToggle("1000");
	$("#show").slideToggle("1000");
}

//定义变量
var name="";
var value="";
//定义数组变量
var param=[];

//获取遮罩层input的值
function functionName(){
	name=document.getElementById("ifm_ID").contentWindow.document.getElementById("name").value;
	value=document.getElementById("ifm_ID").contentWindow.document.getElementById("value").value;
	
	//把获取到input的值保存起来
	var data=[];
	data.push(name);
	data.push(value);
		
	//保存data数组
	param.push(data);
}


//添加tr
function add_tr(ids) {
	//获取table的行数
	var rowcount = document.getElementById("win").contentWindow.document.getElementById(ids).rows.length;
	var cnt = 1;
	//循环table的每一行的第一列值
	for(var i=0;i<rowcount;i++){
		var trtd = document.getElementById("win").contentWindow.document.getElementById(ids).rows[i].cells[0].innerText;
		//判断文本框的值是否重复
		if(trtd==name){
			cnt=-1;
			alert('产品名称重复,请重新输入!');
		} 	
	}
	if(cnt!=-1){
		//追加的td
		$str = '';
	    /*$str += "<tr align='left'>";*/
		$str += "<tr align='left' class='jymf_tr table_1_tr'>";
	    $str += "<td><input type='hidden' name='productPara." + ids + "[" + rowcount + "].name' value='" +  name + "' />"  + name + "</td>";
        $str += "<td><input type='hidden' name='productPara." + ids + "[" + rowcount + "].value' value='" + value + "' />"  +  value + "</td>";
        
	    $str += "<td onClick='parent.getDel(this)'><a href='javascript:;'>删除</a></td>";
	    $str += "</tr>";
	    document.getElementById("win").contentWindow.$("#" + ids).append($str);
	    var frameHeight = $("#win").height();
	    $("#win").height((frameHeight + 40)+"px") ; 
	}
	
	return cnt;
}


//删除tr
function getDel(k){
   var showMsg="确定要删除该记录?";
   if(!confirm(showMsg))
		return ;
   $(k).parent().remove();    
}

