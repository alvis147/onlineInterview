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
		<h1>选择技术背景</h1>
	</div>

	<div class="cont-main clearfix">
		<div class="login form">
			<div class="group">
			<form name="testgen">
			   <h3>请选择您最擅长的一项或几项技术</h3>
			   <p>
			    <select id ="tech" title="tech" multiple="multiple" name="tech" size="5">
					<option value="JS">JS</option>
					<option value="HTML">HTML</option>
					<option value="CSS">CSS</option>
					<option value="JAVA">JAVA</option>
					<option value="C++">C++</option>
					<option value="Python">Python</option>
					<option value="Android">Android</option>
					<option value="iOS">iOS</option>
				</select>
               </p>
            
			   <br><br>
			   </form>
			   	<div class="button">
			        <button  class="login-btn register-btn" id="button">开始考试</button>
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
<script>
	
	$(function(){ 
	    $("select").multiselect({ 
	    noneSelectedText: "==请选择==", 
	    checkAllText: "全选", 
	    uncheckAllText: '全不选', 
	    selectedList:4 
	    }); 
	    });  

	$("#button").click(function(){
          if(!document.testgen.tech.value){
             	alert("请输入技术背景！"); 
             document.testgen.tech.focus(); 
             return false;
         } 
         else { 
       
          var tech = null;
          var pos = $('#tech :selected');
          pos.each(function () {
             if(tech == null){
                 tech = $(this).html();
             }
             else { 
        	 	 tech = tech+","+$(this).html();
        		}
          });
          
	 	 var position = location.search.replace(/(?:(?:^|.*&\s*)position\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	 	 var p = decodeURI(position);
	 	 var projectId = location.search.replace(/(?:(?:^|.*&\s*)projectId\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	  	 var comUserId = location.search.replace(/(?:(?:^|.*&\s*)comUserId\s*\=\s*([^&]*).*$)|^.*$/, "$1");
	 	 var userId = document.cookie.replace(/(?:(?:^|.*;\s*)userid\s*\=\s*([^;]*).*$)|^.*$/, "$1");  
	 	 console.log(userId);
	 	 var userName = document.cookie.replace(/(?:(?:^|.*;\s*)username\s*\=\s*([^;]*).*$)|^.*$/, "$1");
	 	 var telephone = document.cookie.replace(/(?:(?:^|.*;\s*)telephone\s*\=\s*([^;]*).*$)|^.*$/, "$1");
	 	 var employee = {
	 		employeeid : userId,
	 		employeename : userName,
	 		employeetel : telephone,
	 		employeetech : tech
	 	 };
	 	 
	 	 $.ajax({
	 	    url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Employee/",
		    contentType: "application/json",
		    type: "POST",
		    data:JSON.stringify(employee),
		    success:function(data){
				window.location.href = 'showquiz.jsp?&position='+position+"&tech="+tech+"&company="+comUserId+"&project="+projectId;
		    },
	 	 	error:function(){
	 	 	    alert("添加employee失败");
	 	 	}
	 	 });
		   
          } 

       }); 
</script>
</body>
</html>