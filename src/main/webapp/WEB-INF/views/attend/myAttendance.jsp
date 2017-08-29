<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/page_header.jsp"%>
  <!-- Morris Charts CSS -->
<link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">

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
		
		.detail{
			font-size: 12px;
		}
		
		.myLabel{
			background-color: #ddd;
			padding : 5px;
			border-radius: 5px;
			color : white;
		}
    	
    	.m-active{
    		background-color: #ddd;
    		color : white;
    	}
    	.m-danger{
    		background-color: #EC407A;
    		color : white;
    	}
    	.m-info{
    		background-color: #2196F3;
    		color : white;
    	}
    	.m-warning{
    		background-color: #E5D85C;
    		/* background-color: #2196F3; */
    		color : white;
    	}
    	.m-success{
    		background-color: #8BC34A;
    		color : white;
    	}
    	
	</style>
                    
	
	
	 <div class="container">
	  <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> 이번달 출석기록
                    <!-- <small>Subheading</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home</a>
                    </li>
                    <li class="active">출석표</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
	 
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
                
                
 <!-- Modal -->
  <div class="modal fade" id="myAttendRecord" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">
          	
          	Modal Header
          </h4>
        </div>
        <div class="modal-body">
          <p>This is a small modal.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
                
	
<%@ include file="../include/page_footer.jsp"%>
  
    <!-- my Calendar -->
    <script src="${pageContext.request.contextPath}/resources/myjs/my_cal.js"></script>
    
    <!-- Morris Charts JS -->
    <script src="${pageContext.request.contextPath}/resources/vendor/raphael/raphael.min.js"></script>
	<!-- <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> -->
	<script src="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.min.js"></script>


	 <script>
		var sId = memberId;
		
	 	var today = new Date();
		var year = today.getFullYear();
		var month = today.getMonth();
		
		
    	var arrColor = ["m-default","m-danger","m-info","m-warning","m-success","m-active"];
    	var arrChartKey = ["지각&조퇴", "결석","지각","등원", "조퇴"]; /* 
    	var arrChartColor = ["#dddddd", "#EC407A","#E5D85C","#2196F3","#8BC34A"]; */
    	 
    	 $(function() {	 
    		
	    	 newCalendarInfo();
	         $(".viewColor").each(function(i, obj) {
	        	  // 색깔 안내판
					$(this).addClass(arrColor[i+1]);
			 });
	         
	        
	     });
    	 
    	function addModal(){
    		 $("table.my-cal td").attr("data-toggle","modal");
	         $("table.my-cal td").attr("data-target","#myAttendRecord");
    	}
    	
    	 function newCalendarInfo(){
  		   changeCalTitle();
  		   $(".view-my-calendar").html(makeMyCalendar(year, month));
  		   getMyRecords();
  		   attendanceData();
  		 	addModal();
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
	   
	    $(document).on("click", "table.my-cal td", function() {
	    	var yy =  $(".mYear").html();
	    	var mm = $(".mMonth").html();
	    	var dd = $(this).attr("data-date");
	    	
	    	$.ajax({
				// /viewAttendRecordByDate/{sId}/{year}/{month}/{date}
	    		url: "${pageContext.request.contextPath}/attend/viewAttendRecordByDate/"+sId+"/"+yy+"/"+mm+"/"+dd,
				type : "get",
				dataType: "json",
				success:function(data){
					console.log(data);
					
					// 메시지 제목
					$(".modal-content .modal-title").html("<i class='fa fa-calendar'></i> "+yy+"년 "+mm+"월 "+dd+"일");
					
					var content = "";
					if(data.length == 0){
						content = "<p class='text-muted'>데이터 없음</p>";
					}
					$.each(data, function(i, obj) {
						var dateString = viewTime(obj.theTime);
						content += "<p>"+viewLabel(obj.attendanceStatus.asStatus) + " "+dateString+"</p>"; 
					});
					// 메시지 내용
					$(".modal-content .modal-body").html(content);	
				}
	   		});
	    });
	    
	    function viewTime(theTime){
	    	var date = new Date(theTime);
			var yyy = date.getFullYear();
			var mmm = (date.getMonth()+1) < 10? "0"+(date.getMonth()+1) : (date.getMonth()+1);
			var ddd = date.getDate() < 10? "0"+date.getDate(): date.getDate();
			var hhhh = date.getHours()< 10? "0"+date.getHours(): date.getHours();
			var mmmm = date.getMinutes()< 10? "0"+date.getMinutes(): date.getMinutes();
			var ssss = date.getSeconds()< 10? "0"+date.getSeconds(): date.getSeconds();
			var dateString = yyy+"-"+mmm+"-"+ddd+" "+hhhh+":"+mmmm+":"+ssss;
			return dateString;
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
								//$(td).find(".detail").html(arrChartKey[idx]);
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
	 						console.log("===저장 : "+key + " : "  + val);
		 					arr[idx] = {
		 						y: key,
		 						a: val
		 					}
	 						idx++;	 					
	 				});
	 				$("#donut-attendance-chart").css("height", $(".view-my-calendar").parent().parent().css("height"));
	 				$("#donut-attendance-chart").css("text-align","center");
	 				console.log("arr.length : " + arr.length);
	 				for(var k  = 0; k <arr.length; k++){
	 					console.log("arr["+k+"] : " + arr[k]);
	 				}
	 				if(arr.length > 0){
	 					$("#donut-attendance-chart").html("");
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
	    	 Morris.Bar({
	   		  element: 'donut-attendance-chart',
	   		  data: myData,
	   		  xkey: 'y',
	   		  ykeys: ['a'],
	   		  labels: ['횟수'],
	   		  resize:true,
	   		  barColors : function (row, series, type) {
		   		    console.log("--> "+row.label, series, type);
		   		    if(row.label == "지각&조퇴") return "#dddddd";
		   		    else if(row.label == "지각") return "#E5D85C";
		   		    else if(row.label == "조퇴") return "#8BC34A";
		   		 	else if(row.label == "등원") return "#2196F3";
		   			else if(row.label == "결석") return "#EC407A";
		   		  },
				  hoverCallback: function (index, options, content, row) {
						// return "["+index+"]"+content + "sin(" + row.x + ") = " + row.y;
					return content;
				 }
	   		}); 
	    }
	     
	     
	     function viewLabel(status){
		    	var label = "<span class='myLabel' style='";
		    	
		    	if(status == "하원") label += "background-color : #2196F3;'>";
	   		    else if(status == "지각") label += "background-color:#E5D85C;'>";
	   		    else if(status == "조퇴") label += "background-color:#8BC34A;'>";
	   		 	else if(status == "등원") label += "background-color:#2196F3;'>";
	   			else if(status == "결석") label += "background-color:#EC407A;'>";
	   			label += status+"</span>";
		    	return label;
		    }
	     
     </script>
     <!-- ["#F2DEDE","#D9EDF7","#FCF8E3","#DFF0D8", "#F5F5F5"] -->
     
     
