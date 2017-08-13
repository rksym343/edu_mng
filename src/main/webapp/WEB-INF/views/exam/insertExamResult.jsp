<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<jsp:useBean id="todayDate" class="java.util.Date" />

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
				학생성적입력
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}">Home</a></li>
				<li class="active">학생성적입력</li>
			</ol>
		</div>
	</div>
	<!-- /.row -->
	
	<form action="insertExamResult" method="post" id="f1">
		<div class="row">
			<div class="col-md-3">
				<select id="myCourse" class="form-control" name="cNo">
					
				</select>
			</div>
			
			<div class="col-md-2">
			<select name="eiNo" class="form-control">
					<option value="0">----------</option>
					<c:forEach items="${examList}" var="examItem">
						<option value="${examItem.eiNo }">${examItem.eiTitle }</option>
					</c:forEach>
			</select>
			</div>
			<div class="col-md-2">			
				<fmt:formatDate value="${todayDate }" pattern="yyyy-MM-dd" var="today"/>
				<input type="date" class="form-control" value="${today }" name="eDate">
			</div>
			<button type="button" id="viewBtn" class="btn btn-default">성적조회</button>
			<button type="button" id="insertBtn" class="btn btn-success">성적입력</button>
		</div>
		<hr>

		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th id="course-title" colspan="3"></th>
                                        </tr>
                                        <tr>
                                            <th>학생</th>	
                                            <th>점수</th>
                                            <th>메모</th>
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
			<div class="col-md-9">
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
	 		</div>
			
		</div>
	</form>
		
		

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
	      
	   /*  $("#myCourse").change(function(e) {
	    	var cNo = $("select#myCourse option:selected").val();
	    	var cName = $("select#myCourse option:selected").text();
	    	var sbNo = $("select#myCourse option:selected").attr("data-sbNo");
			$("#course-title").html(cName);
	      	getMyStudent(cNo, sbNo);
	    }); */
	      
	      
	    $("#viewBtn").click(function() {
			// 성적 조회
			var cNo = $("select#myCourse option:selected").val();
			var sbNo = $("select#myCourse option:selected").attr("data-sbNo");
			var eiNo = $("select[name='eiNo'] option:selected").val();
			var date = "x";
			
			if(eiNo > 4){
				date = $("input[name='eDate']").val();
			}else{
				date = "x";
			}
			
			
	    	$.ajax({
	  			//viewExamResult/{cNo}/{eiNo}/{date}
	  			url: "${pageContext.request.contextPath}/exam/viewExamResult/"+sbNo+"/"+cNo+"/"+eiNo+"/"+date,
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				console.log("**************");
	  				console.log(data);
	  				console.log("**************");
	  				$("#student-table").html("");
	  				$.each(data, function(i, v) {
						var trTag = 
						"<tr>"
						+	"<td>"+v.student.sName+"</td>"
						+	"<td>"+v.eResult+"</td>"
						+	"<td>"+v.eMemo+"</td>"
						+"</tr>";							
						$("#student-table").append(trTag);
					});	
	  				  				
	  			}	  				
	  			});
		});
	    
	    
	    $("#insertBtn").click(function() {
			// 성적 입력
			var cNo = $("select#myCourse option:selected").val();
			var sbNo = $("select#myCourse option:selected").attr("data-sbNo");
	    	getMyStudent(cNo, sbNo);
		});
	    
	    $(document).on("click", "#submitBtn", function() {
	    	if($("select[name='eiNo'] option:selected").val() == 0){
	    		// 테스트 항목 선택되지 않으면 입력하지 않음
	    		alert("테스트 종류를 선택하세요");
	    		return;
	    	}
	    	if(confirm("제출하시겠습니까?")){

				$("#f1").submit();
	    	}  
		});
		
	      
	    $(document).on("click", ".my-student", function(obj) {
			var sId = $(this).attr("data-sId");
			var cNo = $(this).attr("data-cNo");
			var sbNo = $(this).attr("data-sbNo");
			alert("on click "+sId +"/"+ cNo+"/"+ sbNo);
			getRecords(sId, cNo, sbNo);
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
	  				
	  	  			//getMyStudent(cNo1, sbNo);
	  			}	  				
	  			});
			
	  		}
	      
	      
	      function getMyStudent(cNo, sbNo){
	    	 // alert("<td onclick='getRecords(, "+cNo+", "+sbNo+")'>");
	    	  $.ajax({
	    		 	// /myCoursesWithStudent/{cNo}/{year}/{month}
					url: "${pageContext.request.contextPath}/course/myCoursesWithStudent/"+cNo+"/"+year+"/"+(month+1),
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);	
						
						$("#student-table").html("");
						$.each(data, function(i, v) {
							var trTag = 
							"<tr>"
							+	"<td  class='col-md-2'>"
							// student success popover
							+		"<a class='my-student' data-sId="+v.student.sId+" data-cNo="+cNo+" data-sbNo="+sbNo
							+		"title='"+v.student.sName+"' data-toggle='popover' data-placement='left' data-content=''>"
							+ 		v.student.sName+"</a>"
							+	"</td>"
							+	"<td  class='col-md-1'>"
							+		"<input type='hidden' class='form-control' name='cNos' value='"+cNo+"'>"
							+		"<input type='hidden' class='form-control' name='sbNos' value='"+sbNo+"'>"
							+		"<input type='hidden' class='form-control' name='sIds' value='"+v.student.sId+"'>"	
							+		"<input type='text' class='form-control' name='eResults' placeholder='점수' style='text-align:center'>"
							+	"</td>"
							+	"<td class='col-md-9'>"
							+		"<input type='text' class='form-control' name='eMemos' placeholder='평가 메모를 입력하세요'>"
							+	"</td>"
							+"</tr>";							
							$(".student-table").append(trTag);
						});		
						var trTagForBtn = 
							"<tr><td colspan='3'>"
							+"<input type='hidden' class='form-control' name='sbNo' value='"+sbNo+"'>"
							+"<button type='button' id='submitBtn' class='btn btn-success btn-lg'>입력</button>"								
							+"</td></tr>";
						
						$(".student-table").append(trTagForBtn);
					}
				});
	      }   
	      
	    
	    
	   
	      function getRecords(sId, cNo, sbNo){
	  		getStudentsuccess(sId);
	  	}
	     
	      
	      function getStudentsuccess(sId){
	    	  $.ajax({
					url: "${pageContext.request.contextPath}/user/readStudentsuccess/"+sId,
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
	      
	      $(document).ready(function(){
		    	// student-success popover
		    	
		    	var popoverDiv =""; 
		    		//"<div><p>hihi</p><img src="http://www.google.com/intl/en_ALL/images/srpr/logo11w.png" style="width:100px;"></div>";
		        $('[data-toggle="popover"]').popover({
		        	content: popoverDiv, 
		        	html: true})   
		    });
			
		      

	    	
</script>