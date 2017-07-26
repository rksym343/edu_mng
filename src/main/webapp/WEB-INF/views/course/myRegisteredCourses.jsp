<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- // ${fn:length(course.timetables)} --%>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
	<h1 class="page-header">내 강의들</h1>
</div>
</div>
<!-- div row -->

<style>
ul.timeview {
	list-style: none;
}
.table th, td{
	text-align: center;
}
</style>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>강의명</th>
								<th>선생님</th>
								<th>시간표</th>
							</tr>
						</thead>
						<tbody class="myCourses">
						</tbody>
					</table>
				</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-6 -->
</div>



<%@ include file="../include/footer.jsp"%>
<script id="courseList" type="text/x-handlevars-template">
		{{#each.}}
			<tr onclick=location.href="${pageContext.request.contextPath}/course/readCourse?cNo={{cNo}}">		
				<td>
					<b>{{cName}}</b>
				</td>
				<td>{{teacher.tName}}</td>
				<td>					
					<ul class="timeview">
					{{#timetables}}
						<li>[{{dayToHangle ttDay}}] {{ ttStarttime}}시 ~ {{ ttEndtime}}시</li>
					{{/timetables}}

					</ul>
				</td>
			</tr>
		{{/each}}
</script>

<script>
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();

	var sId=memberId;
	var sWeek = ["일","월","화","수","목","금","토"];
	
	Handlebars.registerHelper("dayToHangle", function(day) {
		return sWeek[day];
	});
 

	$(function() {	      
		changeCalTitle();
		getMyCourses();
	});
	
	 $("#prevMonth").click(function(e) {
	      	e.preventDefault();
	      	if(month == 1){
	      		year = year-1;
	      		month = 12;
	      	}else{
	      		month = month-1;
	      	}	
	      	
	      	changeCalTitle();
			getMyCourses();
	      });
	      
	      $("#nextMonth").click(function(e) {
	          	e.preventDefault();
	          	if(month == 12){
	          		year = year+1;
	          		month = 1;
	          	}else{
	          		month = month+1;
	          	}	
	          	changeCalTitle();
	    		getMyCourses();
	      });
	
	function getMyCourses(){
		$.ajax({
			// /myRegisteredCourses/{sId}/{year}/{month}/{rsNo}
			url: "${pageContext.request.contextPath}/course/myRegisteredCourses/"+sId+"/"+year+"/"+(month+1)+"/"+1,
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);
				var source = $("#courseList").html();
				var template = Handlebars.compile(source);
				$("tbody.myCourses").html(template(data));
			}
				
		})
	}
</script>