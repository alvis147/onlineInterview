<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">

	<title>登录 - 手机试题招聘平台</title>
	<link rel="stylesheet" type="text/css" href="../style/register-login.css">
	<link rel="stylesheet" type="text/css" href="../style/add.css">
	<link rel="stylesheet" type="text/css" href="../js/jquery.multiselect.css" />
	<link rel="stylesheet" type="text/css" href="../style/jquery-ui.css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.js"></script>
    <script src='../js/layer/layer.js' type="text/javascript"></script>
    <style type="text/css">
    a:link {text-decoration:none;color:blue;}
a:hover {text-decoration:underline;color:red;}a:active{text-decoration:none;color:yellow;}
a:visited {text-decoration:none;color:green;}
    </style>
    <script>
        var employeeid=window.location.search.slice(window.location.search.lastIndexOf("?")+12);
        $.ajax({
        url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Employee/?Employee.employeeid="+employeeid,
        type:"GET",
        contentType:"application/json",
        error:function(){
            alert("获取应聘者信息出错");
        },
        success:function(data){
            var uname = data.Employee[0].employeename;
            var utel = data.Employee[0].employeetel;
            var tech = data.Employee[0].employeetech;
            $("#name").html(uname);
            $("#tel").html(utel);
            $("#tech").html(tech);
        }
        });
    </script>
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>展示推荐人详细信息</h1>
	</div>
	<div class="cont-main clearfix">

		<div class="login form">
			<div class="group">
			    <div>
				    <label>姓名:</label>
					<br>
					<div id="name"></div>
				</div>
				<hr><br>
				<div>
					<label >电话:</label>
					<br>
					<div id="tel"></div>
				</div>
				<hr><br>
				<div>
					<label>掌握技能:</label>	
					<br>
					<div id="tech"></div>
			</div>
			<div><br><br><br></div>
		</div>

	</div>
</div>
<div class="footer">
	<p> 手机试题招聘平台</p>
</div>
<script src='../js/particles.js' type="text/javascript"></script>
<script src='../js/background.js' type="text/javascript"></script>
<script src='../js/layer/layer.js' type="text/javascript"></script>

</body>
</html>