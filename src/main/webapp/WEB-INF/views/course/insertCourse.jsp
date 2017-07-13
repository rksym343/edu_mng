<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

<style>

	*{
		margin : 0;
		padding : 0;
	}
	label{
		display : inline-block;
		width : 100px;
		font-weight: bold;
	}
	label.mid{
		text-align: right;
	}
</style>
		
	<form action="insertCourse" method="post" enctype="multipart/form-data">
		<input type="hidden" name="tId" value="aaa01">
	
		<label for="cName">강의명</label>
		<input type="text" id="cName" name="cName">
		
		<label for="sbNo">해당교과</label>
		<input type="text" id="sbNo" name="sbNo">
		<br>
		
		<label for="tuition">강의료</label>
		<input type="text" id="tuition" name="tuition">
		<br>
		
		<label for="capacity">강의인원</label>
		<input type="text" id="capacity" name="capacity">
		<br>
		
		
		
		<label for="gdNo">강의대상학년</label>
		<input type="text" id="gdNo" name="gdNo">
		<br>
		
		<p id="courseTime">
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
		<label for="ttStarttime" class="mid">시작시간</label>
		<select id="ttStarttime" name="ttStarttime_hh">
			<c:forEach begin="09" end="22" var="hh">
				<c:if test="${hh > 12 }">
					<c:if test="${(hh-12) < 10 }">
						<option value="${hh }">오후 0${hh-12 }시</option>
					</c:if>	
					<c:if test="${(hh-12) >= 10 }">
						<option value="${hh }">오후  ${hh-12 }시</option>
					</c:if>
				</c:if>
				<c:if test="${hh <= 12 }">
					<c:if test="${hh < 10 }">
						<option value="${hh }">오전  0${hh }시</option>
					</c:if>	
					<c:if test="${hh >= 10 }">
						<option value="${hh }">오전  ${hh }시</option>
					</c:if>
					
				</c:if>
			</c:forEach>
		</select>
		<select name="ttStarttime_MM">
			<c:forEach begin="00" end="50" var="MM" step="10">
				<c:if test="${MM == 0 }">
					<option value="${MM }">00분</option>
				</c:if>
				<c:if test="${MM != 0 }">
					<option value="${MM }">${MM}분</option>
				</c:if>
			</c:forEach>
		</select>
		<label for="ttEndtime" class="mid">종료시간</label>
		<select id="ttEndtime" name="ttEndtime_hh">
			<c:forEach begin="09" end="22" var="hh">
			<c:if test="${hh > 12 }">
					<c:if test="${(hh-12) < 10 }">
						<option value="${hh }">오후 0${hh-12 }시</option>
					</c:if>	
					<c:if test="${(hh-12) >= 10 }">
						<option value="${hh }">오후  ${hh-12 }시</option>
					</c:if>
				</c:if>
				<c:if test="${hh <= 12 }">
					<c:if test="${hh < 10 }">
						<option value="${hh }">오전  0${hh }시</option>
					</c:if>	
					<c:if test="${hh >= 10 }">
						<option value="${hh }">오전  ${hh }시</option>
					</c:if>
					
				</c:if>
			</c:forEach>
		</select>
		<select name="ttEndtime_MM">
			<c:forEach begin="00" end="50" var="MM" step="10">
				<c:if test="${MM == 0 }">
					<option value="${MM }">00분</option>
				</c:if>
				<c:if test="${MM != 0 }">
					<option value="${MM }">${MM}분</option>
				</c:if>
			</c:forEach>
		</select>
		
		<input type="button" id="addTimetable" value="+"> <!-- 누르면 강의시간 입력창 하나 더 추가 -->
		</p>
		<br>
		
		<label for="cStart">강의시작일</label>
		<input type="text" id="cStart" name="cStart">
		<br>
		
		<label for="cEnd">강의종료일</label>
		<input type="text" id="cEnd" name="cEnd">
		<br>
		
		<label for="classroom">강의실</label>
		<input type="text" id="classroom" name="classroom">
		<br>
		
		<label for="cContent">강의세부사항</label>
		<textarea rows="10" cols="50" id="cContent" name="cContent"></textarea>
		<br>
		
		<label for="picture">강의이미지</label>
		<input type="file" id="picture" name="picture">
		<br>

		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	
	<script>
		function addCourseTime() {
			var pTag = $("<p>");
			
			var labelDay = $("<label>");
			labelDay.html("강의요일");
			
			var arrDay = ["월", "화", "수", "목", "금", "토", "일"];
			var selectDay= $("<select>");
			selectDay.attr("name","ttDay");
			
			
			for(var i =0; i < 7; i++){
				var optionDay = $("<option>");
				optionDay.val(i);
				optionDay.html(arrDay[i]);
				selectDay.append(optionDay);
			}
			
			var labelStart  = $("<label>");
			labelStart.html("시작시간");
			labelStart.addClass("mid");

			var labelEnd  = $("<label>");
			labelEnd.html("종료시간");
			labelEnd.addClass("mid");
			
			var selectStartTime = $("<select>");
			selectStartTime.attr("name", "ttStarttime_hh");
			
			var selectEndTime = $("<select>");
			selectEndTime.attr("name", "ttEndtime_hh");
			
			
			
			for(var i = 09; i < 23; i++){
				var optionTime ="<option";
				if (i < 13){
					if(i < 10){
						optionTime +=  " value=" +i+"> 오전 0"+i+"시</option>";
					}else{
						optionTime +=  " value=" +i+"> 오전 "+i+"시</option>";
					}
				}else{
					if( (i-12) < 10){
						optionTime +=  " value=" +i+"> 오후 0"+(i-12)+"시</option>";
					}else{
						optionTime +=  " value=" +i+"> 오후 "+(i-12)+"시</option>";
					}
				}
				selectEndTime.append(optionTime);
				selectStartTime.append(optionTime);
			}
			
			
			var selectStartMinute = $("<select>");
			selectStartMinute.attr("name", "ttStarttime_MM");
			var selectEndMinute = $("<select>");
			selectEndMinute.attr("name", "ttEndtime_MM");
			
			
			for(var j =0; j < 6; j++){
				if(j == 0){
					var optionMinute = "<option value='" + j+"'>00분</option>";
				}else{
					var optionMinute = "<option value='" + j+"'>"+(j*10)+"분</option>";
				}
				selectStartMinute.append(optionMinute);
				selectEndMinute.append(optionMinute);
			}
			
			
			pTag.append(labelDay);
			pTag.append(selectDay);
			
			pTag.append(labelStart);
			pTag.append(selectStartTime);
			pTag.append(selectStartMinute);
			

			pTag.append(labelEnd);
			pTag.append(selectEndTime);
			pTag.append(selectEndMinute);
			
			return pTag;
		}
	
		$("#addTimetable").click(function() {
			$("#courseTime").append(addCourseTime);
		});
	</script>
	
	
<%@ include file="../include/footer.jsp"%>	