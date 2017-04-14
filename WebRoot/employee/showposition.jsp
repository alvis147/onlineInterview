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
	<script src='../js/jquery.min.js' type="text/javascript"></script>
	<style type="text/css">
    a:link {text-decoration:none;color:blue;}
a:hover {text-decoration:underline;color:red;}a:active{text-decoration:none;color:yellow;}
a:visited {text-decoration:none;color:green;}
    </style>
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>选择职位</h1>
	</div>

	<div class="cont-main clearfix">
		<div class="login form">
			<div class="group" id="showPosition">
			</div>
			<br><br>
		</div>

	</div>
</div>

<div class="footer">
	<p> 手机试题招聘平台</p>
</div>
<script src='../js/particles.js' type="text/javascript"></script>
<script src='../js/background.js' type="text/javascript"></script>
<script src='../js/layer/layer.js' type="text/javascript"></script>
<script>
	$(document).ready(function(){
	    
	    var comUserId =  location.search.replace(/(?:(?:^|.*&\s*)comUserId\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	    var projectId = location.search.replace(/(?:(?:^|.*&\s*)projectId\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	    var position = location.search.replace(/(?:(?:^|.*&\s*)positionStr\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	    var s = decodeURI(position);
	    var positionArr = s.split(",");
		var com=null;
	    for(var i=0;i< positionArr.length;i++){

			if(com==null){
			    com="<div><a href='selecttech.jsp?&position="+positionArr[i]+"&projectId="+projectId+"&comUserId="+comUserId+"'>"+positionArr[i]+"</a></div> <hr>";
			}
			else{
			    com = com +" "+"<div><a href='selecttech.jsp?&position="+positionArr[i]+"&projectId="+projectId+"&comUserId="+comUserId+"'>"+positionArr[i]+"</a></div> <hr>";
			}
		
	    }
		$("#showPosition").html(com);
	})
</script>
</body>
</html>