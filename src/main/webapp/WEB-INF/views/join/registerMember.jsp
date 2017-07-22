<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        	<div class="col-md-2"></div>
			<div class="col-md-8">
				<form role="form" id="f1" action="registerMember" method="post">
					<div class="input-group btn-group btn-group-justified">
						 <label class="radio-inline btn btn-primary">
							<input type="radio" name="memberType" value="student">학생
						 </label>
						<label class="radio-inline btn btn-default">
						    <input type="radio" name="memberType" value="parents">학부모
						</label>
						<label class="radio-inline btn btn-default">
						     <input type="radio" name="memberType" value="teacher">선생님
						</label>
					</div>
				
				
					<label for="">아이디</label>
					<input type="text">
					<input type="button" value="중복확인">
					
					<label for="">비밀번호입력</label>
					<input type="password">
					<label for="">비밀번호확인</label>
					<input type="password">
					
					<label for="">이름</label>
					<input type="text">
					
					<label for="">연락처</label>
					<input type="text">
					
					<label for="">학교</label>
					<input type="text">
					
					<label for="">학년</label>
					<input type="text">
					
					<label for="">사진</label>
					<input type="file">	
			
			
			
					<button type="button" id="btnJoin">가입</button>
				</form>
			</div>
			<div class="col-md-2"></div>
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
		
		$("input[name='memberType']").change(function() {
			$("input[name='memberType']").parent("label").removeClass("btn-primary");
			$("input[name='memberType']").parent("label").addClass("btn-default");
			$(this).parent("label").removeClass("btn-default");
			$(this).parent("label").addClass("btn-primary");
		})
		
		$("#btnJoin").click(function() {
			
		});
		
	})
	
	
</script>
</html>


