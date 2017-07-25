<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">수업상세정보</h1>
	</div>
</div> <!-- div row -->

			
			<div class="row">
			
                  <div class="panel panel-default">
                 	<div class="panel-heading">
                         <h4>${course.cName } 
                         	<form id="f1" style="text-align:right" method="get">
                         		<input type="hidden" value="${course.cNo }" name="cNo">
                         		<c:if test="${memberType=='teacher' }">
                         			<button type="button" class="btn btn-default" id="modifyCourse">수정</button>
                         			<button type="button" class="btn btn-default" id="deleteCourse">삭제</button>
                         		</c:if>
                         		<c:if test="${memberType=='student'||memberType=='parents' }">
                         			<button type="button" class="btn btn-default" id="registerCourse">수강신청</button>
                         		</c:if>
                         	</form>
                         	</h4>
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
		                                            	<li>[<span class="ttDay">${timetable.ttDay }</span>] : ${timetable.ttStarttime }~${timetable.ttEndtime }</li>
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


<%@ include file="../include/footer.jsp"%>	
<script>
	$(function() {
		
	});
	
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
	});
	
</script>