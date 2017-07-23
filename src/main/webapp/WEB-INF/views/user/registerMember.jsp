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

<title>회원가입</title>
<style type="text/css">
	
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
        	<div class="col-md-3"></div>
			<div class="col-md-6">
					<div class="row">
					<div class="input-group btn-group btn-group-justified">
						 <label class="radio-inline btn btn-primary">
							<input type="radio" name="memberType" value="student" checked>학생
						 </label>
						<label class="radio-inline btn btn-default">
						    <input type="radio" name="memberType" value="parents">학부모
						</label>
						<label class="radio-inline btn btn-default">
						     <input type="radio" name="memberType" value="teacher">선생님
						</label>
					</div>
					</div>
				<form role="form" id="f1" action="registerMember" method="post" enctype="multipart/form-data">
					
				
				
					<div class="row student parents teacher">
					<div class="form-group">
					    <label for="id" class="col-sm-2 control-label">아이디</label>
					    <div class="col-sm-8">
							<input class="form-control" type="text" name="id" id="id">	
							<p class="text-danger"></p>				    	
					    </div>
						<button class="col-sm-2 btn btn-primary" type="button" id="btnIdcheck">중복확인</button>					
					</div>
					</div>
					
					<div class="row student parents teacher">
					<div class="form-group">
					    <label for="pw" class="col-sm-2 control-label">비밀번호 입력</label>
					    <div class="col-sm-10">
							<input class="form-control" type="password" name="pw" id="pw">					    	
					    </div>		
					</div>
					</div>
					
					<div class="row student parents teacher">
					<div class="form-group">
					    <label for="pw2" class="col-sm-2 control-label">비밀번호 확인</label>
					    <div class="col-sm-10">
							<input class="form-control" type="password" name="pw2" id="pw2">					    	
					    </div>		
					</div>
					</div>
					
					<div class="row student parents teacher">
					<div class="form-group">
					    <label for="name" class="col-sm-2 control-label">이름</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="name" id="name">					    	
					    </div>		
					</div>
					</div>
					
					<div class="row student parents teacher">
					<div class="form-group">
					    <label for="phone" class="col-sm-2 control-label">연락처</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="phone" id="phone">					    	
					    </div>		
					</div>
					</div>
					
					
					<!-- 학부모 학생 공통 -->
					<div class="row student parents">
					<div class="form-group">
					    <label for="tmNo" class="col-sm-2 control-label">전송방법</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="tmNo" id="tmNo">					    	
					    </div>		
					</div>
					</div>
					
					<!-- 학생 -->
					<div class="row student">
					<div class="form-group">
					    <label for="school" class="col-sm-2 control-label">학교</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="school" id="school">					    	
					    </div>		
					</div>
					</div>
					
					<!-- 학생 -->
					<div class="row student">
					<div class="form-group">
					    <label for="gdNo" class="col-sm-2 control-label">학년</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="gdNo" id="gdNo">					    	
					    </div>		
					</div>
					</div>
					
					<!-- 학부모 -->
					<div class="row parents">
					<div class="form-group">
					    <label for="spRelationship" class="col-sm-2 control-label">학생과 관계</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="spRelationship" id="spRelationship">					    	
					    </div>		
					</div>
					</div>
					
					<!-- 학부모 -->
					<div class="row parents">
					<div class="form-group">
					    <label for="sId" class="col-sm-2 control-label">학생ID</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="sId" id="sId">					    	
					    </div>		
					</div>
					</div>
					
					<!-- 선생님 -->
					<div class="row teacher">
					<div class="form-group">
					    <label for="sbNo" class="col-sm-2 control-label">담당과목</label>
					    <div class="col-sm-10">
							<input class="form-control" type="text" name="sbNo" id="sbNo">					    	
					    </div>		
					</div>
					</div>
				
					<!-- 선생님 학생 공통-->
					<div class="row student teacher">
					<div class="form-group">
					    <label for="picture" class="col-sm-2 control-label">사진</label>
					    <div class="col-sm-10">
							<input class="form-control" type="file" name="picture" id="picture">					    	
					    </div>		
					</div>
					</div>
					
					<div class="form-group" style="text-align:center">
					    <button type="button" id="btnJoin" class="btn btn-primary">가입</button>	
					</div>
					
				</form>
			</div>
			<div class="col-md-3"></div>
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
		viewInputByMemberType($("input:radio[name='memberType']:checked").val());
		$("input[name='memberType']").change(function() {
			$("input[name='memberType']").parent("label").removeClass("btn-primary");
			$("input[name='memberType']").parent("label").addClass("btn-default");
			$(this).parent("label").removeClass("btn-default");
			$(this).parent("label").addClass("btn-primary");
			viewInputByMemberType($(this).val());
		});
			
		
		
		$("#btnJoin").click(function() {
			var memberType = $("input[name='memberType']:checked").val();
			infoToClassType(memberType);
		});
		
		$("#btnIdcheck").click(function() {
			var id = $("input[name='id']").val();
			$.ajax({
				url: "${pageContext.request.contextPath}/user/checkId/"+id,
				type : "get",
				dataType : "text",
				data: "text",
				success:function(data){
	                console.log(data);
					if(data ==""){
						alert("사용가능한 아이디입니다.");
						$("input[name='id']").next("p").hide();
					}else{
						$("input[name='id']").next("p").html("이미 존재하는 아이디 입니다.");
						$("input[name='id']").next("p").show();
					}
				}
					
			});
		});
		
	});
	
	function viewInputByMemberType(memberType){
		//alert(memberType);
			$("#f1 > div.row").hide();
			if(memberType=="student"){
				$("#f1 > div.student").show();
			}else if(memberType=="parents"){
				$("#f1 > div.parents").show();
			}else if(memberType=="teacher"){
				$("#f1 > div.teacher").show();
			}
	}	
	function infoToClassType(memberType){
		var idName, pwName, nameName, phoneName;
			if(memberType=="student"){
				idName = "sId";
				pwName= "sPassword";
				nameName = "sName";
				phoneName="sPhone";
				$("#f1").attr("action","registerStudent");
			}else if(memberType=="parents"){
				idName = "spId";
				pwName= "spPassword";
				nameName = "spName";
				phoneName="spPhone";
				$("#f1").attr("action","registerParents");
			}else if(memberType=="teacher"){
				idName = "tId";
				pwName= "tPassword";
				nameName = "tName";
				phoneName="tPhone";
				$("#f1").attr("action","registerTeacher");
			}
		var hiddenTag = 
			"<input type='hidden' name='"+idName+"' value='"+$("#id").val()+"'>"
			+ "<input type='hidden' name='"+pwName+"' value='"+$("#pw").val()+"'>"
			+ "<input type='hidden' name='"+nameName+"' value='"+$("#name").val()+"'>"
			+ "<input type='hidden' name='"+phoneName+"' value='"+$("#phone").val()+"'>";
			$("#f1").append(hiddenTag);
			alert($("input[name='memberType']:checked").val());
			alert(hiddenTag);
			$("#f1").submit();
	}	
	
	
</script>
</html>


