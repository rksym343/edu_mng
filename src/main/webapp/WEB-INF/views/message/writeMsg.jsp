<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header"></h1>
</div>
</div>
<style type="text/css">
	/* body{
		background-color: #ddd;
	}
	.login-container{
		background-color : #fff;
		
		border : 1px solid black;
		padding : 20px;
		
	}*/
	.input-group{
		margin : 10px auto;
	}
	/* .hiddenBox{
		display: none;
	}
	  */
</style>

 	<div class="row">
 		<form action="writeMsg" method="post" id="f1">
         	<input type="hidden" name="tId" value="aaa01">
 		<!--  <div class="input-group btn-group btn-group-justified">
	         <label class="radio-inline btn btn-primary">
	         	<input type="radio" name="memberType" value="all" checked="checked">단체공지
	         </label>
	         <label class="radio-inline btn btn-default">
	         	<input type="radio" name="memberType" value="student">학생단체
	         </label>
	         <label class="radio-inline btn btn-default">
	         	<input type="radio" name="memberType" value="parents">학부모단체
	         </label>
	    </div>  -->
 		
 		<div class="form-group">
 			<div class="col-lg-12">
		         <label>수업</label>
		         <select class="form-control" name="cNo">
		         	<option value="0">전체보기</option>
		         	<c:forEach items="${courseList }" var="course">
		         		<option value="${course.cNo }">${course.cName }</option>
		         	</c:forEach>
	         	</select>  
	        <input type="hidden" name="cName" >
         	</div>
         	<div class="col-lg-6">
	         	<select multiple class="form-control receiver" name="sId" id="student">
	         	</select>
         	</div>
         	<div class="col-lg-6">
	         	<select multiple class="form-control receiver" name="pId" id="parents">
	         	</select>
         	</div>
         	
        </div> 
         	<div class="form-group">
             	<label>메시지 내용</label>
            	<textarea class="form-control" rows="3" name="msgContent"></textarea>
            </div>
            <div class="input-group">
				<input type="submit" id="send" value="전송" class=" btn btn-primary" >
			</div>
         </form>
	</div>
<%@ include file="../include/footer.jsp"%>	

<script type="text/javascript">
	var today = new Date();
	var year = today.getFullYear();
	var month = today.getMonth();
	$(function() {
		getMyStudents(0);
		$("select[name='cNo']").change(function() {
			var cNo = $(this).val();
			var cName = $("select[name='cNo'] option:selected").text();
			$("input[name='cName']").val(cName);
			getMyStudents(cNo);
		});
		
		/* $("#send").click(function() {
			 $("#fruits").change(function() {
				    $("#num").val($(this).children(":selected").length);
				  });
			 $("#student").children(":selected").each(function(i, obj) {
				 var hiddenTag = "<input type='hidden' name='sId' value='"+$(obj).val()+"'>";
				$("#f1").append(hiddenTag);
			});
			 $("#parents").children(":selected").each(function(i, obj) {
				 var hiddenTag = "<input type='hidden' name='pId' value='"+$(obj).val()+"'>";
				$("#f1").append(hiddenTag);
			});
			$("#f1").submit();
		}); */
		
	})
	
	function getMyStudents(cNo){
	  		$.ajax({
	  			// myRegisteredStudents/{cNo}/{year}/{month}/{rsNo}
	  			url: "${pageContext.request.contextPath}/course/myRegisteredStudents/"+cNo+"/"+year+"/"+(month+1)+"/"+1,
	  			type : "get",
	  			dataType: "json",
	  			success:function(data){
	  				console.log(data);
	  				$("select.receiver").html("");
	  				$.each(data, function(idx, v) {
	  					var opStudentTag = 
	  						"<option value='"+v.student.sId+"'>"
	  							+v.student.sName+"["+v.student.sPhone+"]"
	  							+"</option>";	
	  					$("#student").append(opStudentTag);
	  					
	  					$.each(v.student.parents, function(i, p) {	
	  						var opParentsTag = 
		  						"<option value='"+p.spId+"'>"
		  							+v.student.sName+" 학부모("+p.spRelationship+")"+"["+p.spPhone+"]"
		  							+"</option>";
	  						$("#parents").append(opParentsTag);
	  					});	
	  					
	  				});
	  			}
	  				
	  			})
	  		}
	

</script>