<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<title>로그인</title>
<style type="text/css">
	/* body{
		background-color: #ddd;
	}
	.login-container{
		background-color : #fff;
		
		border : 1px solid black;
		padding : 20px;
		
	}*/
	input[name='memberType']{
		display: none;
	}
	
	.input-group{
		margin : 10px auto;
	}
	 
</style>

</head>
<body>

<div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">로그인</h3>
                    </div>
                    <div class="panel-body">
                        <form action="loginPost" method="post">
						  	 <div class="input-group btn-group btn-group-justified">
						     	 <label class="radio-inline btn btn-success">
							      <input type="radio" name="memberType" value="student" checked="checked">학생
							    </label>
							    <label class="radio-inline btn btn-default">
							      <input type="radio" name="memberType" value="parents">학부모
							    </label>
							    <label class="radio-inline btn btn-default">
							      <input type="radio" name="memberType" value="teacher">선생님
							    </label>
						     </div>
						     <div class="input-group">
						     	 <input id="id" type="text" class="form-control" name="id" placeholder="아이디">
						      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>   
						     </div>
						   	 <div class="input-group">
						      	<input id="password" type="password" class="form-control" name="password" placeholder="비밀번호">
						      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						    </div>
						    <div class="input-group">
						   		<input type="submit" value="로그인" class=" btn btn-success" >
						    </div>
						   
						    	<p style="text-align: right;">
						   			<a href="${pageContext.request.contextPath}/user/registerMember">회원가입</a>
						   		</p>
						 </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>

	<!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>

<script type="text/javascript">
	$(function() {
		$(window).resize();
		
		$("input[name='memberType']").change(function() {
			$("input[name='memberType']").parent("label").removeClass("btn-success");
			$("input[name='memberType']").parent("label").addClass("btn-default");
			$(this).parent("label").removeClass("btn-default");
			$(this).parent("label").addClass("btn-success");
		})
		
	});
	
	$(window).resize(function(){
		$(".login-container").css("position","absolute")
		.css("left",  Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px")
		.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
	});	
	
	 $(function () {
	       var url_string =  window.location.href;
	       var url = new URL(url_string);
	        var result = true;
	        result = url.searchParams.get("nonexistent");
	       if(result=="true"){
	           alert("로그인 정보를 확인하세요");
	        }
	      });
</script>
</html>


