<%@ page language="java" contentType="text/html; charset=UTF-8"; pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">

	<title>登录 - 手机试题招聘平台</title>
	<link rel="stylesheet" type="text/css" href="../style/register-login.css">
	<link rel="stylesheet" type="text/css" href="../style/add.css">
	<link rel="stylesheet" type="text/css" href="../js/jquery.multiselect.css" />
	<link rel="stylesheet" type="text/css" href="../style/jquery-ui.css" />
	<link rel="stylesheet" type="text/css" href="../style/chosen.css"/>
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.js"></script>
    <script src='../js/layer/layer.js' type="text/javascript"></script>
    <script type="text/javascript" src="../js/chosen.jquery.js"></script>
</head>
<body onload="init()">
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>可应聘公司</h1>
	</div>

	<div class="cont-main clearfix">

			<div class="group">
			<span>选择公司
			<select id="company" name="company"  data-placeholder="选择部门" onclick="comChange()" style="width:150px;" class="dept_select">  
       			<option value="-1"></option>
    		</select>  
    		</span>
			   	<div class="button">
			        <button  class="login-btn register-btn" id="button">开始考试</button>
		        </div>
			</div>
	</div>
</div>

<div class="footer">
	<p> 手机试题招聘平台</p>
</div>

<script>
	function init()
	{
		initServiceId();
	};
	function initServiceId()  
	{  
	    $('.dept_select').chosen();
	    var optionsServiceId ="<option value =''></option>";  
/* 	    data.nType = 'view';  
	    data.name ='GROUP'; */  
	    var serviceId =new Array();  
	    var serviceName = new Array();  
	    $.ajax({
		url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Company/",
		type:"GET",
	    contentType: "application/json",
	    error:function(){
	    	alert("获取公司信息失败");
	    },
	    success:function(data){
			result = data.Company;
			for(var i=0;i<result.length;i++){  
	            serviceName=result[i].companyname;  
	            serviceId =result[i].id;  
	            optionsServiceId ="<option value=\'"+serviceId+"' >"+serviceName+"</option>";  
	            $("#company").append(optionsServiceId);  
	        }
    	}
		}) 
	}

	function comChange(){
	    var objs =document.getElementById("company");
	    var opValue = objs.options[objs.selectedIndex].value;
	    alert(opValue);
	};
 	$(document).ready(function(){
	    
 	})
</script>
</body>
</html>