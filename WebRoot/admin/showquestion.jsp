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
	<link rel="stylesheet" type="text/css" href="../style/buttons.css" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.core.js"></script>
    <script type="text/javascript" src="../js/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="../js/jquery.multiselect.js"></script>
	<!-- <script src='../js/particles.js' type="text/javascript"></script> -->
	<!-- <script src='../js/background.js' type="text/javascript"></script> -->
	<script src='../js/layer/layer.js' type="text/javascript"></script>
	<style type="text/css">
		.button { 
display: inline-block; 
zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */ 
*display: inline; 
vertical-align: baseline; 
margin: 0 2px; 
outline: none; 
cursor: pointer; 
text-align: center; 
text-decoration: none; 
font: 14px/100% Arial, Helvetica, sans-serif; 
padding: .5em 2em .55em; 
text-shadow: 0 1px 1px rgba(0,0,0,.3); 
-webkit-border-radius: .5em; 
-moz-border-radius: .5em; 
border-radius: .5em; 
-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2); 
box-shadow: 0 1px 2px rgba(0,0,0,.2); 
} 
.button:hover { 
text-decoration: none; 
} 
.button:active { 
position: relative; 
top: 1px; 
} 
	</style>
	<script>
			        $.ajax({
						url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Question/",
				    	type:"GET",
				    	contentType: "application/json",
				    	error:function(){
				    	    alert("获取试题失败");
				    	},//错误执行方法
				    	success:function(data){
				    	    var len = data.Question.length;
				    	    var ques = null;
				    	    for(var i=0 ;i<len; i++){
				    	        var dtlist = data.Question[i];
				    	        if (ques == null){
				    	            ques = (i+1)+"&nbsp;&nbsp;" + dtlist.content+"&nbsp;&nbsp;"+dtlist.answer+"&nbsp;&nbsp;"+dtlist.level+"&nbsp;&nbsp;&nbsp;<button id="+dtlist.id+" class='button button-box button-tiny' onClick='delQuestion(this.id)'>删除</button></br><hr>";
					    	        
				    	        }
				    	        else{
				    	            ques = ques +" "+(i+1)+" "+dtlist.content+"&nbsp;&nbsp;"+dtlist.answer+"&nbsp;&nbsp;"+dtlist.level+"&nbsp;&nbsp;&nbsp;<button id="+dtlist.id+" class='button button-box button-tiny' onClick='delQuestion(this.id)'>删除</button></br><hr>";
				    	            
				    	        }
				    	        $("#test").html(ques);
			                }
						} //成功执行方法
				    });
				    function delQuestion(qid){
					alert("qid:"+qid);
							            $.ajax({
								            async: false,
											url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Question/"+qid,
									    	type:"DELETE",
									    	contentType: "application/json",
									    	error:function(){
									    	    alert("删除试题失败");
									    	},
									    	success:function(data){
									    	    console.log(data);
									    	    alert("修改成功");
									    	    window.location.reload();
									    	}
									    	
								    	});
				                    }
			    </script>
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>试题管理</h1>
	</div>

	<div class="cont-main clearfix">
		<div class="index-tab">
			<div class="index-slide-nav">
				<a href="addquestion.jsp">添加</a>
				<a href="updatequestion.jsp">更新</a>
				<a href="showstatistics.jsp">统计</a>			
			</div>
		</div>

		<div class="login form">
			<div class="group">
			    <span>编号</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>试题</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>答案</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>等级</span><hr>
			    <div id="test"> </div>
			    <br><br>
			</div>
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