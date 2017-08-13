<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	/* .navbar-inverse{
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
	.btn-outline {
		width : 100%;
	  border : 1px solid white;
	  background-color: transparent;
	  transition: all .5s;
	}
	.btn-success.btn-outline {
	  color: white;
	  margin : 0;
	} 
	.btn-success.btn-outline:hover{
		background-color:  #5cb85c;
		border : 1px solid #5cb85c;
	} */
	
	a.btnLogin{
		color : #009966 ;   
		border : 1px solid #9d9d9d; 
		border-radius: 5px;
		padding : 5px 10px !important; 
		margin-top : 10px !important;
		text-align: center;
	}
	a.btnLogin:hover{
		color : #fff; 
		border : 1px solid #009966; 
		background-color: #009966  !important;
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
            <div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">                    
                    <li>
                        <a href="${pageContext.request.contextPath}/course/listCourses">개설강좌목록</a>
                    </li> 
                    <li>
                    	<a href="${pageContext.request.contextPath}/user/login" class="btnLogin">
                    		<!-- <i class="fa fa-sign-in fa-fw"></i> -->
                    		LOGIN
                    	</a>
                    </li>
                </ul>
                
            </div>
            <!-- /.navbar-collapse -->
            </div>
        </div>
        <!-- /.container -->
    </nav>