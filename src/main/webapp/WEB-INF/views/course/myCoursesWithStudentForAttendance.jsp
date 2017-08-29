<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		.display-none{
			display: none;
		}
		.display-block{
			display: inline-block;
		}
	</style>
		
		<div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">학생출결관리
                    <!-- <small>Subheading</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home</a>
                    </li>
                    <li class="active">학생출결관리</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
	

		<div class="row">
			<div class="col-md-3">
				<select id="myCourse" class="form-control col-md-3" name="cNo">
					
				</select>
			</div>
		</div>
		<hr>

		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>학교</th>
                                            <th>학생이름</th>
                                            <th>ID</th>
                                            <th>연락처</th>
                                            <th>출결상태</th>
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
    
    
    
	$(function() {	   
		getMyCourses();
	      $("#myCourse").change(function(e) {
	    	 var cNo = $("select#myCourse option:selected").val();
			 getMyStudentWithAttendance(cNo);
	      });
	      
	      $(document).ready(function(){
	    	    $('[data-toggle="tooltip"]').tooltip(); 
	    	}); 
		$(document).on("click",".btn-edit-at", function() {
			
			
			
			$(this).parent().next(".at-records-edit").removeClass("display-none");
			$(this).parent().removeClass("display-block");
			
			$(this).parent().next(".at-records-edit").addClass("display-block");
			$(this).parent().addClass("display-none");
		});
		
		
		/* $(document).on("change",".asNo", function() {
			alert("선택값 : " + $(".asNo option:selected").val()+ " / "+ $(".asNo option:selected").html());  
		}); */
		
		$(document).on("click",".btn-edit-ok", function() {
			var index = $(".btn-edit-ok").index(this);
			var sId = $(this).attr("data-sId");
			var originAtNo = $(this).attr("data-atNo");
			var newAtNo = 0;
			var asNo = $(this).prev().find("option:selected").val();
			//alert("//////////////////asNo : " + asNo);
			if(asNo == 0){
				alert("출결상태를 선택해주세요.");
			}else{
				if(confirm("출결상태를 변경하시겠습니까?")){
					$.ajax({
			  			///updateAttendance/{sId}/{originAtNo}/{asNo}
			  			url: "${pageContext.request.contextPath}/attend/updateAttendance/"+sId+"/"+originAtNo+"/"+asNo,
			  			type : "get",
			  			dataType: "json",
			  			success:function(data){
			  				console.log(data);	 
			  				if(data != null){
			  					alert("변경완료"); 
			  					$(".btn-edit-ok").eq(index).attr("data-atNo", data.atNo);

			  					var str = data.attendanceStatus.asStatus;
			  					$(".btn-edit-ok").eq(index).parent().prev(".at-records").find(".s-status").html(str);
			  					$(".btn-edit-ok").eq(index).parent().prev(".at-records").find(".s-status").attr("title", viewTime(data.theTime));
			  					
			  					
			  					$(".btn-edit-ok").eq(index).parent().prev(".at-records").removeClass("display-none");
			  					$(".btn-edit-ok").eq(index).parent().removeClass("display-block");
			  					
			  					$(".btn-edit-ok").eq(index).parent().prev(".at-records").addClass("display-block");
			  					$(".btn-edit-ok").eq(index).parent().addClass("display-none");
			  				
			  				}
			  				
			  			}	  				
			  		});			
					
				}else{
					$(".btn-edit-ok").eq(index).parent().prev(".at-records").removeClass("display-none");
  					$(".btn-edit-ok").eq(index).parent().removeClass("display-block");
  					
  					$(".btn-edit-ok").eq(index).parent().prev(".at-records").addClass("display-block");
  					$(".btn-edit-ok").eq(index).parent().addClass("display-none");
				}
			}
		});
	});
	
	
	      function getMyCourses(){
	  		$.ajax({
	  			//myCoursesTable/{tId}/{year}/{month}
	  			url: "${pageContext.request.contextPath}/course/myCoursesTable/"+tId+"/"+year+"/"+(month+1),
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				console.log(data);	  				
	  				$("#m yCourse").html("");

	  			   	var cNo1 = 0;
	  				for(var i = 0; i < data.length; i++){
	  					if(i == 0){
	  						cNo1 = data[i].cNo;
	  					}
	  					console.log(data[i].cName + " : " + data[i].teacher.tName);
	  					var optionTag = "<option value='"+data[i].cNo+"' >"+data[i].cName+"</option>";
	  					$("#myCourse").append(optionTag);
	  					
	  				}
	  				
	  				getMyStudentWithAttendance(cNo1);
	  			}	  				
	  			});
			
	  		}
	      function getMyStudentWithAttendance(cNo){
	    	  $.ajax({
	    		  //studentAttendanceInfo/{cNo}/{ttDay}/{year}/{month}
					url: "${pageContext.request.contextPath}/attend/studentAttendanceInfo/"+cNo+"/"+day+"/"+year+"/"+(month+1),
					type : "get",
					dataType: "json",
					success:function(data){
						console.log("=======STUDENT===");	
						console.log(data);	

						console.log("=======STUDENT===");	
						$("#student-table").html("");
						if(data.list.length == 0){
							var trTag ="<tr><td colspan='5' class='text-muted'>해당 학생 없음</td></tr>";
							$("#student-table").append(trTag);
						}else{
						$.each(data.list, function(i, v) {
							// s.s_id, s.s_name, s.s_phone, s.school, att.the_time, ass.as_status
							
							var selectTag = $("<select class='asNo form-control'>");
							selectTag.append("<option value='0'>----</option>");
							var trTag = $("<tr>");
							trTag.append("<td>"+v.student.school+"</td>");
							trTag.append("<td>"+v.student.sName+"</td>");
							trTag.append("<td>"+v.student.sId+"</td>");
							trTag.append("<td>"+v.student.sPhone+"</td>");
							
								if(v.attendanceStatus != null && v.theTime != null){
									$.each(data.statusList, function(idx, as) {
										if(v.attendanceStatus.asNo == as.asNo){
											selectTag.append("<option value='"+as.asNo+"' selected>"+as.asStatus+"</option>");
										}else{
											selectTag.append("<option value='"+as.asNo+"'>"+as.asStatus+"</option>");
										}
									});
									var tdTag = $("<td>");
									var span1 = $("<span class='at-records display-block text-muted'>");
									span1.html( "<span class='s-status' data-toggle='tooltip' data-placement='bottom' title='"+viewTime(v.theTime)+"'>"+v.attendanceStatus.asStatus+"</span><button class='btn btn-default btn-edit-at'><i class='fa fa-edit'></i></button>");
									tdTag.append(span1);
									var span2 = $("<span class='at-records-edit display-none'>");
									var selectWidthTag = $("<div class='col-md-8'>");
									selectWidthTag.append(selectTag);
									span2.append(selectWidthTag);
									span2.append(" <button class='btn btn-default btn-edit-ok' data-sId='"+v.student.sId+"' data-atNo='"+v.atNo+"'><i class='fa fa-check-circle'></i></button>");
									tdTag.append(span2);
									trTag.append(tdTag);
								}else{
									$.each(data.statusList, function(idx, as) {
											selectTag.append("<option value='"+as.asNo+"'>"+as.asStatus+"</option>");										
									});
									var tdTag = $("<td>");
									var span1 = $("<span class='at-records display-block text-muted'>");
									span1.html( "<span class='s-status' data-toggle='tooltip' data-placement='bottom' title='미출석'>미출석</span> <button class='btn btn-default btn-edit-at'><i class='fa fa-edit'></i></button>");
									tdTag.append(span1);
									var span2 = $("<span class='at-records-edit display-none'>");
									var selectWidthTag = $("<div class='col-md-8'>");
									selectWidthTag.append(selectTag);
									span2.append(selectWidthTag);
									span2.append(" <button class='btn btn-default btn-edit-ok' data-sId='"+v.student.sId+"' data-atNo='0'><i class='fa fa-check-circle'></i></button>");
									tdTag.append(span2);
									trTag.append(tdTag);
								}
							$("#student-table").append(trTag);
						});
			
			       		
					}
					}
				});
	      }
	      
	      function viewTime(time){

	    		var date = new Date(time);
	    		var viewDate = ""+ date.getFullYear()
	    					+ "-"+((date.getMonth()+1) <10? "0"+(date.getMonth()+1):(date.getMonth()+1))  
	    			 	 	+ "-"+(date.getDate()<10?"0"+date.getDate():date.getDate())
	    					+ " "+(date.getHours()<10?"0"+date.getHours():date.getHours())
	    					+ ":"+(date.getMinutes()<10?"0"+date.getMinutes():date.getMinutes())
	    					+ ":"+(date.getSeconds()<10?"0"+date.getSeconds():date.getSeconds());  
	    		
	    		return viewDate;
	    	}
	      

	  
</script>