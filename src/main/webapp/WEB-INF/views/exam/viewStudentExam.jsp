<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">시험성적</h1>
</div>
</div>

	<style>
		li.c-timetable{
			border : 1px dotted gray;
			margin : 5px;
		}
		table td, table th{
			text-align: center;
		}
		.course-click-event{
			background-color: #ddd;
			
		}
		li.course-click-event{
			/* border : 3px solid gray; */
		}
		.chart{
			width : 100%;
			height: 200px;
			/* line-height: 200px; */
			color : #aaa;
			text-align: center;
		}
		.chart > p {
			line-height: 200px;
		}
	</style>

	<div class="row">
		<div class="col-sm-3">
				<div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                        	<th>과목</th>
                                            <th>강의명</th>
                                            <th>선생님</th>
                                        </tr>
                                    </thead>
                                    <tbody id="reg-course-table" class="reg-course-table">
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
			</div>
		<div class="col-sm-9">
			
			<h2>학교테스트</h2>
			<div id="bar-example"  class="chart"></div>
			<!-- <table border="1">
				<thead>
					<tr>
						<th>평가번호</th>
						<th>수업명</th>
						<th>평가항목</th>
						<th>평가결과</th>
						<th>한마디</th>
					</tr>
				</thead>
				<tbody id="ttbody2">
					
				</tbody>
			</table> -->
				
				<hr>
		<h2>학원테스트</h2>
		<div id="area-example" class="chart"></div>
			<!-- <table border="1">
				<thead>
					<tr>
						<th>평가번호</th>
						<th>수업명</th>
						<th>평가항목</th>
						<th>평가결과</th>
						<th>한마디</th>
					</tr>
				</thead>
				<tbody id="ttbody">
					
				</tbody>
			</table> -->
			
			<hr>
			
		</div>
	</div>


<%@ include file="../include/footer.jsp"%>	

<script>
	var sId = ${memberId};
	
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	var date = today.getDate();
	var day = today.getDay();
	
$(function() {
	getMyCourses();

	
	
});

function getMyExamRecordBySubject(sbNo){
	var schoolGradeData = [];
		$.ajax({
			// "exam/viewStudentExam/{sId}/{cNo}"
			url: "${pageContext.request.contextPath}/exam/viewStudentExam/"+sId+"/"+sbNo,
			type : "put",
			dataType: "json",
			success:function(data){
				console.log(data);
				$("#ttbody2").html("");
				$("#bar-example").html("")
				if(data.length != 0){
					$.each(data, function(i, v) {					
						var trTag = 
							"<tr>"+
								"<td>"+v.eNo+"</td>"+
								"<td>"+v.course.cName+"</td>"+
								"<td>"+v.examItem.eiTitle+"</td>"+
								"<td>"+v.eResult+"</td>"+
								"<td>"+v.eMemo+"</td>"+						
							"</tr>";
						$("#ttbody2").append(trTag);
						schoolGradeData[i] = { y : v.examItem.eiTitle, a: v.eResult};						
					});
					console.log("schoolGradeData : " +schoolGradeData);
					showGraph(schoolGradeData);
					
				}else{
					$("#ttbody2").append("<tr><td colspan='5'>데이터없음</td></tr>");
					$("#bar-example").html("<p>데이터 없음</p>");
				}
			}
			
				
		});
}

function showGraph(schoolGradeData){
	Morris.Bar({
		  element: 'bar-example',
		  data: schoolGradeData,
		  xkey: 'y',
		  ykeys: ['a'],
		  labels: ['점수'],
		  barColors : ['#EC407A']
	});
}

