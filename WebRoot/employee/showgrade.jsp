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
	</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>显示成绩</h1>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			
		</div>

		<div class="login form">
			<div class="group">
			    <label>您此次的答卷得分为：</label>
			    <h2 id="score"></h2>
			</div>
		</div>
		<div class="button">
			        <button type="submit" class="login-btn register-btn" id="button">确定</button>
		        </div>
		<div class="button">
			        <button type="submit" class="login-btn register-btn" id="feedback">答题反馈</button>
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
	var companyId = location.search.replace(/(?:(?:^|.*&\s*)company\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	var projectId = location.search.replace(/(?:(?:^|.*&\s*)project\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	var positionName = location.search.replace(/(?:(?:^|.*&\s*)position\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	var score = location.search.replace(/(?:(?:^|.*&\s*)score\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	var userId = document.cookie.replace(/(?:(?:^|.*;\s*)userid\s*\=\s*([^;]*).*$)|^.*$/, "$1");
	var positionname = decodeURI(positionName);
	console.log(score);
	$("#score").html(score);
	
	var grade = {
		employeeid : userId,
		companyid : companyId,
		projectid : projectId,
		positionname : positionname,
		grade : parseInt(score)
	};
	
	$.ajax({
	    url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Grade/",
	    type:"POST",
	    contentType: "application/json",
	    data:JSON.stringify(grade),
	    success:function(data){
			
	    },
	    error: function(){
		alert("添加grade表失败");
	    }
	});
	  $("#button").click(function(){
	      window.location.href = "showcompany.jsp";  
	  });
	  $("#feedback").click(function(){
	      window.location.href = "quizInfo.jsp";
	  })
	
	
</script>
</body>
</html>