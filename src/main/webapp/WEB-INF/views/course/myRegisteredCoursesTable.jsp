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
	</style>

		<div class="row">
			<div class="col-sm-3">
				<div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
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
			<div class="col-sm-8">
             <div class="panel panel-default">
                 <div class="panel-heading" style="text-align: center">
                           <a id="prevMonth" href="#"><span class="fa fa-angle-left"></span></a>
                           		 <b> <span class="mYear">${curYear }</span>년 <span class="mMonth">${curMonth }</span>월  </b> 
                           	<a id="nextMonth" href="#"><span class="fa fa-angle-right"></span></a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive  view-my-calendar">
                                <table class='table table-bordered'>
                                	<thead>
                                		<tr>
                                			<th class="0">일</th>
                                			<th class="1">월</th>
                                			<th class="2">화</th>
                                			<th class="3">수</th>
                                			<th class="4">목</th>
                                			<th class="5">금</th>
                                			<th class="6">토</th>
                                		</tr>
                                	</thead>
                                	<tbody>
                                		<tr>
                                			<c:forEach begin="0" end="6" var="idx">
                                				<td class="d${idx}">
                                					<ul>
                                					
                                					</ul>
                                				</td>
                                			</c:forEach>
                                		</tr>
                                	</tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
			</div>
			 <!-- col-sm-8 -->
		</div>


		

<%@ include file="../include/footer.jsp"%>	
<script>
	var sId="sss01";
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	var date = today.getDate();
	var day = today.getDay();
	//해당주 첫째날
	var firstDate = new Date(year, month, date-day); 
	
	$(function() {	   
		getMyCourses();
	   	$("th."+day).css("color","red");
	});
		  
	Handlebars.registerHelper("timeview", function(time) {
		var timeStr = time.toString();
		var viewTime = timeStr.substr(0,2)+":"+timeStr.substr(2,2);
		return viewTime;
	})
		 	  

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

	   	var arrCourseClass= [];
	      $(document).on("click",".cNo",function(){
	    	  var courseNo = $(this).attr("class");
	    	  $(".cNo").removeClass("course-click-event");
	    	  for ( var i = 0; i < arrCourseClass.length; i++){
	    		  if(courseNo.match(arrCourseClass[i]) != null){
	    			  if(courseNo.match("course-click-event") != null){ 
	    				  $("."+arrCourseClass[i]).removeClass("course-click-event");
	    			  }else{
	    				  $("."+arrCourseClass[i]).addClass("course-click-event");
	    			  }
		    	  }
	    	  }
	      });
	      
	      function getMyCourses(){
	    	  changeCalTitle();
	  		$.ajax({
	  			// /myRegisteredCourses/{sId}/{year}/{month}/{rsNo}
	  			url: "${pageContext.request.contextPath}/course/myRegisteredCourses/"+sId+"/"+year+"/"+(month+1)+"/"+1,
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				console.log(data);
	  				$(".c-timetable").remove();
	  				$(".reg-course-table").html("");
	  				for(var i = 0; i < data.length; i++){
	  					console.log(data[i].cName + " : " + data[i].teacher.tName);
  						var trTag =
  							"<tr>"
  							+	"<td class='cNo cNo-"+data[i].cNo+"''>" + data[i].cName +"</td>"
  							+	"<td class='cNo cNo-"+data[i].cNo+"''>" + data[i].teacher.tName +"</td>"
  							+"</tr>";
  							arrCourseClass[i] = "cNo-"+data[i].cNo;
  						$(".reg-course-table").append(trTag);
  						
	  					$.each(data[i].timetables, function(idx, v) {
	  						var liTag = "<li class='c-timetable cNo cNo-"+data[i].cNo+"'><b>"
	  							+data[i].cName+"</b><br>"+viewTimes(v.ttStarttime, v.ttEndtime)+"</li>";
	  						$("td.d"+v.ttDay+" ul").append(liTag);
	  						
	  					});
	  				}
	  			}
	  				
	  			})
	  		}
	      
	      function viewTimes(startTime, endTime){
	    	  return viewTime(startTime)+"~"+ viewTime(endTime);
	      }
	      
	      function viewTime(time){
	    	var timeStr = time.toString();
	  		var viewTime = timeStr.substr(0,2)+":"+timeStr.substr(2,2);
	  		return viewTime;
	      }
</script>