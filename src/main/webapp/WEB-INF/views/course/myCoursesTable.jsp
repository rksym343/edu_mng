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
			<div class="col-sm-2">
				<div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>강의명</th>
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
			<div class="col-sm-7">
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
                                			<th class="0 col-sm-1">일</th>
                                			<th class="1 col-sm-1">월</th>
                                			<th class="2 col-sm-1">화</th>
                                			<th class="3 col-sm-1">수</th>
                                			<th class="4 col-sm-1">목</th>
                                			<th class="5 col-sm-1">금</th>
                                			<th class="6 col-sm-1">토</th>
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
			 <!-- col-sm-7 -->
			 <div class="col-sm-3">
			 	<!-- /.panel -->
                    <div class="chat-panel panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bullhorn  "></i> Notice
                            
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <ul class="chat">
                                
                                
                            </ul>
                        </div>
                    </div>
                    <!-- /.panel .chat-panel -->
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
		//getMsgByCourse(-1);
	   	$("th."+day).css("color","red");
	});

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
	      });
	      
	      function getMyCourses(){
	    	  changeCalTitle();
	  		$.ajax({
	  			//myCoursesTable/{tId}/{year}/{month}
	  			url: "${pageContext.request.contextPath}/course/myCoursesTable/"+tId+"/"+year+"/"+(month+1),
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
  							/* +	"<td class='cNo cNo-"+data[i].cNo+"''>" + data[i].teacher.tName +"</td>" */
  							+"</tr>";
  							arrCourseClass[i] = "cNo-"+data[i].cNo;
  							arrCourseCno[i] = data[i].cNo;
  						$(".reg-course-table").append(trTag);
  						
	  					$.each(data[i].timetables, function(idx, v) {
	  						var liTag = "<li class='c-timetable cNo cNo-"+data[i].cNo+"'><p><b>"
	  							+data[i].cName+"</b></p><p style='font-size: 12px'>"+viewTimes(v.ttStarttime, v.ttEndtime)+"</p></li>";
	  						$("td.d"+v.ttDay+" ul").append(liTag);
	  						
	  					});
	  				}
	  			}
	  				
	  			})
	  		}
	      
	      function viewTimes(startTime, endTime){
	    	  return startTime+"시 ~"+ endTime+"시";
	      }/* 
	      
	      function viewTime(time){
	    	var timeStr = time.toString();
	  		var viewTime = timeStr.substr(0,2)+":"+timeStr.substr(2,2);
	  		return viewTime;
	      }
	       */
	      function getMsgByCourse(cNo){
	    	  $.ajax({
	    		 	// /listMsg/{memberType}/{id}/{cnt}/{cNo}
					url: "${pageContext.request.contextPath}/message/listMsg/"+memberType+"/"+id+"/"+0+"/"+(cNo),
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);		
						$(".chat").html("");
						var liTag ="";
						$.each(data, function(i, v) {
							var tName = v.teacher.tName;
							var msg = v.msgContent;
							var date = new Date(v.regDate);
							var viewDate = viewTimeStr(date);
							if(cNo == -1 && v.cNo%2 != 0 || cNo > 0 && i%2 != 0){
								liTag = 
								"<li class='left clearfix'>"
                                + "<span class='chat-img pull-left'>"
                                +   "<img src='http://placehold.it/50/55C1E7/fff' alt='User Avatar' class='img-circle' />"
                                + "</span>"
                                + "<div class='chat-body clearfix'>"
                                +    "<div class='header'>"
                                +        "<strong class='primary-font'>"+tName+"</strong>"
                                +        "<small class='pull-right text-muted'>"
                                +            "<i class='fa fa-clock-o fa-fw'></i>" 
                                + viewDate
                                +        "</small>"
                                +    "</div>"
                                +    "<p>" + msg + "</p></div></li>";
                            
						 	}else{
						 		liTag = 
									"<li class='right clearfix'>"
	                                + "<span class='chat-img pull-right'>"
	                                +   "<img src='http://placehold.it/50/FA6F57/fff' alt='User Avatar' class='img-circle' />"
	                                + "</span>"
	                                + "<div class='chat-body clearfix'>"
	                                +    "<div class='header'>"
	                                +        "<small class='text-muted'>"
	                                +            "<i class='fa fa-clock-o fa-fw'></i>" 
	                                + viewDate
	                                +        "</small>"
	                                +        "<strong class='pull-right primary-font'>"+tName+"</strong>"
	                                +    "</div>"
	                                +    "<p>" + msg + "</p></div></li>";
						 	}
							
							$(".chat").append(liTag);
						});
			
			       		
					}
				});
	      }
</script>