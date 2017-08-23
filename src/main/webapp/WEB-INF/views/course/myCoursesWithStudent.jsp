<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ include file="../include/header.jsp"%>
	<style>
		li.c-timetable{
			border : 1px dotted gray;
			border-radius:10px;
			padding : 5px;
			margin : 5px;
		}
		table td, table th{
			text-align: center;
		}
		.course-click-event{
			background-color: #ddd;	
		}
		
		li.course-click-event{			
			border-radius:10px;		
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
	
	
	
<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				학생성적조회
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}">Home</a></li>
				<li class="active">학생성적조회</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->

		<div class="row">
			<div class="col-md-3">
				<select id="myCourse" class="form-control col-md-3" name="cNo">
					
				</select>
			</div>	
			<div class="col-md-3">
				<select id="myStudents" class="form-control col-md-3" name="cNo">
					
				</select>
			</div>				
		</div>
		<hr>

		<div class="row" id="viewDiv">
			<!-- <div class="col-sm-2">
				<div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th id="course-title"></th>
                                        </tr>
                                    </thead>
                                    <tbody id="student-table" class="student-table">
                                    </tbody>
                                </table>
                            </div>
                            /.table-responsive
                        </div>
                        /.panel-body
                    </div>
                    /.panel
			</div> -->
			<div class="col-md-12">
				<div class="media">
					<!-- 학생 프로필 -->
	    			<div class="media-left media-top">
	     			 <img src="" class="media-object" style="width:80px">
	   				</div>
				    <div class="media-body">
				      <h4 class="media-heading"></h4>
				       <p></p>
				    </div>
			  	</div>
	 			<hr>
	 			<h2>학교테스트</h2>
				<div id="bar-example"  class="chart"></div>
				<hr>
				<h2>학원테스트</h2>
				<div id="area-example" class="chart"></div>
	 		</div>
			
		</div>

		

		

