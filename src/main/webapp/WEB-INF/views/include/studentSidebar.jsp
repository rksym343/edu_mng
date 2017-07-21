 <%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
 		<div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                   		<li>
                            ---------------학생-------------
                        </li>
                    
                        <li>
                            <a href="${pageContext.request.contextPath}/attend/myAttendance">출석기록</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/course/myRegisteredCourses">내가 신청한 수업들</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/course/myRegisteredCoursesTable">이번달 시간표 : 시간표랑 알림사항들</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/exam/viewStudentExam">내가 한 과제평가랑 시험성적</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/message/listMsg">내가 받은 메세지</a>
                        </li>
                         <li>
                            <a href="${pageContext.request.contextPath}/course/registerCourses">수강신청하기</a>
                        </li>
                        
                        <li>
                            ---------------선생님--------------
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/course/insertCourse">강의 개설하기</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/course/listCourses">개설된 강좌</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/message/listMySendMsg">내가 보낸 메세지</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/message/writeAllMsg">단체 메세지 작성하기</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/message/writeMsg">메세지 작성하기</a>
                        </li>
                         <li>
                            ---------------------------------
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/exam/viewChart">차트예제</a>
                        </li>
                       
                       
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
        
        
                
        
        