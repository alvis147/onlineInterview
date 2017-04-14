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
</head>
<body>
<div id="box"></div>
<div class="cent-box">
	<div class="cent-box-header">
		<h1>试题录入</h1>
	</div>
	<div class="cont-main clearfix">
	<div class="login form">
			<div class="group">
		<form id="testadd">
			<label>题目</label>
			<input type="text" id="question" name="question">
			<br>
			<label>选项A</label>
			<input type="text" id="itemA" name="itemA" >
			<br>
			<label>选项B</label>
			<input type="text" id="itemB" name="itemB">
			<br>
			<label>选项C</label>
			<input type="text" id="itemC" name="itemC">
			<br>
			<label>选项D</label>
			<input type="text" id="itemD" name="itemD">
			<br>
			<label>正确选项</label>
			<input type="radio" name="correct" value="A" > A
			<input type="radio" name="correct" value="B"> B
			<input type="radio" name="correct" value="C"> C
			<input type="radio" name="correct" value="D"> D
			<br>
			<label>题目等级(4最高)</label>
			<input type="radio" name="level" value="1"> 1
			<input type="radio" name="level" value="2"> 2
			<input type="radio" name="level" value="3"> 3
			<input type="radio" name="level" value="4"> 4		
			<br>
			<label>选择所属职位</label>
			<p>
				<select id ="position" title="position" multiple="multiple" name="position" size="5">
				<option value="frontend">前端工程师</option>
				<option value="backend">后端工程师</option>
				<option value="mobileend">移动端工程师</option>
				</select>
            </p>
            <label>选择所属技术背景</label>
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
         </form>
            <div class="button">
			    <button type="submit" class="login-btn register-btn" id="button" >提交</button>
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
	//实体提交
      $("#button").click(function(){
	    var correctnum = document.getElementById("testadd").correct;//正确选项
        var levelnum = document.getElementById("testadd").level;//题目等级
        var question = document.getElementById("question").value;
        var itemA = document.getElementById("itemA").value;
        var itemB = document.getElementById("itemB").value;
        var itemC = document.getElementById("itemC").value;
        var itemD = document.getElementById("itemD").value;
        var time = new Date().getTime();
        alert(time);
        console.log(time);
        var category = null;
        correct = null;
        level = null;
        var pos = $('#position :selected');
        var tec = $('#tech :selected');
            pos.each(function () {
                if(category == null){
                    category = $(this).html();
                }
                else {
                    category = category+","+$(this).html();
                }
            }); 
            tec.each(function () {
                  if(category == null){
                      alert("请填写该题所属职位");
                  }
                  else{
                      category = category+","+$(this).html();
                  }
            });
              //获取多选值
        for(var i=0;i<correctnum.length;i++){
            if(correctnum[i].checked){
                correct = correctnum[i].value;
            }
        }
        for(var j=0;j<levelnum.length;j++){
            if(levelnum[j].checked){
                level = levelnum[j].value;
            }
        }
        var ques = {    
                    content:question,
                    option1:itemA,
                    option2:itemB,
                    option3:itemC,
                    option4:itemD,
                    answer:correct,
                    level:parseInt(level),
                    category:category,
                    time:time
                    };
	    $.ajax({
			url:"http://112.74.62.114:8080/Entity/U1ff54ed338bfc/testgen/Question/",
	    	type:"POST",
	    	contentType: "application/json",
	    	data:JSON.stringify(ques),
	    	error:function(){
	    	    alert("添加试题失败");
	    	},//错误执行方法
	    	success:function(data){
                alert("添加试题成功");
                window.location.href = "showquestion.jsp";
			} //成功执行方法
	    });
	    
	}); 
</script>
</body>
</html>