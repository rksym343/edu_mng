  <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="#">강의정보관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
		                            <a href="${pageContext.request.contextPath}/course/insertCourse">강의 개설하기</a>
		                        </li>
                                <li>
		                            <a href="${pageContext.request.contextPath}/course/listCourses">개설강좌목록</a>
		                        </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>                        
                        
                        <li>
                            <a href="${pageContext.request.contextPath}/course/myCoursesTable">이주의 시간표</a>
                        </li>
                        <li>
                            <a href="#">수업별 학생관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="${pageContext.request.contextPath}/attend/myCoursesWithStudentForAttendance">출결관리</a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/course/myCoursesWithStudent">성적조회</a>
                                </li>
                                 <li>
                                    <a href="${pageContext.request.contextPath}/exam/insertExamResult">성적입력</a>  
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        
                         <li>
                            <a href="#">메시지관리<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                 <li>
		                            <a href="${pageContext.request.contextPath}/message/listMySendMsg">보낸 메세지</a>
		                        </li>
                                <li>
		                            <a href="${pageContext.request.contextPath}/message/writeAllMsg">단체 메세지 작성</a>
		                        </li>
		                        <li>
		                            <a href="${pageContext.request.contextPath}/message/writeMsg">개별 메세지 작성</a>
		                        </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>   
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        
        
        
                
        
        