<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>


	<table border='1'>
		<tr>
			<th>sId</th>
			<th>대상학년</th>
			<th>강의명</th>
			<th>담당선생님</th>
			<th>선택</th>
		</tr>
		<c:forEach items="${list }" var="cart">
			<tr>
				<td>${cart.sId }</td>
				<td>${cart.course.cNo }</td>
				<td>${cart.course.cName }</td>
				<td>${cart.cartDate }</td>
			</tr>
		</c:forEach>		
	</table>
		
	<hr>
	
<%@ include file="../include/footer.jsp"%>	