function getMyExamRecord(cNo){
	var gradeData = [];
	var gradeMemo = [];
		$.ajax({
			// "exam/viewStudentExam/{sId}/{cNo}"
			url: "${pageContext.request.contextPath}/exam/viewStudentExam/"+sId+"/"+cNo,
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);
				$("#ttbody").html("");
				$("#area-example").html("");
				if(data.length != 0){
					$.each(data, function(i, v) {					
						var trTag = 
							"<tr>"+
								"<td>"+v.eNo+"</td>"+
								"<td>"+v.course.cName+"</td>"+
								"<td>"+v.examItem.eiTitle+"</td>"+
								"<td>"+v.eResult+"</td>"+
								"<td>"+v.eMemo+"</td>"+						
							"</tr>";
						$("#ttbody").append(trTag);
						console.log("eDate : "+v.eDate);
						var eDate = new Date(v.eDate);
						gradeData[i] = { y : v.eDate, a:v.eResult};	
						gradeMemo[i] = v.eMemo;	
					});
					console.log("gradeData : "+gradeData);
					 gradeGraph(gradeData, gradeMemo);
				}else{
					$("#ttbody").append("<tr><td colspan='5'>데이터없음</td></tr>");
					$("#area-example").html("<p>데이터 없음</p>");
				}
			}
			
				
		});
}

function gradeGraph(gradeData, gradeMemo){
	Morris.Line({
		  element: 'area-example',
		  data: gradeData,
		  xkey: 'y',
		  ykeys: ['a'],
		  labels: ['점수'],
		  ymax : 100,
		  lineColors: ['#2196F3'],
		  dateFormat: function (d) {
	            var date = new Date(d);
	            var year = date.getFullYear();
	            var month = (date.getMonth()+1) < 10 ? "0"+(date.getMonth()+1): (date.getMonth()+1);
	            var day = date.getDate() < 10 ?  "0"+date.getDate() : date.getDate();
	            return year + "-" + month + "-" + day;
	      },
		  hoverCallback: function (index, options, content, row) {
			// return "["+index+"]"+content + "sin(" + row.x + ") = " + row.y;
			 return content+gradeMemo[index];
			}
		});
}
	var arrCourseClass= [];
	var arrCourseCNo= [];
	var arrCourseSbNo = [];
	$(document).on("click",".cNo",function(){
		  var courseNo = $(this).attr("class");
		  $(".cNo").removeClass("course-click-event");
		  for ( var i = 0; i < arrCourseClass.length; i++){
			  if(courseNo.match(arrCourseClass[i]) != null){
				  $("."+arrCourseClass[i]).addClass("course-click-event");
				  getMyExamRecord(arrCourseCNo[i]);
				  getMyExamRecordBySubject(arrCourseSbNo[i]);
	  	 		}
		  }
	});

function getMyCourses(){
	$.ajax({
		// /myRegisteredCourses/{sId}/{year}/{month}/{rsNo}
		url: "${pageContext.request.contextPath}/course/myRegisteredCourses/"+sId+"/"+year+"/"+(month+1)+"/"+1,
		type : "get",
		dataType: "json",
		success:function(data){
			console.log(data);
			$(".reg-course-table").html("");
			for(var i = 0; i < data.length; i++){
				console.log(data[i].cName + " : " + data[i].teacher.tName);
				var trTag =
					"<tr>"
					+	"<td class='cNo cNo-"+data[i].cNo+"''>" + data[i].subject.sbName +"</td>"
					+	"<td class='cNo cNo-"+data[i].cNo+"''>" + data[i].cName +"</td>"
					+	"<td class='cNo cNo-"+data[i].cNo+"''>" + data[i].teacher.tName +"</td>"
					+"</tr>";

					arrCourseClass[i] = "cNo-"+data[i].cNo;
					arrCourseCNo[i] = data[i].cNo;
					arrCourseSbNo[i] = data[i].subject.sbNo;
				$(".reg-course-table").append(trTag);				
			}
			$("."+arrCourseClass[0]).addClass("course-click-event");
			getMyExamRecord(data[0].cNo);
			getMyExamRecordBySubject(data[0].subject.sbNo);
			
			
		}
			
		})
	}
</script>