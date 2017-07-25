<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">개설된 강의들</h1>
</div>
</div> <!-- div row -->

	<div class="row">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            2017년 7월 개설강의
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>교과</th>
											<th>대상학년</th>
											<th>강의명</th>
											<th>담당선생님</th>
											<th>수강인원</th>
											<th>강의시간</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listCourses }" var="course">
											<tr onclick="readCourse(${course.cNo })">
												<td>${course.subject.sbName }</td>
												<td>${course.studentGrade.gdName }</td>
												<td>${course.cName }</td>
												<td>${course.teacher.tName }</td>
												<td>${course.capacity }</td>
												<td>
												<c:if test="${empty course.timetables }">
													시간미정
												</c:if>
												<c:if test="${!empty course.timetables }">
													<c:forEach items="${course.timetables }" var="tt">
															<p><span class="ttDay">${tt.ttDay }</span> : ${tt.ttStarttime } ~ ${tt.ttEndtime } </p>
													</c:forEach>
												</c:if>
												</td>	
											</tr>
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
                
    
<%@ include file="../include/footer.jsp"%>	
<script>
	
	function readCourse(cNo){
		location.href="${pageContext.request.contextPath}/course/readCourse?cNo="+cNo;
	}
	
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    });
    </script>
	
</script>

