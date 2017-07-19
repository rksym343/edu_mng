<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">수업상세정보</h1>
	</div>
</div> <!-- div row -->


			<div class="row">
                  <div class="panel panel-default">
                 	<div class="panel-heading">
                         <h4>${course.cName }</h4>
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                        <tr>
                                            <th>담당선생님</th>
                                            <td>${course.teacher.tName}</td>
                                            <td rowspan="7">
                                            	${course.cPicture}
                                            </td>
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
                                            <td>${course.tuition}</td>
                                        </tr>
                                        <tr>    
                                            <th>수강인원</th>
                                            <td>${course.capacity}</td>
                                        </tr>
                                        <tr>    
                                            <th>수업기간</th>
                                            <td>${course.cStartdate}~${course.cEnddate}</td>
                                        </tr>
                                        <tr>    
                                            <th>수업시간표</th>
                                            <td>
                                            	<ul>
		                                            <c:forEach items="${course.timetables}" var="timetable">
		                                            	<li>[${timetable.ttDay }] : ${timetable.ttStarttime }~${timetable.ttEndtime }</li>
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
                                            <td>${course.cContent}</td>
                                        </tr>
                                        
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>


<%@ include file="../include/footer.jsp"%>	