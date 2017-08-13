<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.navbar-inverse{
		background-color: #009966; 
		border-color: #009966; 
		color : #fff;
	}
	
	.navbar-inverse .navbar-toggle {
		background-color: #009966;
		border-color: #FFFFFF;
	}
	.navbar-inverse .navbar-toggle:focus, .navbar-inverse .navbar-toggle:hover {
		background-color: #FFF;
	}
	
	.navbar-inverse .navbar-toggle .icon-bar {
		background-color: #FFF;		
		border-color: #FFF; 
	}
	.navbar-inverse .navbar-toggle:hover .icon-bar {
		background-color: #009966;		
		border-color: #009966; 
	}
	
	.navbar-inverse .navbar-collapse, .navbar-inverse .navbar-form {
    	border-color: #FFF;
	}
	
	.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover {
	    color: #009966;
	    background-color: #FFF;
	}
	.navbar-inverse .navbar-nav>li>a {
	    color: #fff;
	}
	.navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
	      color: #fff;
	}
	.navbar-inverse .navbar-brand {
	      color: #fff;
	}
	
	.navbar-nav>li>.dropdown-menu {
		background-color: #009966;		
	}
	.dropdown-menu>li>a:hover {
	    color: #009966;
	}
</style>
<body>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}">Study Helper</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Course<b class="caret"></b></a>
                        <ul class="dropdown-menu">
	                        <li>
		                        <a href="${pageContext.request.contextPath}/course/myCoursesTable">이주의 시간표</a>
		                    </li>
		                    <li class="divider"></li>
                           <li>
		                       <a href="${pageContext.request.contextPath}/course/insertCourse">강의 개설하기</a>
		                   </li>
                           <li>
		                       <a href="${pageContext.request.contextPath}/course/listCourses">개설강좌목록</a>
		                   </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student Manage <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                           <li>
                               <a href="${pageContext.request.contextPath}/attend/myCoursesWithStudentForAttendance">출결관리</a>
                           </li>
		                    <li class="divider"></li>
                           <li>
                               <a href="${pageContext.request.contextPath}/course/myCoursesWithStudent">성적조회</a>
                           </li>
                           <li>
                               <a href="${pageContext.request.contextPath}/exam/insertExamResult">성적입력</a>  
                           </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Message<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                           <li>
		                      <a href="${pageContext.request.contextPath}/message/listMySendMsg">보낸 메세지</a>
		                   </li>
		                   
		                    <li class="divider"></li>
                           <li>
		                      <a href="${pageContext.request.contextPath}/message/writeAllMsg">단체 메세지 작성</a>
		                   </li>
		                   <li>
		                      <a href="${pageContext.request.contextPath}/message/writeMsg">개별 메세지 작성</a>
		                   </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>