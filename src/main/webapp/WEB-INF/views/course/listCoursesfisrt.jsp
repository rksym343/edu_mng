<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

	<%-- <table border='1'>
		<tr>
			<th>교과</th>
			<th>대상학년</th>
			<th>강의명</th>
			<th>담당선생님</th>
			<th>선택</th>
		</tr>
		<c:forEach items="${listCourses }" var="course">
			<tr>
				<td>${course.subject.sbName }</td>
				<td>${course.studentGrade.gdName }</td>
				<td>${course.cName }</td>
				<td>${course.teacher.tName }</td>
			</tr>
		</c:forEach>		
	</table>
		
	<hr> --%>
	
	<table border='1'>
		<tr>
			<th>교과</th>
			<th>대상학년</th>
			<th>강의명</th>
			<th>담당선생님</th>
			<th>강의시간</th>
		</tr>
		<c:forEach items="${listCourses }" var="course">
			<tr onclick="readCourse(${course.cNo })">
				<td>${course.subject.sbName }</td>
				<td>${course.studentGrade.gdName }</td>
				<td>[${course.cNo }] ${course.cName }</td>
				<td>${course.teacher.tName }</td>
				<td>
				<c:if test="${empty course.timetables }">
					시간미정
				</c:if>
				<c:if test="${!empty course.timetables }">
					<c:forEach items="${course.timetables }" var="tt">
							<p><span class="ttDay">${tt.ttDay }</span> : ${tt.ttStarttime } ~ ${tt.ttEndtime } </p>
					</c:forEach>
				</c:if>
				</td>	
			</tr>
		</c:forEach>
			
	</table>

<%@ include file="../include/footer.jsp"%>	
<script>
	
	function readCourse(cNo){
		location.href="${pageContext.request.contextPath}/course/readCourse?cNo="+cNo;
	}
	
</script>

