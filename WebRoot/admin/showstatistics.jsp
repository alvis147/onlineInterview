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
	<!-- <script src='../js/particles.js' type="text/javascript"></script> -->
	<!-- <script src='../js/background.js' type="text/javascript"></script> -->
	<script src='../js/layer/layer.js' type="text/javascript"></script>
	<script src='../js/echarts.js' type="text/javascript"></script>
	<script>
	/*  var settings = {
        type: "GET",
        url:"http://58.196.130.215/testgen/exam/statistic",
        dataType:"application/json",
        error: function(XHR,textStatus,errorThrown) {
            alert ("XHR="+XHR+"\ntextStatus="+textStatus+"\nerrorThrown=" + errorThrown);
        },
        success: function(data,textStatus) {
            
        },
        headers: {
            "Access-Control-Allow-Origin":"http://58.196.130.215/",
            "Access-Control-Allow-Headers":"X-Requested-With"
        }
    };
	     $.ajax(settings); */
		 $.ajax({
	       url:"/testgen/exam/statistic",
	       contentType:"application/json",
	       error:function(){
	          alert("获取统计数据失败");
	       },
	       success:function(data){
	       if(data){
			    data.sort(getSortFun('desc', 'accuracy'));
				function getSortFun(order, sortBy) { 
				    var ordAlpah = (order == 'asc') ? '>' : '<';
				    var sortFun = new Function('a', 'b', 'return a.' + sortBy + ordAlpah + 'b.' + sortBy + '?1:-1');
				    return sortFun;
				}
	           var str = null;
	           var str2 = null;
	           var echarttop = new Array();
	           var echartbottom = new Array();
	           var echartlegend = new Array();
	           var echartlegend2 = new Array();
	           
	           for (var i=0; i<10;i++){
	               var qid = data[i].id;
	               var accuracy =  data[i].accuracy;
	               console.log(qid);
	               console.log(accuracy);
	               if (i == 0){
	                  str = "<div class='f' value="+data[i].id+"><span>"+(i+1)+".</span><span>题号："+data[i].id+"</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;准确率："+data[i].accuracy+"</span></div>";
	                  var sub = {"value":data[i].accuracy,"name":data[i].id};
	                  echarttop.push(sub);
	                  echartlegend.push(data[i].id);
	                  
	               }
	               else{
	                  str = str +"<div class='f' value="+data[i].id+"><span>"+(i+1)+".</span><span>题号："+data[i].id+"</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;准确率："+data[i].accuracy+"</span></div>";
	                  var sub = {"value":data[i].accuracy,"name":data[i].id};
	                  echarttop.push(sub);
	                  echartlegend.push(data[i].id);
	               }
	           }
	           console.log(echartlegend);
	           for (var j=data.length-1,k=1; j>data.length-11;j--,k++){
	               var qid = data[j].id;
	               var accuracy =  data[j].accuracy;
	               console.log(qid);
	               console.log(accuracy);
	               if (j == (data.length-1)){
	                  str2 = "<div class='f' value="+data[j].id+"><span>"+(k)+".</span><span>题号："+data[i].id+"</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;准确率："+data[j].accuracy+"</span></div>";
	                  var sub2 = {"value":data[j].accuracy,"name":data[j].id};
	                  echartbottom.push(sub2);
	                  echartlegend2.push(data[j].id);
	               }
	               else{
	                  str2 = str2 +"<div class='f' value="+data[j].id+"><span>"+(k)+".</span><span>题号："+data[i].id+"</span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;准确率："+data[j].accuracy+"</span></div>";
	                  var sub2 = {"value":data[j].accuracy,"name":data[j].id};
	                  echartbottom.push(sub2);
	                  echartlegend2.push(data[j].id);
	               }
	           }
	           console.log(echartlegend2);
	           console.log(echarttop);
	            var myChart = echarts.init(document.getElementById('myChart')); 
		        var myChart2 = echarts.init(document.getElementById('myChart2'));
				option = { 
				    tooltip: { 
				        trigger: 'item', 
				        formatter: "{a} <br/>{b}: {c} ({d}%)" 
				    }, 
				    legend: { 
				        orient: 'horizontal', 
				        left: 'center', 
				        bottom: 0, 
				        data:echartlegend
				    }, 
				    series: [ 
				        /* { 
				            name:'访问来源', //内环 
				            type:'pie', 
				            selectedMode: 'single', //单一选中模式 
				            radius: [0, '30%'], //饼图的半径 [内半径，外半径] 
				 
				            label: { 
				                normal: { 
				                    position: 'inner' //内置文本标签 
				                } 
				            }, 
				            labelLine: { 
				                normal: { 
				                    show: false     //不需要设置引导线 
				                } 
				            }, 
				            data:[ 
				                {value:335, name:'第一题', selected:true}, 
				                {value:679, name:'第二题'}, 
				                {value:1548, name:'第三题'} 
				            ] 
				        },  */
				        { 
				            name:'题目正确率', 
				            type:'pie', 
				            radius: ['30%', '55%'], 
				             data:echarttop
				        } 
				    ] 
				}; 
				 option2 = { 
				    tooltip: { 
				        trigger: 'item', 
				        formatter: "{a} <br/>{b}: {c} ({d}%)" 
				    }, 
				    legend: { 
				        orient: 'horizontal', 
				        left: 'center', 
				        bottom: 0, 
				        data:echartlegend2
				    }, 
				    series: [ 
				        /* { 
				            name:'访问来源', //内环 
				            type:'pie', 
				            selectedMode: 'single', //单一选中模式 
				            radius: [0, '30%'], //饼图的半径 [内半径，外半径] 
				 
				            label: { 
				                normal: { 
				                    position: 'inner' //内置文本标签 
				                } 
				            }, 
				            labelLine: { 
				                normal: { 
				                    show: false     //不需要设置引导线 
				                } 
				            }, 
				            data:[ 
				                {value:335, name:'第一题', selected:true}, 
				                {value:679, name:'第二题'}, 
				                {value:1548, name:'第三题'} 
				            ] 
				        },  */
				        { 
				            name:'题目正确率', 
				            type:'pie', 
				            radius: ['30%', '55%'], 
				 
				            data:echartbottom
				        } 
				    ] 
				}; 
		// 使用刚指定的配置项和数据显示图表。 
				myChart.setOption(option);
				myChart2.setOption(option2);
		  }
	       else {
	          alert("返回数据为空");
	       }
	       $("#top").html(str);
	       $("#bottom").html(str2);
	      
		     
	    }
	       }); 
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
			   <h1>准确率前10题列表</h1>
			   <div id="top"></div>
			   <h1>准确率后10题列表</h1>
			   <div id="bottom"></div>
			   </div>
			
		</div>

	</div>
	<h1>准确率前10题统计图</h1>
			    <div id="myChart" style="width: 600px;height:400px; margin-left: auto; margin-right: auto;"></div> 
			    <br><br><h1>准确率后10题统计图</h1>
			    <div id="myChart2" style="width: 600px;height:400px; margin-left: auto; margin-right: auto;"></div> 
		<br><br><br><br>
</div>

<div class="footer">
	<p> 手机试题招聘平台</p>
</div>
<script src='../js/particles.js' type="text/javascript"></script>
<script src='../js/background.js' type="text/javascript"></script>
<script src='../js/layer/layer.js' type="text/javascript"></script>

</body>
</html>