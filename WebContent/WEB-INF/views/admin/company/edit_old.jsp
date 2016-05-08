<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="org.jymf.utils.Constants" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
<link href="${ctx}/static/css/zhezhao.css" type="text/css" rel="stylesheet"/> 
<script type="text/javascript" src="${ctx}/static/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${ctx}/static/jquery-validation/1.11.1/additional.js"></script>
<script type="text/javascript" src="${ctx}/static/js/common.js"></script>
<title>企业添加 </title>
<script type="text/javascript">
$(document).ready(function(){
    $("#admin-company").addClass("active");
    /** 表单验证    */
    $("#editform").validate({
        rules: {
            name: {
                required:true
            },
            capital: {
            	digits:true
            },
            auditValid:{
            	digits:true
            },
            scope: {
                byteMaxLength:340
            },
            url: {
                url:true
            },
            tel : {
                isPhone : true
            },
        }
    });
});

</script>

</head>
<body>
<div style="margin-left:200px;">
<form:form id="editform" modelAttribute="company" action="${ctx}/admin/company/update" 
           method="post" enctype ="multipart/form-data">
    <input type="hidden" name="id" value="${company.id}"/>
    <input type="hidden" name="workMode" value="${company.workMode}"/>
    
    <div class="add_top">
        <div class="head_describe">公司基本信息</div>
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td>公&nbsp;司&nbsp;名&nbsp;称
                    <input type="text" maxlength="80" class="text" name="name" value="${company.name}"/>
                    <span class="must">*</span>
                </td>
                <td class="jj">
                    <span class="td">公司注册号
                        <input type="text" maxlength="100" class="text" name="licenseNum" value="${company.licenseNum}" />
                    </span>
                </td>
            </tr>
            <tr>
                <td>法&nbsp;人&nbsp;代&nbsp;表
                    <input type="text" maxlength="40" class="text" name="person" value="${company.person}"/>
                </td>
                <td>
                    <span class="td">公司注册地
                        <input type="text" maxlength="80" class="text" name="address" value="${company.address}"/>
                    </span>
                </td>
            </tr>
            <tr>
                <td colspan="2">注&nbsp;册&nbsp;资&nbsp;金
                    <input type="text" class="text" name="capital" maxlength="10" value="${company.capital}" />
                </td>
            </tr>
        </table>
        
        <table border="0"  cellpadding="0" cellspacing="0" >
            <tr align="center">
                <td>经&nbsp;营&nbsp;范&nbsp;围</td>
                <td>
                    <textarea class="textare" name="scope">${company.scope}</textarea>
                </td>
            </tr>
        </table>
        
        <table border="0" cellpadding="0" cellspacing="0" >
            <tr align="center">
                <td>公&nbsp;司&nbsp;描&nbsp;述</td>
                <td>                                                 
                    <textarea class="textare" name="depict.depicts">${company.depict.depicts}</textarea>
                </td>
            </tr>
        </table>
    </div>
    
    <div class="add_bottom">
    <div class="head_describe">审核信息</div>
        <table border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td>当&nbsp;前&nbsp;状&nbsp;态
                    <form:select path="status" class="select" items="${statusMap}" value="${company.status}"/>
                </td>
            </tr>
            <tr>
                <td>审&nbsp;核&nbsp;日&nbsp;期
                    <input name="auditTime" type="text" class="Wdate" onclick="WdatePicker()"
                           value="<fmt:formatDate value="${company.auditTime}" type='date'/>" />
                </td>
                <td class="td">
                    <span class="td">&nbsp;&nbsp;有&nbsp;&nbsp;效&nbsp;日&nbsp;期</span>
                    <input class="text" type="text" name="auditValid" 
                           value="${company.auditValid}" maxlength="3"/>&nbsp;&nbsp;(年)
                    
                </td>
            </tr>
        </table>
    </div>
    
    <div class="add_center">
        <div class="head_describe">公司其他信息</div>
        <table border="0px" cellpadding="0" cellspacing="0">
            <tr>
                <td>主&nbsp;页&nbsp;地&nbsp;址
                    <input type="text" class="text" name="url" value="${company.url}" maxlength="200"/>
                </td>
                <td>
                    <span class="td">&nbsp;&nbsp;举&nbsp;&nbsp;报&nbsp;电&nbsp;话
                        <input type="text" class="text" name="tel" value="${company.tel}" maxlength="16"/>
                    </span>
                </td>
            </tr>
        </table>
        <div class="head_describe">公&nbsp;司&nbsp;图&nbsp;片</div>
        <table>
            <tr>
               <c:set var="no" value="-1"></c:set>
               <c:forEach var="imgf" items="${company.comImgs}" >
               <c:set var="no" value="${no+1}" /> 
               
               <td class="jymf_td row_img" rowspan="1" colspan="1">
                    <span class="file-box">
                        <input type="button" class="btn" value="" />
                        <input id="imgFile${no}" 
                               name="imgFiles" 
                               class="file" 
                               type="button"
                               onclick="changePicUrl(${no})"
                        />
                        <input name="dels" 
                               type="button" 
                               class="del" 
                               value="" 
                               onclick="delPic(${no})"
                        />
                        <input type="hidden" id="imgFile${no}Name"  
                               name="comImgs[${no}].fileName" value="${imgf.fileName}"/> 
                        <input type="hidden"  
                               name="comImgs[${no}].no" value="${no}"/> 
                    </span>
                </td>
                </c:forEach> 
            </tr>
            <tr>
               <c:set var="no_img" value="-1" /> 
               <c:forEach var="imgf" items="${company.comImgs}">
                   <c:set var="no_img" value="${no_img+1}" /> 
                   <td>
                       <img id="img${no_img}" 
                            name="imgs" 
                            width="<%=Constants.PHOTO_IMG_WIDTH %>px" 
                            src="${ctx}${imgf.fileName}"
                            style="margin-top:25px;"
                        />
                   </td>
               </c:forEach> 
               
            </tr>
        </table>
    </div>

    <div class="add_btn">
        <div style="float: left"><input class="ok_button" type="submit" value=" "/></div>
        <div style="float: left"><input class="cancer_btn" type="button" value=""  
            onclick="javascript:window.location.href='javascript:history.go(-1)'"/>
        </div>
    </div>
    </form:form>
</div>

	<div id="bg" class="bg" style="display: none"></div>
	<div id="showPic" class="showPic" style="display: none;">
		<iframe src="${ctx}/common/pic" id="pic_iframe" style="width:100%;height:95%;border:0px;" scrolling="no"></iframe>   			
	</div>

</body>
</html>