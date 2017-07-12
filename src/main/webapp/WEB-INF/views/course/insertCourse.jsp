<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

		
	
	<label for="cName">강의명</label>
	<input type="text" id="cName" name="cName">
	<br>
	
	<label for="tuituion">강의료</label>
	<input type="text" id="tuituion" name="tuituion">
	<br>
	
	<label for="capacity">강의인원</label>
	<input type="text" id="capacity" name="capacity">
	<br>
	
	<p>
	<span id="courseTime">
	<label for="ttDay">강의요일</label>
	<select id="ttDay" name="ttDay">
		<option value="0">월</option>
		<option value="1">화</option>
		<option value="2">수</option>
		<option value="3">목</option>
		<option value="4">금</option>
		<option value="5">토</option>
		<option value="6">일</option>
	</select>
	<label for="ttStarttime">시작시간</label>
	<select id="ttStarttime" name="ttStarttime_hh">
		<c:forEach begin="09" end="22" var="hh">
		<c:if test="${hh > 12 }">
			<option value="${hh }">오후  ${hh-12 }시</option>
		</c:if>
		<c:if test="${hh <= 12 }">
			<option value="${hh }">오전  ${hh }시</option>
		</c:if>
		</c:forEach>
	</select>
	<select name="ttStarttime_MM">
		<c:forEach begin="00" end="50" var="MM" step="10">
			<c:if test="${MM == 0 }">
				<option value="${MM }">00</option>
			</c:if>
			<c:if test="${MM != 0 }">
				<option value="${MM }">${MM}</option>
			</c:if>
		</c:forEach>
	</select>
	<label for="ttEndtime">종료시간</label>
	<select id="ttEndtime" name="ttEndtime_hh">
		<c:forEach begin="09" end="22" var="hh">
		<c:if test="${hh > 12 }">
			<option value="${hh }">오후  ${hh-12 }시</option>
		</c:if>
		<c:if test="${hh <= 12 }">
			<option value="${hh }">오전  ${hh }시</option>
		</c:if>
		</c:forEach>
	</select>
	<select name="ttEndtime_MM">
		<c:forEach begin="00" end="50" var="MM" step="10">
			<c:if test="${MM == 0 }">
				<option value="${MM }">00</option>
			</c:if>
			<c:if test="${MM != 0 }">
				<option value="${MM }">${MM}</option>
			</c:if>
		</c:forEach>
	</select>
	
	<input type="button" id="addTimetable" value="+"> <!-- 누르면 강의시간 입력창 하나 더 추가 -->
	</span>
	</p>
	<br>
	
	<label for="cStartdate">강의시작일</label>
	<input type="text" id="cStartdate" name="cStartdate">
	<br>
	
	<label for="cEnddate">강의종료일</label>
	<input type="text" id="cEnddate" name="cEnddate">
	<br>
	
	<label for="classroom">강의실</label>
	<select id="classroom" name="classroom">
		<option></option>
	</select>
	<br>
	
	<label for="cContent">강의세부사항</label>
	<textarea rows="10" cols="50" id="cContent" name="cContent"></textarea>
	<br>
	
	<label for="cPicture">강의이미지</label>
	<input type="file" id="cPicture">
<br>
	
	<script>
		function addCourseTime() {
			var pTag = $("<p>");
			
			var labelDay = $("<label>");
			labelDay.html("강의요일");
			
			var arrDay = ["월", "화", "수", "목", "금", "토", "일"];
			var selectDay= $("<select>");
			selectDay.attr("name","ttDay");
			
			var optionDay = $("<option>");
			for(var i =0; i < 7; i++){
				optionDay.val(i);
				optionDay.html(arrDay[i]);
				selectDay.append(optionDay);
			}
			pTag.append();
			
			var labelStart  = $("<label>");
		}
	
		$("#addTimetable").click(function() {
			$("#courseTime").append();
		})
	</script>
	
	
<%@ include file="../include/footer.jsp"%>	