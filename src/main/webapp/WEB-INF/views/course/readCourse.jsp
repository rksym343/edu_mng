<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<style>
	.alert-danger{
		display: none;
	}
	.content{
		font-size: 16px;
	}
</style>

	 <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">수업상세정보
                    <!-- <small>Subheading</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home</a>
                    </li>
                    <li class="active">수업상세정보</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
	
			
			<div class="row">
            <div class="col-lg-12">
				<div class="alert alert-danger">
					 <!--  <strong>신청불가!</strong> -->
					 <span class="content"></span>
				</div>
                  <div class="panel panel-default">
                 	<div class="panel-heading">                 			
                       		<span>${course.cName }</span>
                         	<form id="f1" style="text-align:right" method="get">
                         		<input type="hidden" value="${course.cNo }" name="cNo">
                         		
                         		<c:if test="${memberType=='student'||memberType=='parents' }">
                         			<c:if test="${fromMyPage==true }">
                         			 	<button type="button" class="btn btn-default disabled" id="registerCourse"
	                         			 	data-container="body" data-toggle="popover" data-placement="top" 
	                         			 	data-content="dfgdfg" disabled>
                         			 		수강중
                         			 	</button>
                         			 </c:if>
                         			 <c:if test="${fromMyPage==false }">
                         			 	<button type="button" class="btn btn-default " id="registerCourse"
	                         			 	data-container="body" data-toggle="popover" data-placement="top" 
	                         			 	data-content="dfgdfg">
                                 		 	수강신청
                                 		 </button>
                                 	</c:if>
                               		</button>
                               		
                         		</c:if>
                         	</form>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                        <tr>
                                            <th>담당선생님</th>
                                            <td class="form-control-static">${course.teacher.tName}</td>
                                        </tr>
                                        <tr>
                                            <th>해당학년</th>
                                            <td>${course.studentGrade.gdName}</td>
                                        </tr>
                                        <tr>    
                                            <th>해당과목</th>
                                            <td>${course.subject.sbName}</td>
                                        </tr>
                                        <tr>    
                                            <th>수강료</th>
                                            <td  class="form-control-static">${course.tuition}</td>
                                        </tr>
                                        <tr>    
                                            <th>수강인원</th>
                                            <td>${course.capacity}</td>
                                        </tr>
                                        <tr>    
                                            <th>수업기간</th>
                                            <fmt:formatDate value="${course.cStartdate}" pattern="yyyy-MM-dd" var="startdate"/>
                                            <fmt:formatDate value="${course.cEnddate}" pattern="yyyy-MM-dd" var="enddate"/>
                                            <td>${startdate} ~ ${enddate}</td>
                                        </tr>
                                        <tr>    
                                            <th>수업시간표</th>
                                            <td>
                                            	<ul>
		                                            <c:forEach items="${course.timetables}" var="timetable">
		                                            	<li>
		                                            		<c:choose>
															       <c:when test="${timetable.ttDay == 0}">
															           <span class="ttDay label label-danger">${timetable.ttDay }</span> 
															       </c:when>
															       <c:when test="${timetable.ttDay == 6}">
															           <span class="ttDay label label-primary">${timetable.ttDay }</span> 
															       </c:when>
															       <c:otherwise>
															           <span class="ttDay label label-default">${timetable.ttDay }</span> 
															       </c:otherwise>
															   </c:choose>
		                                            		${timetable.ttStarttime }시 ~${timetable.ttEndtime }시
		                                            	</li>
		                                       		</c:forEach>
                                       			</ul>
                                       		</td>
                                        </tr>  
                                        
                                        <tr>    
                                            <th>교실</th>
                                            <td>${course.classroom}</td>
                                        </tr>
                                        
                                        <tr>    
                                            <th>수업상세설명</th>
                                            <td>${course.content.cContent}</td>
                                        </tr>
                                        <c:if test="${empty course.pictures}">
	                                            		
	                                    </c:if> <c:if test="${!empty course.pictures}">
	                                     <tr>    
                                            <th>수업이미지</th>
                                            <td>
	                                            <ul>
				                                    <c:forEach items="${course.pictures}" var="pic">
				                                    	<c:if test="${!empty pic.cPicture }">
				                                         	<li><img src="${pageContext.request.contextPath}/file/displayFile?filename=${pic.cPicture }"></li>
				                                         </c:if>
				                                    </c:forEach>
	                                            	
	                                       		</ul>
                                       		</td>
                                        </tr>
                                        </c:if>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                </div>


				<form id="f2" role="form" method="post">
					<input type="hidden" name="cNo" value=${course.cNo }>
					<input type="hidden" name="page" value=${cri.page }>
					<input type="hidden" name="perPageNum" value=${cri.perPageNum }>
					<input type="hidden" name="searchType" value=${cri.searchType }>
					<input type="hidden" name="keyword" value=${cri.keyword }>
					<input type="hidden" name="fromMyPage" value=${fromMyPage }>
					<input type="hidden" name="fromListPage" value=${fromListPage }>					
				</form>
				
                <div class="row">
                
           		<div class="col-lg-12">
           			<c:if test="${fromListPage }">
                    	<button id="btnToList" class="btn btn-success">목록으로</button>
                    </c:if>
                    <c:if test="${!fromListPage }">
                    	<button id="btnToBack" class="btn btn-success">돌아가기</button>
                    </c:if>
                    <c:if test="${memberType=='teacher' }">
                    	<button type="button" class="btn btn-default" id="modifyCourse">수정</button>
                    	<button type="button" class="btn btn-default" id="deleteCourse">삭제</button>
                    </c:if>
                </div>
                </div>

