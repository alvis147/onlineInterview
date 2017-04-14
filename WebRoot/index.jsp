<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script></script>
	<script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script>
	 	var str;
		$.ajax({
		    url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Employee/",
		    type:"GET",
		    contentType: "application/json",
		    	error:function(){
		    	    alert("huoqu试题失败");
		    	},
		    	success:function(data){
		    	 var len = data.Employee.length;
		    	    var ques = null;
		    	    for(var i=0 ;i<len; i++){
		    	        var dtlist = data.Employee[i];
		    	        if (ques == null){
		    	            ques = (i+1)+"&nbsp;&nbsp;" + dtlist.id+"&nbsp;&nbsp;<button id="+dtlist.id+" class='button button-box button-tiny' onClick='delQuestion(this.id)'>删除</button></br><hr>";
			    	        
		    	        }
		    	        else{
		    	            ques = ques +" "+(i+1)+" "+dtlist.id+"&nbsp;&nbsp;<button id="+dtlist.id+" class='button button-box button-tiny' onClick='delQuestion(this.id)'>删除</button></br><hr>";
		    	            
		    	        }
		    	        $("#test").html(ques);
	                }
		    	}
		    
		});function delQuestion(qid){
			alert("qid:"+qid);
		            $.ajax({
			            async: false,
						url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Employee/"+qid,
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
	/* 	$.ajax({
			url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Question/"+qid,
	    	type:"DELETE",
	    	contentType: "application/json",
	    	error:function(){
	    	    alert("删除试题失败");
	    	},
	    	success:function(data){
	    	    console.log(data);
	    	    alert("修改成功");
	    	}
	    	
    	}); */
	 /*    function funca() {
		/* 	$.ajax({
			    url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Company/1481510827327",
			    contentType: "application/json",
			    type: "DELETE",
			}) 
			$.ajax({
			    url:"http://58.196.130.215/testgen/exam/statistic",
			    contentType: "application/json",
			    type:"GET",
			    success:function(data){
					console.log(data[0]);
			    }
			})}*/
	    
	</script>
  </head>
  
  <body>
    This is my JSP page. <br>
    <div class="login form">
			<div ><div id="test"> </div>
			    <br><br>
			</div>
		</div>
    
    <button id="btn" onclick="funca()">提交 </button>
  </body>
</html>
