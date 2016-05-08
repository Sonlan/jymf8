<%@ page contentType="text/html;charset=UTF-8" %>
<%@include file="../../common.jsp" %>
<html>
<head>
<meta name="renderer" content="webkit"> 
<style>
ul,p{padding:0; margin:0;}
.times {display:block;margin:30px 0px;}
.times ul {margin-left:25px;border-left:2px solid #ddd;}
.times ul li {width:100%;margin-left:-12px;font-weight:narmal; list-style:none;margin-bottom: 30px;}
.times ul li b {width:10px;height:10px;background:#fff;border:2px solid #555;margin:5px;border-radius:6px;-webkit-border-radius:6px;-moz-border-radius:6px;overflow:hidden;display:inline-block;float:left;}
.times ul li .last {color:#ff6600;}
.times ul li span {padding-left:20px;font-size:16px;line-height:20px;color:#555;}
.times ul li:hover b {border:2px solid #ff6600;}
.times ul li:hover span {color:#ff6600;}
.span_title{margin-left: 0px;font-size: 20px;font-family: SimHei;}
</style>


</head>
<body>
    
    <div class="row">
    <div class="box col-md-12">
    <div class="box-inner">
    <div class="box-header well" data-original-title="">
        <h2>溯源信息</h2>
    </div>
    <div class="box-content">
    
   		<table class="table">
   			<tr >
   				<td style="border:0px solid ">
   					<div class="times" style="padding-left: 20px;">
	   					<div class="span_title">ID号:&nbsp;${plan.planId}&nbsp;&nbsp;${plan.proName}</div>
	   					<div class="span_title">入境检验检疫证书编号:&nbsp;${plan.hnum }</div>
					</div>
					<div class="times">
					<ul>
					<c:if test="${plan.proProduceDate != null && plan.proProduceDate != ''}">
						<li><b></b>
							<span>生产日期</span>
							<span><fmt:formatDate value="${plan.proProduceDate}" pattern="yyyy-MM-dd"/></span>
							<span>生产批号&nbsp;&nbsp;&nbsp;${plan.proProduceNum}</span><br>
						</li>
					</c:if>
					<c:if test="${plan.proFactoryDate != null && plan.proFactoryDate != ''}">
						<li><b></b>
							<span>出厂日期</span><span><fmt:formatDate value="${plan.proFactoryDate}" pattern="yyyy-MM-dd"/></span>
							<span></span>
						</li>
					</c:if>
					<c:if test="${plan.departDate != null && plan.departDate != ''}">
						<li><b></b><span>启运日期</span><span><fmt:formatDate value="${plan.departDate}" pattern="yyyy-MM-dd"/></span>
							<span>由  ${plan.departCountry}  的  ${plan.departPort}  启运,拟运达  ${plan.arrivalPortPlan}  </span>
						</li>
					</c:if>
					<c:if test="${plan.arrivalDate != null && plan.arrivalDate != ''}">
						<li><b></b><span>到达日期</span><span><fmt:formatDate value="${plan.arrivalDate}" pattern="yyyy-MM-dd"/></span>
							<span>抵达北京港口</span>
						</li>
					</c:if>
					<c:if test="${plan.inspectDate != null && plan.inspectDate != ''}">
						<li><b></b><span>报检日期</span><span>
							<fmt:formatDate value="${plan.inspectDate}" pattern="yyyy-MM-dd"/></span><span></span>
						</li>
					</c:if>
					<c:if test="${plan.releaseDate != null && plan.releaseDate != ''}">
						<li><b></b><span>放行日期</span><span><fmt:formatDate value="${plan.releaseDate}" pattern="yyyy-MM-dd"/></span><span >目的地 ${plan.destAddr}</span></li>
					</c:if>
					<c:if test="${plan.firstStop != null && plan.firstStop != ''}">
						<li><b></b><span>一级流向</span><span>${plan.firstStop }</span></li>
					</c:if>
					<c:if test="${plan.secondStop != null && plan.secondStop != ''}">
						<li><b></b><span >二级流向</span><span>${plan.secondStop }</span></li>
					</c:if>
					</ul>
					</div>

   				</td>
   			</tr>
   		</table>
    </div>
    </div>
    </div> <!--/span-->
    </div><!--/row-->
</body>
</html>