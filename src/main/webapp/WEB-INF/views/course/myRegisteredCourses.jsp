<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%-- // ${fn:length(course.timetables)} --%>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">내 강의들</h1>
</div>
</div> <!-- div row -->

<style>
	ul.timeview{
		list-style: none;
	}
</style>


		<div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center">
                           <a id="prevMonth" href="#"><span class="fa fa-angle-left"></span></a>
                           		 <b> <span class="mYear">${curYear }</span>년 <span class="mMonth">${curMonth }</span>월  </b> 
                           	<a id="nextMonth" href="#"><span class="fa fa-angle-right"></span></a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        	<tr>
												<th>강의명</th>
												<th>선생님</th>
												<th>강의요일</th>
												<th>강의시작시간</th>
												<th>강의종료시간</th>
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


		

<%@ include file="../include/footer.jsp"%>	
<!-- <td>
					{{#courseRegisters}}
					<ul class="timeview">
						<li>{{registrationStatus.rsNo}}</li>
					</ul>
					{{/courseRegisters}}
				</td>
				<td>
					{{#courseRegisters}}
					<ul class="timeview">
						<li>{{regMonth}}</li>
					</ul>
					{{/courseRegisters}}
				</td> -->
				
				
				
<%-- <a href="${pageContext.request.contextPath}/course/readCourse?cNo={{cNo}}">		 --%>
<script id="temp" type="text/x-handlevars-template">
		{{#each.}}
			<tr onclick=location.href="${pageContext.request.contextPath}/course/readCourse?cNo={{cNo}}">		
				<td>
					<b>{{cName}}</b>
				</td>
				<td>{{teacher.tName}}</td>
				<td>
					{{#timetables}}
					<ul class="timeview">
						<li>{{dayToHangle ttDay}}</li>
					</ul>
					{{/timetables}}
				</td>
				<td>
					{{#timetables}}
					<ul class="timeview">
						<li>{{timeview ttStarttime}}</li>
					</ul>
					{{/timetables}}
				</td>
				<td>
					{{#timetables}}
					<ul class="timeview">
						<li>{{timeview ttEndtime}}</li>
					</ul>
					{{/timetables}}
				</td>
			</tr>
		{{/each}}
</script>


<script id="tempttDay" type="text/x-handlevars-template">
		{{#each.}}
			<ul class="timeview">
				<li>
					{{student.ttDay}}
				</li>
			</ul>
		{{/each}}
</script>

<script>
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();

	var sId="sss01";
	var sWeek = ["일","월","화","수","목","금","토"];
	Handlebars.registerHelper("dayToHangle", function(day) {
		return sWeek[day];
	});
	
	Handlebars.registerHelper("timeview", function(time) {
		var timeStr = time.toString();
		var viewTime = timeStr.substr(0,2)+":"+timeStr.substr(2,2);
		return viewTime;
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
				var source = $("#temp").html();
				var template = Handlebars.compile(source);
				$("tbody.myCourses").html(template(data));
			}
				
		})
	}
</script>