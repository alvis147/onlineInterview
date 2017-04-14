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
		<h1>公司项目</h1>
	</div>

	<div class="cont-main clearfix">
		<div class="login form" id="showProject">
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
    var comUserId = location.search.substring(1);
/* 	if(comUserId.length==0)
	    alert("传参错误");  */
    $.ajax({
		url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Projectx/?Projectx.userid="+comUserId,
		type:"GET",
	    contentType: "application/json",
	    error:function(){
	    	alert("获取项目信息失败");
	    },
	    success:function(data){
			var projectArr = data.Projectx;
			var com=null;
			for(var i=0;i< projectArr.length;i++){
			    if(com==null){
					com = "<div class='group' ><a href= 'showposition.jsp?&projectId="+projectArr[i].id+"&positionStr="+projectArr[i].projectposition+"&comUserId="+comUserId+"'>"+projectArr[i].projectname+"</a><hr> <div>"+projectArr[i].projectcontent+"</div></div><br>";
			    }else{
					com = com+" "+ "<div class='group' ><a href= 'showposition.jsp?&projectId="+projectArr[i].id+"&positionStr="+projectArr[i].projectposition+"&comUserId="+comUserId+"'>"+projectArr[i].projectname+"</a><hr> <div>"+projectArr[i].projectcontent+"</div></div><br>";
			    }
			    $("#showProject").html(com);
			}
	    }
    })
});

</script>
</body>
</html>