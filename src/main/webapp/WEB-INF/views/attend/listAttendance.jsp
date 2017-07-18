<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>

	<p>
		<select name="searchType" id="searchType">
			<option value="" ${cri.searchType==''? 'selected' :'' }>-----</option>
			<option value="date" ${cri.searchType=='date'? 'selected' :'' }>날짜별</option>
			<option value="period" ${cri.searchType=='period'? 'selected' :'' }>기간별</option>
			<option value="course" ${cri.searchType=='course'? 'selected' :'' }>강의별</option>
			<option value="sId" ${cri.searchType=='sId'? 'selected' :'' }>학생아이디</option>
		</select>
		<input type="text" name="keyword" value=" ${cri.keyword}">
		<button id="btnCri">검색</button>
	</p>
	<hr>	
	<input type="radio" value="0" checked="checked" id="sNull" name="status"/>
	<label for="sNull">전체</label>
	<c:forEach items="${statusList }" var="status">
			<input type="radio" value="${status.asNo }" ${status.asNo==cri.status? 'checked' :'' }  id="s${status.asNo }" name="status"/>
			<label for="s${status.asNo }">${status.asStatus }</label>
	</c:forEach>
	<hr>
	<table border="1">
		<tr>
			<th>학생아이디</th>
			<th>학생이름</th>
			<th>학년</th>
			<th>시간</th>
			<th>현재상태</th>
			<th>변경 출결상태</th>
		</tr>
		
		<c:if test="${list.size() ==0 }">
			<tr class="viewListTr">
				<td colspan="6">해당 데이터 없음</td>
			</tr>
		</c:if>
		<c:if test="${list.size() !=0 }">
			<c:forEach items="${list }" var="at">
			<tr class="viewListTr">
				<td>${at.student.sId }</td>
				<td>${at.student.sName }</td>
				<td>${at.student.sGrade.gdName }</td>
				<td><fmt:formatDate value="${at.theTime }" pattern="yyyy-MM-dd aa hh:mm:ss"/></td>
				<td>${at.attendanceStatus.asStatus }</td>
				<td>
					<select>
						<c:forEach items="${statusList }" var="status">
						<option value=${status.asNo } ${status.asNo==at.attendanceStatus.asNo? 'selected' :'' }>${status.asStatus }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
		</c:forEach>
		</c:if>
		
	</table>
	
	<script>
		$("#cri").change(function() {
			/* <option value="date">날짜별</option>
			<option value="period">기간별</option>
			<option value="status">출결상태별</option>
			<option value="sIds">강의별</option>
			<option value="sId">학생별</option> */
			
			switch ($("this").val()) {
			case "date":
				$("input[name='criValue']").attr(id,"datepicker");
				break;
			case "period":
							
				break;
			case "status":
				
				break;
			case "sIds":
				
				break;
			case "sId":
				
				break;
			default:
				break;
			}
		})
		$(function() {
			$("#datepicker").datepicker();
		})
			
		$("#btnCri").click(function() {
			/* $(".viewListTr").remove(); // 기존 데이터 지우고
			var cri = $("#cri").val();
			var criValue = $("#criValue").val();
			var sendData = {
					cri:cri,
					criValue:criValue
			};
			
			$.ajax({
				url : "${pageContext.request.contextPath}/attend/listAttendanceByCri",
				type:"get",
				dataType:"json",
				data: JSON.stringify(sendData),
				headers :{"Content-Type":"application/json"},
				success: function(data) {
					console.log(data);
				}
			}) */
			
			var keyword=$("input[name='keyword']").val().trim();
			var searchType=$("select[name='searchType']").val();
			var status = $("input[name='status']:checked").val();
			location.href="listAttendance?searchType="+searchType
					+"&keyword="+keyword
					+"&status="+status;
		})	
	</script>


<%@ include file="../include/footer.jsp"%>