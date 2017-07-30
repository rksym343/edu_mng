<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
		
		<!-- // jQuery UI CSS파일 
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
		 // jQuery 기본 js파일
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		 // jQuery UI 라이브러리 js파일
		<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>  --> 

  <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
    
    <!-- DataTables CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
    

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

	
  <!-- FLOT Charts CSS -->
	<link href="${pageContext.request.contextPath}/resources/vendor/flot/css/examples.css" rel="stylesheet" type="text/css">

  <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">



	<style>
		ul{
			list-style: none;
		}
	</style>
	
	
<script>

	var arrDay = ["일", "월", "화", "수", "목", "금", "토"];
	var memberType = "${memberType}";
	var memberId = "${memberId}";
</script>

<title>학습 관리 프로그램</title>
</head>
<body>

 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${pageContext.request.contextPath}">스터디헬퍼 </a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            
			<c:if test="${memberType == 'student' }">
                <li class="dropdown">
                    <%@ include file="header_message.jsp"%>	
                </li>
             </c:if>
            
			<c:if test="${!empty memberType }">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li>
                        <c:if test="${memberType == 'student' }">
							<a href="${pageContext.request.contextPath}/user/readStudentInfo?sId=${memberId }"><i class="fa fa-user fa-fw"></i> User Profile</a>
						</c:if>
						<c:if test="${memberType == 'parents' }">
							<a href="${pageContext.request.contextPath}/user/readParentsInfo?spId=${memberId }"><i class="fa fa-user fa-fw"></i> User Profile</a>
						</c:if>
						<c:if test="${memberType == 'teacher' }">
							<a href="${pageContext.request.contextPath}/user/readTeacherInfo?tId=${memberId }"><i class="fa fa-user fa-fw"></i> User Profile</a>
						</c:if>
							
                        </li>
                        <c:if test="${memberType == 'student' }">
                        	<li><a href="${pageContext.request.contextPath}/cart/cartCourses?memberType=${memberType }&id=${memberId }"><i class="fa fa-shopping-cart fa-fw"></i> Cart</a>
                        	</li>
                        	<li class="divider"></li>
                        </c:if>
                        
	                        <li><a href="${pageContext.request.contextPath}/user/logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
	                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
                </c:if>
            </ul>
            <!-- /.navbar-top-links -->

<c:if test="${empty memberType }">
	<%@ include file="sidebar.jsp"%>
</c:if>
<c:if test="${memberType == 'student' }">
	<%@ include file="studentSidebar.jsp"%>
</c:if>
<c:if test="${memberType == 'parents' }">
	<%@ include file="parentsSidebar.jsp"%>
</c:if>
<c:if test="${memberType == 'teacher' }">
	<%@ include file="teacherSidebar.jsp"%>
</c:if>


  </nav>
<%@ include file="contentDiv.jsp"%>
           