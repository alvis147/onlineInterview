<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">

	<title>手机试题招聘平台</title>
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
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>答错题目</h1>
	</div>

	<div class="cont-main clearfix">
		<div class="login form" id="showQuizInfo">
		<!-- <div class="group" >
			题目：若int型数据占2个字节，则下列语句的输出为（D  ）。int k=-1;printf(“%d,%u\\n”,k,k);
			<hr>
			正确答案：D
		</div>
		<br>
		<div class="group" >
			题目：若int型数据占2个字节，则下列语句的输出为（D  ）。int k=-1;printf(“%d,%u\\n”,k,k);
		<hr>
			正确答案：D
		</div> -->
		</div>
		<div class="button">
			        <button type="submit" class="login-btn register-btn" id="button" onclick="funca()">确定</button>
		</div>
		<br>
		<br>
	</div>
</div>

<div class="footer">
	<p> 手机试题招聘平台</p>
</div>
<script src='../js/particles.js' type="text/javascript"></script>
<script src='../js/background.js' type="text/javascript"></script>
<script src='../js/layer/layer.js' type="text/javascript"></script>
<script>

	var userid = document.cookie.replace(/(?:(?:^|.*;\s*)userid\s*\=\s*([^;]*).*$)|^.*$/, "$1");
	$.ajax({
	    	url: "/testgen/exam/quizInfo?userid="+userid,
	    	contentType:"application/json",
	        error:function(){
	          alert("获取反馈出错");
	       	},
	       	success:function(data){
	       	    if(data){
	       			var len = data.length;
	       			console.log(len);
	       			var com = null;
	       			for(var i=0;i<len;i++){
	       			    if(com==null){
	       					com="<div class='group' >题目: "+data[i].question+"<hr>正确答案："+data[i].correctAnswer+"</div><br>";
	       			    }else{
	       					com = com + "<div class='group' >题目: "+data[i].question+"<hr>正确答案："+data[i].correctAnswer+"</div><br>";
	       			    }
	       			}
	       			$("#showQuizInfo").html(com);
	       	    }
	       	}
	});
	function funca(){
	    window.location.href = "showcompany.jsp";
	}
</script>
</body>
</html>