<%@ include file="../include/footer.jsp"%>	
<script>

var sId = memberId;
var today = new Date();
var year = today.getFullYear();
var month = today.getMonth();

	$(function() {
		getMyCourses();
	});
	
	$("#btnToList").click(function() {
		//location.href="listPage?page=${cri.page }";
		$("#f2").attr("action", "listCourses");
		$("#f2").attr("method", "get"); 
		$("#f2").submit();
	});
	
	$("#btnToBack").click(function() {
		history.back();
	})
	
	function checkImposi(cNo1, cNo2, cName2){
		$.ajax({
			url: "${pageContext.request.contextPath}/course/timetable/"+cNo1+"/"+cNo2,
			type : "GET",
			dataType : "text",
			success: function(result) {
				console.log("=====check " +cNo1 +" : " +cNo2+ "//" );
				console.log("return : "+ result);
				if(result=="OK"){				
					$("#registerCourse").addClass("disabled");		
					$(".alert-danger").find(".content").append("현재 수강중인 ["+cName2+"] 수업 시간과 중복됩니다<br>");
					$(".alert-danger").show();
				}
			}		
		});	}
	
	 
	 function getMyCourses(){
			$(".alert-danger").hide();
			$(".alert-danger").find(".content").html();
			var fromMyPage = $("input[name='fromMyPage']").val();
			if(fromMyPage == "false"){
				var cNo = $("input[name='cNo']").val();
				$.ajax({
					// /myRegisteredCourses/{sId}/{year}/{month}/{rsNo}
					url: "${pageContext.request.contextPath}/course/myRegisteredCourses/"+sId+"/"+year+"/"+(month+1)+"/"+1,
					type : "get",
					dataType: "json",
					success:function(data){
						console.log(data);
						var isRegstered = false;
						$.each(data, function(i, v) {
							if(v.cNo == cNo){
								isRegstered=true;													
							}else{		
								checkImposi(cNo, v.cNo, v.cName);
							}	
						});
						
						if(isRegstered){
							$("#registerCourse").html("수강중");
							$("#registerCourse").addClass("disabled");	
							$("#registerCourse").prop("disabled", true);
						}else{
							$("#registerCourse").html("수강신청");
							$("#registerCourse").removeClass("disabled");
							$("#registerCourse").prop("disabled", false);	
						}
					}
						
				});
			}
		}
	
	$("#modifyCourse").click(function() {
		// 수정하기
		$("#f1").attr("action", "updateCourse");
		$("#f1").attr("method", "get"); 
		$("#f1").submit();
	});
	
	$("#deleteCourse").click(function() {
		if(confirm("정말로 삭제하시겠습니까?")){
			$("#f1").attr("action", "deleteCourse"); //post 형식의 delete command 호출됨
			$("#f1").attr("method", "post"); 
			$("#f1").submit();
		}
	});
	
	$("#registerCourse").click(function() {
		// 수강신청하기
		if($("#registerCourse").hasClass("disabled")==false){
			var cNo = $("input[name='cNo']").val();
			if(confirm("수강신청 하시겠습니까?")){
				$.ajax({
					url: "${pageContext.request.contextPath}/cart/insertCart/"+memberType+"/"+memberId+"/"+cNo,
					type : "PUT",
					dataType : "text",
					success: function(data) {
						console.log(data);
						if(data=="SUCCESS"){
							if(confirm("해당 강좌가 장바구니에 담겼습니다.\n장바구니로 이동하시겠습니까?")){
								location.href="${pageContext.request.contextPath}/cart/cartCourses?memberType=${memberType }&id=${memberId }";
							}
						}
					}
				})
			}
		}
	});
	
</script>