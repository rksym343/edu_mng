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
	
	.navbar-inverse .navbar-brand {
	      color: #fff;
	}
	.dropdown-menu>li>a:hover {
	    color: #009966;
	}
	
	a.btnLogin{
		color : #009966 ;   
		border : 1px solid #fff; 
		border-radius: 5px;
		padding : 5px 10px !important; 
		margin-top : 10px !important;
		text-align: center;
	}
	a.btnLogin:hover{
		color : #009966 !important; 
		border : 1px solid #F7F1C1; 
		background-color: #F7F1C1  !important;
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
                <a class="navbar-brand" href="${pageContext.request.contextPath}">스터디헬퍼</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                    
                    <li>
                        <a href="${pageContext.request.contextPath}/course/listCourses">개설강좌목록</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        	내기록
                        	<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                             
		                    <li>
		                        <a href="${pageContext.request.contextPath}/attend/myAttendance">출석기록</a>
		                    </li>
		                     <li>
		                         <a href="${pageContext.request.contextPath}/exam/viewStudentExam">수업별 성적표</a>
		                     </li>
	                     </ul>
	                </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">수강신청<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                             <li>
		                    	<a href="${pageContext.request.contextPath}/cart/cartCourses?memberType=${memberType }&id=${memberId }">
		                    		<!-- <i class="fa fa-shopping-cart fa-fw"></i> -->
		                    		수강장바구니
		                    	</a>
		                    </li>
		                    <li class="divider"></li>
		                    <li>
		                     	 <a href="${pageContext.request.contextPath}/course/myRegisteredCourses?sId=${memberId}">수강중인수업</a>
		                     </li>
		                     <li>
		                         <a href="${pageContext.request.contextPath}/course/myRegisteredCoursesTable?sId=${memberId}">주별 시간표</a>
		                     </li>
	                     </ul>
	                </li>
                    <li class="dropdown">
                    	 <%@ include file="header_message.jsp"%>	 
                    </li>                    
                    <li>
		                <a href="${pageContext.request.contextPath}/user/readStudentInfo?sId=${memberId }">회원정보</a>
		            </li>
                        
			        <li>
			           	<a href="${pageContext.request.contextPath}/user/logout" class="btnLogin">
			           	<!-- <i class="fa fa-sign-in fa-fw"></i> -->
			        	   	LOGOUT
			           	</a>
			        </li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>