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
    a:link {text-decoration:none;color:green;}
a:hover {text-decoration:underline;color:red;}a:active{text-decoration:none;color:yellow;}
a:visited {text-decoration:none;color:rgba(15, 136, 235, 0.7);}
    </style>
    <script>
      var projectid=window.location.search.slice(window.location.search.lastIndexOf("?")+4);
      var userid = document.cookie.replace(/(?:(?:^|.*;\s*)userid\s*\=\s*([^;]*).*$)|^.*$/, "$1");
      
       $.ajax({
			url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Projectx/?Projectx.id="+projectid,
			//async: false, 
	    	type:"GET",
	    	contentType: "application/json",
	    	error:function(){
	    	    alert("获取公司项目职位失败");
	    	},//错误执行方法
	    	success:function(data){
	    	    var pos = null;
		    	var dt = data.Projectx[0].projectposition;
		    	var positions= new Array(); 
		    	positions = dt.split(",");
		    	if(positions){
		    	var positionname = null;
		    	var pass = 5;
	    	    for (var i= 1;i<positions.length+1;i++){
	    	        if (pos == null){
	    	            pos = i+"&nbsp;&nbsp; <span>"+positions[i-1]+"</span><hr>";
	    	            positionname = positions[i-1];	            
			    	    $.ajax({
			    	         async: false, 
				    	     url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Grade?Grade.companyid="+userid+"&Grade.projectid="+projectid+"&Grade.positionname="+positionname+"&Grade.grade=(gte)5",
				    	     type:"GET",
				    	     contentType:"application/json",
				    	     error:function(){
				    	         alert("获取成绩表失败");
				    	     },
				    	     success:function(data){
				    			if(data.Grade){
				    		    console.log(data.Grade);
				    	         var len = data.Grade.length;
				    	         for(var k=0;k<len;k++){
				    	             var dtlist = data.Grade[k];
				    	             if(k == 0){
				    	                 pos = pos +"<a href='showemployee.jsp?employeeid="+dtlist.employeeid+"'>"+dtlist.employeeid+"</a>&nbsp;&nbsp;<br>";
				    	             }
				    	             else {
				    	                 pos = pos +"<a href='showemployee.jsp?employeeid="+dtlist.employeeid+"'>"+dtlist.employeeid+"</a><br>";
				    	             }
				    	         }
				    	     
				    	     }else{
				    			alert("目前还没有合适的应聘者");		
				    	     }
				    		}
		    	         });
		    	        }
	    	        else{
	    	            pos = pos +" "+i+"&nbsp;&nbsp;&nbsp;<span>"+positions[i-1]+"</span><hr>";
	    	            positionname = positions[i-1]; 
	    	            console.log(userid+","+projectid+","+positionname);
			    	    $.ajax({
			    	         async: false, 
				    	     url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Grade?Grade.companyid="+userid+"&Grade.projectid="+projectid+"&Grade.positionname="+positionname+"&Grade.grade=(gte)5",
				    	     type:"GET",
				    	     contentType:"application/json",
				    	     error:function(){
				    	         alert("获取成绩表失败");
				    	     },
				    	     success:function(data){
				    		     if(data.Grade){
				    	             var len = data.Grade.length;
					    	         for(var k=0;k<len;k++){
					    	             var dtlist = data.Grade[k];
					    	             if(k == 0){
					    	                 pos = pos +"<a href='showemployee.jsp?employeeid="+dtlist.employeeid+"'>"+dtlist.employeeid+"</a>&nbsp;&nbsp;<br>";
					    	             }
					    	             else {
					    	                 pos = pos +"<a href='showemployee.jsp?employeeid="+dtlist.employeeid+"'>"+dtlist.employeeid+"</a><br>";
					    	             }
					    	         }
				    	         }
				    	         else {
				    	             alert("目前还没有合适的应聘者");		    	      
				    	         }
				    	     }
		    	         });
	    	        }
	    	    }
	    	    $("#test").html(pos);
		    	}
		    } //成功执行方法
	    });
</script>
    
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>展示所有推荐人</h1>
	</div>

	<div class="cont-main clearfix">

		<div class="login form">
			<div class="group">
			     <div id="test"> 
			         <div id = "test2"></div>
			     </div>
			     
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