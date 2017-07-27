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
	</style>

		<div class="row">
			<label for="myCourse" class="col-md-1">내 수업</label>
			<div class="col-md-3">
				<select id="myCourse" class="form-control col-md-3" name="cNo">
					
				</select>
			</div>
		</div>
		<hr>

		<div class="row">
			<div class="col-sm-2">
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
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
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

	     $("#prevMonth").click(function(e) {
	      	e.preventDefault();
	      	if(month == 1){
	      		year = year-1;
	      		month = 12;
	      	}else{
	      		month = month-1;
	      	}	
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
	          	getMyCourses();
	      });

	   	/* var arrCourseClass= [];
	   	var arrCourseCno = [];
	      $(document).on("click",".cNo",function(){
	    	  var courseNo = $(this).attr("class");
	    	  $(".cNo").removeClass("course-click-event");
	    	  for ( var i = 0; i < arrCourseClass.length; i++){
	    		  if(courseNo.match(arrCourseClass[i]) != null){
	    			  if(courseNo.match("course-click-event") != null){ 
	    				  $("."+arrCourseClass[i]).removeClass("course-click-event");
	    				  getMsgByCourse(-1);
	    			  }else{
	    				  $("."+arrCourseClass[i]).addClass("course-click-event");
	    				  getMsgByCourse(arrCourseCno[i]);
	    			  }
		    	  }
	    	  }
	      }); */
	      
	      $("#myCourse").change(function(e) {
	    	  var cNo = $("select#myCourse option:selected").val();
	    	  var cName = $("select#myCourse option:selected").text();
			$("#course-title").html(cName);
	    	 getMyStudent(cNo);
	      });

	});
	   	var cNo1 = 0;
	      function getMyCourses(){
	    	changeCalTitle();
	  		$.ajax({
	  			//myCoursesTable/{tId}/{year}/{month}
	  			url: "${pageContext.request.contextPath}/course/myCoursesTable/"+tId+"/"+year+"/"+(month+1),
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				console.log(data);	  				
	  				$("#myCourse").html("");
	  				for(var i = 0; i < data.length; i++){
	  					if(i ==0){
	  						cNo1 = data[i].cNo;
	  						$("#course-title").html(data[i].cName);
	  					}
	  					console.log(data[i].cName + " : " + data[i].teacher.tName);
	  					var optionTag = "<option value='"+data[i].cNo+"'>"+ data[i].cName+"</option>";
	  					$("#myCourse").append(optionTag);

	  				}
	  			}	  				
	  			});

  			getMyStudent(cNo1);
	  		}
	      
	      
	      function getMyStudent(cNo){
	    	  $.ajax({
	    		 	// /myCoursesWithStudent/{cNo}/{year}/{month}
					url: "${pageContext.request.contextPath}/course/myCoursesWithStudent/"+cNo+"/"+year+"/"+(month+1),
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);	
						
						$("#student-table").html("");
						$.each(data, function(i, v) {
							var trTag = "<tr><td><a class='my-stu' href='"+v.student.sId+"'>"+ v.student.sName+"</a></td></tr>";							
							$(".student-table").append(trTag);
						});
			
			       		
					}
				});
	      }
</script>