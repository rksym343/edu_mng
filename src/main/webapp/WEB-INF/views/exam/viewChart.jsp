<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">출석기록</h1>
</div>
</div>


	


	<div id="content">
		<h3 id="title"></h3>
		<div class="demo-container">
			<div id="placeholder" class="demo-placeholder"></div>
		</div>
	</div>



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
	$(function() {

		
		var data = []
		var	series = 5;

		for (var i = 0; i < series; i++) {
			data[i] = {
				label: "범주" + (i + 1),
				data: 20
			}
		}

		var placeholder = $("#placeholder");

		$(function() {

			placeholder.unbind();

			$("#title").text("차트 타이틀");

			$.plot(placeholder, data, {
				series: {
					pie: { 
						show: true
					}
				}
			});
		});

	});

	

	</script>