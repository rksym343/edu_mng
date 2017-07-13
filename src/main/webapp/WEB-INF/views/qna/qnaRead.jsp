<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>



	<input type="hidden" readonly="readonly"> //부모글번호

	<label for="">글번호</label>
	<input type="text" readonly="readonly">


	<label for="">게시자</label>
	<input type="text" readonly="readonly">
	
	<label for="">비밀번호</label>
	<input type="password">
	
	<label for="">공개여부</label>
	<input type="checkbox">
	
	<label for="">제목</label>
	<input type="text">
	
	<label for="">등록일</label>
	<input type="text">
	
	<label for="">내용</label>
	<textarea rows="" cols=""></textarea>

<%@ include file="../include/footer.jsp"%>	