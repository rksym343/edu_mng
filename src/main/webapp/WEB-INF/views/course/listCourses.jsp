<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

	<table border='1'>
		<tr>
			<th>교과</th>
			<th>대상학년</th>
			<th>강의명</th>
			<th>담당선생님</th>
			<th>강의시간</th>
		</tr>
		<c:forEach items="${listCourses }" var="course">
			<tr>
				<td>${course.subject.sbName }</td>
				<td>${course.studentGrade.gdName }</td>
				<td>${course.cName }</td>
				<td>${course.teacher.tName }</td>
				<td>강의시간</td>
			</tr>
		</c:forEach>		
	</table>
	
	<hr>
	
	<table border='1'>
		<tr>
			<th>교과</th>
			<th>대상학년</th>
			<th>강의명</th>
			<th>담당선생님</th>
			<th>강의시간</th>
		</tr>
		<c:forEach items="${Courses }" var="tt">
			<tr>
				<td>${tt.course.subject.sbName }</td>
				<td>${tt.course.studentGrade.gdName }</td>
				<td>${tt.course.cName }</td>
				<td>${tt.course.teacher.tName }</td>
				<td>${tt.course.teacher.tName }</td>
			</tr>
		</c:forEach>		
	</table>

<%@ include file="../include/footer.jsp"%>	