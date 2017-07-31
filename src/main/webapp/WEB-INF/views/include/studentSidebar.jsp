 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 		<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                    	<a href="#">내 강의실<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
		                            <a href="${pageContext.request.contextPath}/course/myRegisteredCourses?sId=${memberId}">신청수업</a>
		                        </li>
		                        <li>
		                            <a href="${pageContext.request.contextPath}/course/myRegisteredCoursesTable?sId=${memberId}">시간표</a>
		                        </li>
		                        <li>
		                            <a href="${pageContext.request.contextPath}/exam/viewStudentExam">수업별 성적표</a>
		                        </li>
		                     </ul>
		                </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/attend/myAttendance">출석기록</a>
                        </li>
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/message/listMsg">받은 메세지</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/course/listCourses">개설강좌목록</a>
                        </li>
                        <%-- <li>
                            <a href="${pageContext.request.contextPath}/course/registerCourses">수강신청</a>
                        </li>  --%>                             
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
      
        
        
        
                
        
        