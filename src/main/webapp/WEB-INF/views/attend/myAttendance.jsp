<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">출석기록</h1>
</div>
</div> <!-- div row -->
                    
	<style>
		.my-cal th, .my-cal td{
			text-align: center;
		}
	</style>
	 <div class="row">
				<div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center">
                           <a id="prevMonth" href="#"><span class="fa fa-angle-left"></span></a>
                           		 <b> <span class="mYear">${curYear }</span>년 <span class="mMonth">${curMonth }</span>월  </b> 
                           	<a id="nextMonth" href="#"><span class="fa fa-angle-right"></span></a>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive view-my-calendar">
                                
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
                
                <div class="col-lg-3">
                    <div class="panel panel-default">
                       <!--  <div class="panel-heading">
                            Basic Table
                        </div>
                        /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                    <c:forEach items="${statusList }" var="status" varStatus="index">
                                    	 <c:if test="${!index.last }">
	                                    	<tr>
	                                    		<td class="viewColor col-lg-1"></td>
	                                            <td class="col-lg-1">${status.asStatus }</td>
	                                    	</tr>
                                    	 </c:if>
                                    	 <c:if test="${index.last }">
                                    	 	<tr>
	                                    		<td class="viewColor col-lg-1"></td>
	                                            <td class="col-lg-1">지각&조퇴</td>
	                                    	</tr>
                                    	 </c:if>
                                    </c:forEach>
                                   
                                    
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
                <div class="row">
                	  <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Pie Chart Example
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="flot-chart">
                                <div class="flot-chart-content" id="flot-pie-chart">
                                	<div id="placeholder"></div>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                </div>
                
	
<%@ include file="../include/footer.jsp"%>	

	 <script>

		
	 	var sId = "sss01";
	 	var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		var series = [];
		
		
    	 var arrColor = ["default","danger","info","warning","success","active"];
    	 
    	 Handlebars.registerHelper("tempdate", function(time) {
    		 // date형식 변환하여 date만 가져오기
 			var dateObj = new Date(time);
 			var date = dateObj.getDate();
 			return date;
 		});	
    	 
	     $(function() {	 
	    	 newCalendarInfo();
	         $(".viewColor").each(function(i, obj) {
	        	  // 색깔 안내판
					$(this).addClass(arrColor[i+1]);
			 });
	     });

	     $("#prevMonth").click(function(e) {
	      	e.preventDefault();
	      	if(month == 0){
	      		year = year-1;
	      		month = 11;
	      	}else{
	      		month = month-1;
	      	}	
	      	newCalendarInfo();
	      });
	      
	      $("#nextMonth").click(function(e) {
	          	e.preventDefault();
	          	if(month == 11){
	          		year = year+1;
	          		month = 0;
	          	}else{
	          		month = month+1;
	          	}	
	          newCalendarInfo();
	      });
	   
	   function newCalendarInfo(){
		   changeCalTitle();
		   $(".view-my-calendar").html(makeMyCalendar(year, month));
		   getMyRecords();
	   }
	     
	     function getMyRecords() {
				$.ajax({
					url: "${pageContext.request.contextPath}/attend/myAttendanceRecord/"+sId+"/"+year+"/"+(month+1),
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);
						var myCal = $(".my-cal");
						for(var i = 0; i < data.length ; i++){
							var theDate = new Date(data[i].theTime).getDate();
							var idx = data[i].attendanceStatus.asNo;
							var td = $("table.my-cal").find("td."+theDate);
							if(idx != 5){
								td.addClass(arrColor[idx]);
							}
						}
						
						$("table.my-cal td").each(function(i, element) {
							if($(element).hasClass(arrColor[4])){
								if($(element).hasClass(arrColor[2])){
									// 조퇴 
									$(element).removeClass();
									$(element).addClass($(element).html());
									$(element).addClass(arrColor[4]);
								}else if($(element).hasClass(arrColor[3])){
									// 조퇴 + 지각									
									$(element).removeClass();
									$(element).addClass($(element).html());
									$(element).addClass(arrColor[5]);
								}
							}
						});
						
					
					}
						
				});
			} 
     </script>
     
     
