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
		.color-label{
			margin : 0 auto;
		}
		.color-label td {
			margin : 5px;
			text-align: center;
			height: 30px;
			font-size: 14px;
			border-top: none;
		}
		.view-empty-chart{
			line-height: 
		}
	</style>
                    
	
	 <div class="row">
				<div class="col-lg-8">
                    <div class="panel panel-default" >
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
                            <div class="color-label" >
                                <table class="table">
                                    <tbody>
                                    <tr>
	                                    <c:forEach items="${statusList }" var="status" varStatus="index">
	                                   			<td class="viewColor col-lg-1"> </td>
	                                   		<c:if test="${!index.last }">
	                                            <td class="col-lg-1">${status.asStatus }</td>
                                    	 	</c:if>
	                                    	 <c:if test="${index.last }">
		                                         <td class="col-lg-1">지각&조퇴</td>
	                                    	 </c:if>
	                                    </c:forEach>
                                    </tr>
                                    <%-- <tr>
	                                    <c:forEach items="${statusList }" var="status" varStatus="index">
	                                    	
	                                    </c:forEach>
                                    </tr>
                                    --%>
                                    </tbody>
                                </table>
                                
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                
                <div class="col-lg-4">
                 	<div id="donut-attendance-chart"></div>
                </div>
                
                
                </div>
                
                
	
<%@ include file="../include/footer.jsp"%>	


	 <script>

		
	 	var sId = "sss01";
	 	var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		
		
    	var arrColor = ["default","danger","info","warning","success","active"];/* 
    	var arrChartKey = ["지각&조퇴", "결석","지각","등원","조퇴"];
    	var arrChartColor = ["#dddddd", "#EC407A","#E5D85C","#2196F3","#8BC34A"]; */
    	 
    	 $(function() {	 
    		
	    	 newCalendarInfo();
	         $(".viewColor").each(function(i, obj) {
	        	  // 색깔 안내판
					$(this).addClass(arrColor[i+1]);
			 });
	     });
    	 
    	 function newCalendarInfo(){
  		   changeCalTitle();
  		   $(".view-my-calendar").html(makeMyCalendar(year, month));
  		   getMyRecords();
  		   attendanceData();
  	   }
    	 
    	 Handlebars.registerHelper("tempdate", function(time) {
    		 // date형식 변환하여 date만 가져오기
 			var dateObj = new Date(time);
 			var date = dateObj.getDate();
 			return date;
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
	     
	     function attendanceData(){
	 		var arr =[];
	 		$.ajax({
	 			//viewAttendanceChart/{sId}/{year}/{month}
	 			url: "${pageContext.request.contextPath}/attend/viewAttendanceChart/"+sId+"/"+year+"/"+(month+1),
	 			type : "get",
	 			dataType: "json",
	 			success:function(v){
	 				console.log('Size of object: '+ Object.keys(v).length);
	 				console.log('KEYS: '+ Object.keys(v));
	 				
	 				var size = Object.keys(v).length;

	 				console.log("size: "+size);
	 				
	 				var idx = 0;
	 				$.each(v, function(key, val) {
	 					console.log(key + " : " + val);
	 					if(val != 0){
	 						console.log("===저장 : "+key + " : "  + val);
		 					arr[idx] = {
		 						label: key,
		 						value: val
		 						}
	 						idx++;
	 					}
	 				});
	 				$("#donut-attendance-chart").css("height", $(".view-my-calendar").parent().parent().css("height"));
	 				$("#donut-attendance-chart").css("text-align","center");
	 				console.log("arr.length : " + arr.length);
	 				for(var k  = 0; k <arr.length; k++){
	 					console.log("arr["+k+"] : " + arr[k]);
	 				}
	 				if(arr.length > 0){
	 					
	 					showGraph(arr);
	 				}else{
	 					$("#donut-attendance-chart").html("<p>데이터없음</p>");
	 					$("#donut-attendance-chart").find("p").css("line-height",$("#donut-attendance-chart").css("height"));
	 					$("#donut-attendance-chart").find("p").addClass("text-muted")
	 				}
	 			}
	 		});
	 	}
	     
	     function showGraph(myData){
	    	 Morris.Donut({
	   		  element: 'donut-attendance-chart',
	   		  data: myData,
	   		 colors: ["#dddddd", "#EC407A","#E5D85C","#2196F3","#8BC34A"],
	   		});
	     }
     </script>
     <!-- ["#F2DEDE","#D9EDF7","#FCF8E3","#DFF0D8", "#F5F5F5"] -->
     
     
