<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

	<form action="registerCourses" method="post">
	<table border='1'>
		<tr>
			<th>교과</th>
			<th>대상학년</th>
			<th>강의명</th>
			<th>담당선생님</th>
			<th>선택</th>
		</tr>
		<input type="hidden" name="sId" value="sss01">
		<c:forEach items="${listCourses }" var="course">
			<tr>
				<td>${course.subject.sbName }</td>
				<td>${course.studentGrade.gdName }</td>
				<td>${course.cName }</td>
				<td>${course.teacher.tName }</td>
				<td><input type="checkbox" name="cNos" value="${course.cNo}"></td>
				
			</tr>
		</c:forEach>		
	</table>
		<input type="submit" value="신청">
		<input type="reset" value="취소">
	</form>

<%@ include file="../include/footer.jsp"%>	