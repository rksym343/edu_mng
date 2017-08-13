<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<style>
	.panel-footer{
		text-align: center;
	}
</style>
<div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">회원정보
                    <!-- <small>Subheading</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home</a>
                    </li>
                    <li class="active">회원정보</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
	

<div class="row">
	<div class="col-lg-2"></div>
	<div class="col-lg-8">
		<div class="form-group row text-center">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="panel panel-success">
					<div class="panel-body">
	            		<img src="${pageContext.request.contextPath}/file/displayFile?filename=${student.sPicture }"  class="img-thumbnail">
	            	</div>
	            	<div class="panel-footer">
	            		<form action="">
		            		<button type="button" class="btn btn-default" id="changeImg">
		            			<i class="fa fa-camera fa-2x"></i>	
		            		</button> 
		            		<button type="button" class="btn btn-default" id="changeImgOK">
		            			<i class="fa fa-check fa-2x"></i>	
		            		</button>
							<input type="file" style="display: none;" id="imgFile" accept="image/*">
						</form>
					</div>
            	</div>
            </div>
            <div class="col-lg-4"></div>
         </div>
         
        
	
	
		 <div class="form-group row">	
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">이름</label>
			<div class="col-lg-3">
            	<p class="form-control-static">${student.sName }</p>
            </div>
            <div class="col-lg-3"></div>
         </div>
         
         <div class="form-group row">
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">연락처</label>
			<div class="col-lg-3">
            	<p class="form-control-static">${student.sPhone }</p>
            </div>            
		 	<div class="col-lg-3"></div>	 
         </div>
         
         <div class="form-group row">         	
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">메세지요청</label>
			<div class="col-lg-3">
            	<p class="form-control-static">${student.transferMethod.tmMethod }</p>
            </div>            
		 	<div class="col-lg-3"></div>	 
         </div>
         
         <div class="form-group row">
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">학교</label>
			<div class="col-lg-3">
            	<p class="form-control-static">${student.school }</p>
            </div>
		 	<div class="col-lg-3"></div>	 
         </div>
         
         <div class="form-group row">
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">학년</label>
			<div class="col-lg-3">
            	<p class="form-control-static">${student.sGrade.gdName }</p>
            </div>
		 	<div class="col-lg-3"></div>	 
         </div>
         
         <div class="form-group row">
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">등록일</label>
			<div class="col-lg-3">
            	<p class="form-control-static">
            		<fmt:formatDate value="${student.joinDate }" pattern="yyyy-MM-dd hh:mm:ss"/>            		
            	</p>
            </div>
		 	<div class="col-lg-3"></div>	 
         </div>
         
         <div class="form-group row">
		 	<div class="col-lg-3"></div>	 
         	<label class="col-lg-3 control-label">학부모</label>
			<div class="col-lg-3">
				<c:forEach items="${parents }" var="parent">
            		<p class="form-control-static">[${parent.spRelationship }] ${parent.spName }(${parent.spId })님 연락처 : ${parent.spPhone }</p>
				</c:forEach>
            </div>
		 	<div class="col-lg-3"></div>	 
         </div>
         
         
         <div class="form-group row" style="text-align:center;">
         	<a href=""><button class="btn btn-success btn-lg">정보수정</button></a>
         </div>
	</div>
	<div class="col-lg-2"></div>
	
</div>


<%@ include file="../include/footer.jsp"%>	
<script type="text/javascript">
	$("#changeImg").click(function() {
		
		$("#imgFile").click();
		$("#changeImgOK").css("display","block");
		$("#changeImg").css("display","none");
	});n
</script>