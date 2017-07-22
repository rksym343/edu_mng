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
                         <h4>${course.cName } 
                         	<span class="text-right">
                         		<button class="btn btn-default">
                         			<a href="updateCourse?cNo=${course.cNo }">
                         			수정</a></button>
                         	</span></h4>
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
                                            <td>${course.cStartdate}~${course.cEnddate}</td>
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
				                                         	<li><img src="displayFile?filename=${pic.cPicture }"></li>
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