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
	input[name='memberType']{
		display: none;
	}
	
	.input-group{
		margin : 10px auto;
	}
	 
</style>

<%-- 
 (#{tId}, #{cNo}, #{sId}, #{spId}, #{msgContent}, #{isChecked}, current_timestamp) --%>
 	<div class="row">
 		<form action="writeAllMsg" method="post">
         	<input type="hidden" name="tId" value="aaa01">
         	<input type="hidden" name="cNo" value="0">
 		 <div class="input-group btn-group btn-group-justified">
	         <label class="radio-inline btn btn-primary">
	         	<input type="radio" name="memberType" value="all" checked="checked">단체공지
	         </label>
	         <label class="radio-inline btn btn-default">
	         	<input type="radio" name="memberType" value="student">학생단체
	         </label>
	         <label class="radio-inline btn btn-default">
	         	<input type="radio" name="memberType" value="parents">학부모단체
	         </label>
	    </div> 
 	
 		<!-- <div class="form-group">
	         <label>수업</label>
	         <select class="form-control">
         		<option>1</option>
         		<option>2</option>
         		<option>3</option>
         		<option>4</option>
         		<option>5</option>
         	</select>  
         </div> -->
         	<div class="form-group">
             	<label>메시지 내용</label>
            	<textarea class="form-control" rows="3" name="msgContent"></textarea>
            </div>
            <div class="input-group">
				<input type="submit" value="전송" class=" btn btn-primary" >
			</div>
         </form>
	</div>
<%@ include file="../include/footer.jsp"%>	

<script type="text/javascript">
	$(function() {
		
		
		$("input[name='memberType']").change(function() {
			$("input[name='memberType']").parent("label").removeClass("btn-primary");
			$("input[name='memberType']").parent("label").addClass("btn-default");
			$(this).parent("label").removeClass("btn-default");
			$(this).parent("label").addClass("btn-primary");
		})
		
	})
	

</script>