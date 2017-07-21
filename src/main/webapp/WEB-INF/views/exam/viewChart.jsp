<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">출석기록</h1>
</div>
</div>

  
<body>
  <div id="donut-attendance-chart"></div>
</body>
	
<!-- 

	<div id="content">
		<h3 id="title"></h3>
		<div class="demo-container">
			<div id="placeholder" class="demo-placeholder"></div>
		</div>
	</div>

 -->

<%@ include file="../include/footer.jsp"%>	
<style type="text/css">

	.demo-container {
		position: relative;
		width : 600px;
		height: 400px;
	}

	#placeholder {
		width: 450px;
	}


								
	</style>
	
	<script>
	Morris.Donut({
		  element: 'donut-attendance-chart',
		  data: [
		    {label: "Download Sales", value: 12},
		    {label: "In-Store Sales", value: 30},
		    {label: "Mail-Order Sales", value: 20}
		  ],
		 colors: ["#EC407A","#2196F3","#8BC34A","#AB47BC"],
		});
	
	var series=0;
	var data =[];
	$(function() {
		data = attendanceData();
		console.log("===series: "+series);
		$("#placeholder").unbind();
		$("#title").text("차트 타이틀");
		console.log("===data: "+data[0]);
		$.plot($("#placeholder"), data, {
			series: {
				pie: { 
					show: true
				}
			}
		});	
	});
	
	function attendanceData(){
		var sId= "sss01";
		var arr =[];
		$.ajax({
			url: "${pageContext.request.contextPath}/attend/viewChart/"+sId,
			type : "get",
			dataType: "json",
			success:function(v){
				var size = v.len;
				console.log("size: "+size);
				console.log('Size of object: '+ Object.keys(v).length);
				console.log('KEYS: '+ Object.keys(v));
				
				series = Object.keys(v).length;
				console.log('series: '+ series);
				
				var idx = 0;
				$.each(v, function(key, value) {
					if(idx != series){
						arr[idx] = {
								label: key,
								data: value
							}
						idx++;
						
					}
				});
				
			}
		});
		return arr;
	}
	

	</script>