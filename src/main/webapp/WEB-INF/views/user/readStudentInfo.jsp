<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">회원정보</h1>
</div>
</div>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="form-group row text-center">
			<div class="col-sm-4">
				<div class="panel panel-success">
					<div class="panel-body">
	            		<img src="${pageContext.request.contextPath}/file/displayFile?filename=${student.sPicture }"  class="img-thumbnail">
	            	</div>
	            	<div class="panel-footer">
						사진
					</div>
            	</div>
            </div>
         </div>
         
        
	
	
		 <div class="form-group row">		 
         	<label class="col-sm-4 control-label">이름</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${student.sName }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">연락처</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${student.sPhone }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">메세지요청</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${student.transferMethod.tmMethod }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">학교</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${student.school }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">학년</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${student.sGrade.gdName }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">등록일</label>
			<div class="col-sm-8">
            	<p class="form-control-static">
            		<fmt:formatDate value="${student.joinDate }" pattern="yyyy-MM-dd hh:mm:ss"/>            		
            	</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">학부모</label>
			<div class="col-sm-8">
				<c:forEach items="${parents }" var="parent">
            		<p class="form-control-static">[${parent.spRelationship }] ${parent.spName }(${parent.spId })님 연락처 : ${parent.spPhone }</p>
				</c:forEach>
            </div>
         </div>
         
         
         <div class="form-group row" style="text-align:right">
         	<a href=""><button class="btn btn-info">정보수정</button></a>
         </div>
	</div>
	<div class="col-md-2"></div>
	
</div>


<%@ include file="../include/footer.jsp"%>	