<%@ include file="../include/footer.jsp"%>	
<script>
	var tId= memberId;
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	var date = today.getDate();
	var day = today.getDay();
	//해당주 첫째날
	var firstDate = new Date(year, month, date-day); 
	
	$(function() {	   
		getMyCourses();  
	      
	    $("#myCourse").change(function(e) {
	    	var cNo = $("select#myCourse option:selected").val();
	    	var cName = $("select#myCourse option:selected").text();
	    	var sbNo = $("select#myCourse option:selected").attr("data-sbNo");
			$("#course-title").html(cName);
	      	getMyStudent(cNo, sbNo);
	    });
	      
	   
		$(document).on("change", "#myStudents", function(obj) {
			var sId = $("select#myStudents option:selected").attr("data-sId");
			var cNo = $("select#myStudents option:selected").attr("data-cNo");
			var sbNo = $("select#myStudents option:selected").attr("data-sbNo");
			getRecords(sId, cNo, sbNo);
		})
	      
	   
	});
	
	
	      function getMyCourses(){
	  		$.ajax({
	  			//myCoursesTable/{tId}/{year}/{month}
	  			url: "${pageContext.request.contextPath}/course/myCoursesTable/"+tId+"/"+year+"/"+(month+1),
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				console.log(data);	  				
	  				$("#myCourse").html("");

	  			   	var cNo1 = 0;
	  			   	var sbNo = 0;
	  				for(var i = 0; i < data.length; i++){
	  					if(i == 0){
	  						cNo1 = data[i].cNo;
	  						sbNo = data[i].subject.sbNo;
	  						$("#course-title").html(data[i].cName);
	  					}
	  					console.log(data[i].cName + " : " + data[i].teacher.tName);
	  					var optionTag = "<option value='"+data[i].cNo+"' data-sbNo ='"+data[i].subject.sbNo+"'>"+data[i].cName+"</option>";
	  					$("#myCourse").append(optionTag);
	  					
	  				}
	  				
	  	  			getMyStudent(cNo1, sbNo);
	  			}	  				
	  			});
			
	  		}
	      
	      
	      function getMyStudent(cNo, sbNo){
	    	  $.ajax({
	    		 	// /myCoursesWithStudent/{cNo}/{year}/{month}
					url: "${pageContext.request.contextPath}/course/myCoursesWithStudent/"+cNo+"/"+year+"/"+(month+1),
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);	
						
						$("#student-table").html("");
						
						$("#myStudents").html("");

						var sId1 = "";
						if(data == null){
						
							return;
						}
						$.each(data, function(i, v) {
							/* var trTag = "<tr>"
							+"<td><a class='my-student' data-sId="+v.student.sId+" data-cNo="+cNo+" data-sbNo="+sbNo+">"
							+ v.student.sName+"</a></td></tr>";							
							$(".student-table").append(trTag); */
							if(i==0){
								sId1 = v.student.sId;
							}
							
							var optionTag = "<option class='my-student-opt' data-sId="+v.student.sId+" data-cNo="+cNo+" data-sbNo="+sbNo+">"
												+v.student.sName+"</option>";
							$("#myStudents").append(optionTag);
						});
			

						getRecords(sId1, cNo, sbNo);
					}
				});
	      }
	      
	      $(document).on("click", ".my-student", function(obj) {
			var sId = $(this).attr("data-sId");
			var cNo = $(this).attr("data-cNo");
			var sbNo = $(this).attr("data-sbNo");
			getRecords(sId, cNo, sbNo);
		})
	      
	      function getRecords(sId, cNo, sbNo){
	  		getStudentInfo(sId);
	  		getMyExamRecordBySubject(sId, sbNo);
	  		getMyExamRecord(sId, cNo);
	  	}
	     
	      
	      function getStudentInfo(sId){
	    	  $.ajax({
					url: "${pageContext.request.contextPath}/user/readStudentInfo/"+sId,
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);	
						if(data.sPicture!=null){
							$("img.media-object").attr("src","${pageContext.request.contextPath}/file/displayFile?filename="+data.sPicture);
						}
						$(".media-heading").html(data.sName+"("+data.sId+")");
						$(".media-body p").html(data.school+" / "+ data.sGrade.gdName);
			
			       		
					}
				});
	      }
	      
	      function getMyExamRecordBySubject(sId, sbNo){

	    		var schoolGradeData = [];
	    			$.ajax({
	    				// "exam/viewStudentExam/{sId}/{cNo}"
	    				url: "${pageContext.request.contextPath}/exam/viewStudentExam/"+sId+"/"+sbNo,
	    				type : "put",
	    				dataType: "json",
	    				success:function(data){
	    					console.log(data);
	    					$("#bar-example").html("");
	    					if(data.length != 0){
	    						$.each(data, function(i, v) {					
	      							schoolGradeData[i] = { y : v.examItem.eiTitle, a: v.eResult};						
	    						});
	    						console.log("schoolGradeData : " +schoolGradeData);
	    						showGraph(schoolGradeData);
	    						
	    					}else{
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

	    	function getMyExamRecord(sId, cNo){
	    		var gradeData = [];
	    		var gradeMemo = [];
	    			$.ajax({
	    				url: "${pageContext.request.contextPath}/exam/viewStudentExam/"+sId+"/"+cNo,
	    				type : "get",
	    				dataType: "json",
	    				success:function(data){
	    					console.log(data);	    					
	    					$("#area-example").html("");
	    					if(data.length != 0){
	    						$.each(data, function(i, v) {					
	    							
	    							console.log("eDate : "+v.eDate);
	    							var eDate = new Date(v.eDate);
	    							gradeData[i] = { y : v.eDate, a:v.eResult};	
	    							gradeMemo[i] = v.eMemo;	
	    						});
	    						console.log("gradeData : "+gradeData);
	    						 gradeGraph(gradeData, gradeMemo);
	    					}else{
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
</script>