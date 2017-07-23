<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">회원정보</h1>
</div>
</div>


<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
		<div class="form-group row">
			<div class="col-sm-4">
            	<img src="${pageContext.request.contextPath}/file/displayFile?filename=${teacher.tPicture }">
            </div>
         </div>
         
		 <div class="form-group row">
		 	<label class="col-sm-4 control-label">이름</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${teacher.tName }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">연락처</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${teacher.tPhone }</p>
            </div>
         </div>
         
         <div class="form-group row">
         	<label class="col-sm-4 control-label">담당과목</label>
			<div class="col-sm-8">
            	<p class="form-control-static">${teacher.tSubject.sbName }</p>
            </div>
         </div>
         <div class="form-group row" style="text-align:right">
         	<a href=""><button class="btn btn-info">정보수정</button></a>
         </div>
	</div>
	<div class="col-md-2"></div>
</div>


<%@ include file="../include/footer.jsp"%>	