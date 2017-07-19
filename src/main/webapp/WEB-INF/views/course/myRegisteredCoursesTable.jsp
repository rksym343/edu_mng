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


		

<%@ include file="../include/footer.jsp"%>	
<script>
	var sId="sss01";
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth()+1;
	var date = today.getDate();
	var day = today.getDay();
	//해당주 첫째날
	var firstDate = new Date(year, month-1, date-day); 
	
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
	      });
	      
	      $("#nextMonth").click(function(e) {
	          	e.preventDefault();
	          	if(month == 12){
	          		year = year+1;
	          		month = 1;
	          	}else{
	          		month = month+1;
	          	}	
	      });
	      
	      
	   
	      function getMyCourses(){
	  		$.ajax({
	  			// /myRegisteredCourses/{sId}/{year}/{month}/{rsNo}
	  			url: "${pageContext.request.contextPath}/course/myRegisteredCourses/"+sId+"/"+year+"/"+month+"/"+1,
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				for(var i = 0; i < data.length; i++){
	  					$.each(data[i].timetables, function(i, v) {
	  						/* console.log(i + " " + v.ttDay);
	  						console.log(i + " " + v.ttStarttime);
	  						console.log(i + " " + v.ttEndtime); */
	  						var liTag = "<li class='c-timetable'><b>"+data[i].cName+"</b><br>"+viewTimes(v.ttStarttime, v.ttEndtime)+"</li>";
	  						$("td.d"+v.ttDay+" ul").append(liTag);
	  					});
	  					//console.log("=======");
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