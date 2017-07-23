<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">강의개설</h1>
</div>
</div> <!-- div row -->
	<style>
		div.center > div {
			margin : 0 auto;
		}
		.form-group{
			padding : 10px;
		}
		tr{
			padding : 10px 0;
		}
	</style>

	<div class="center">
		<div class="col-lg-10">	
	<form role="form" action="updateCourse" method="post" enctype="multipart/form-data" id="f1">
		<input type="hidden" name="cNo" value="${course.cNo }">
		<div class="row">
		<div class="form-group">
		    <label class="col-sm-1 control-label" for="gdNo">수업대상</label>
		    <div class="col-sm-5">
		    	<select id="gdNo" name="gdNo"  class="form-control">
					<c:forEach items="${studentGradeList }" var="grade">
						<option value="${grade.gdNo }" ${course.studentGrade.gdName=='${grade.gdName }' ?'selected' :'' }>${grade.gdName }</option>
					</c:forEach>
				</select>
		    </div>
		    
		    <label class="col-sm-1 control-label" for="sbNo">교과목</label>
		    <div class="col-sm-5">
		    	<select id="sbNo" name="sbNo" class="form-control">
					<c:forEach items="${subjectList }" var="subject">
						<option value="${subject.sbNo }" ${course.subject.sbName=='${subject.sbName }' ? 'selected' :'' }>${subject.sbName }</option>
					</c:forEach>
				</select>
		    </div>
		</div>
		</div>
		
		<div class="row">
		<div class="form-group">
			<label class="col-sm-1 control-label" for="tId">담당선생님</label>
		    <div class="col-sm-2">
		    	<select id="tId" name="tId"  class="form-control">
					<c:forEach items="${TeacherList }" var="teacher">
						<option value="${teacher.tId }" ${course.teacher.tName=='${teacher.tName }' ? 'selected' :'' }>${teacher.tName }</option>
					</c:forEach>
				</select>
		    </div>
		    <label class="col-sm-1 control-label" for="cName">수업명</label>
		    <div class="col-sm-8">
		    	<input class="form-control" type="text" id="cName" name="cName" placeholder="수업명"  value="${course.cName } ">
		    </div>
		</div>
		</div>
		
		<div class="row">
		<div class="form-group">
		    <label class="col-sm-1 control-label" for="tuition">수업료</label>
		    <div class="col-sm-11">
		    	<input class="form-control" type="text" id="tuition" name="tuition" placeholder="수업료" value="${course.tuition}">
		    </div>
		</div>
		</div>
		
		<div class="row">
		<div class="form-group">
		    <label class="col-sm-1 control-label" for="capacity">수업인원</label>
		    <div class="col-sm-11">
		    	<input class="form-control" type="text" id="capacity" name="capacity" placeholder="${course.capacity}">
		    </div>
		</div>
		</div>
		
		<div class="row">
		<div class="form-group">
		    <label class="col-sm-1 control-label" for="ttDay">수업시간</label>
		    <div class="col-sm-10">
		    	<table  id="courseTime">
		    	<c:forEach items="${course.timetables}" var="timetable">
		            <li>[<span class="ttDay">${timetable.ttDay }</span>] : ${timetable.ttStarttime }~${timetable.ttEndtime }</li>
		       		<tr>
		    			<td class="col-sm-2">
					    	<select id="ttDay" name="ttDay" class="form-control col-sm-2">
					    		<%-- <c:forEach begin="1" end="6" var="idx">
					    			<option value="${idx }"></option>
					    		</c:forEach>
					    		<option value="0"></option> --%>
					    		<option value="1" ${timetable.ttDay==1?'selected' :''} >월</option>
								<option value="2" ${timetable.ttDay==2?'selected' :''}>화</option>
								<option value="3" ${timetable.ttDay==3?'selected' :''}>수</option>
								<option value="4" ${timetable.ttDay==4?'selected' :''}>목</option>
								<option value="5" ${timetable.ttDay==5?'selected' :''}>금</option>
								<option value="6" ${timetable.ttDay==6?'selected' :''}>토</option>
								<option value="0" ${timetable.ttDay==0?'selected' :''}>일</option>
							</select>
						</td>
						<td class="col-sm-2">
							<select id="ttStarttime" name="ttStarttime_hh" class="form-control col-sm-2">
								<c:forEach begin="09" end="22" var="hh">
									<c:if test="${hh > 12 }">
										<c:if test="${(hh-12) < 10 }">
											<option value="${hh }">오후 0${hh-12 }시</option>
										</c:if>	
										<c:if test="${(hh-12) >= 10 }">
											<option value="${hh }">오후  ${hh-12 }시</option>
										</c:if>
									</c:if>
									<c:if test="${hh == 12 }">
										<option value="${hh }">오후  ${hh }시</option>
									</c:if>
									<c:if test="${hh < 12 }">
										<c:if test="${hh < 10 }">
											<option value="${hh }">오전  0${hh }시</option>
										</c:if>	
										<c:if test="${hh >= 10 }">
											<option value="${hh }">오전  ${hh }시</option>
										</c:if>
										
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="col-sm-2">
							<select name="ttStarttime_MM" class="form-control col-sm-2">
								<c:forEach begin="00" end="50" var="MM" step="10">
									<c:if test="${MM == 0 }">
										<option value="${MM }">00분</option>
									</c:if>
									<c:if test="${MM != 0 }">
										<option value="${MM }">${MM}분</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="col-sm-1">
							<label class="control-label" style="text-align : center">~</label>
						</td>
						<td class="col-sm-2">
							<select id="ttEndtime" name="ttEndtime_hh" class="form-control col-sm-2">
								<c:forEach begin="09" end="22" var="hh">
									<c:if test="${hh > 12 }">
										<c:if test="${(hh-12) < 10 }">
											<option value="${hh }">오후 0${hh-12 }시</option>
										</c:if>	
										<c:if test="${(hh-12) >= 10 }">
											<option value="${hh }">오후  ${hh-12 }시</option>
										</c:if>
									</c:if>
									<c:if test="${hh == 12 }">
										<option value="${hh }">오후  ${hh }시</option>
									</c:if>
									<c:if test="${hh < 12 }">
										<c:if test="${hh < 10 }">
											<option value="${hh }">오전  0${hh }시</option>
										</c:if>	
										<c:if test="${hh >= 10 }">
											<option value="${hh }">오전  ${hh }시</option>
										</c:if>
										
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="col-sm-2">
							<select name="ttEndtime_MM" class="form-control col-sm-2">
								<c:forEach begin="00" end="50" var="MM" step="10">
									<c:if test="${MM == 0 }">
										<option value="${MM }">00분</option>
									</c:if>
									<c:if test="${MM != 0 }">
										<option value="${MM }">${MM}분</option>
									</c:if>
								</c:forEach>
							</select>
						</td>
						<td class="">
							<button type="button" class="btn btn-default removeTimetable" > x </button>
						</td>
		    		</tr>
		        </c:forEach>
		    		
		    	</table>
		    </div>
		     <div class="col-sm-1">
		     	<button type="button" class="btn btn-primary" id="addTimetable"> + </button>
		     </div>
		</div>
		</div>
		
		<div class="row">
		<div class="form-group">
			<label class="col-sm-1 control-label">수업기간</label>
			<div class="col-sm-5">
				<input class="form-control"  type="text" id="cStart" name="cStart" value="${course.cStartdate}">
			</div>
			<label class="col-sm-1 control-label">~</label>
			<div class="col-sm-5">
				<input class="form-control"  type="text" id="cEnd" name="cEnd" value="${course.cEnddate}">
			</div>
		</div>
		</div>
		
		
		<div class="row">
		<div class="form-group">
			<label  class="col-sm-1 control-label" for="classroom">교실</label>
			<div class="col-sm-11">
			<input class="form-control" type="text" id="classroom" name="classroom" value="${course.classroom}">
			</div>
		</div>
		</div>
		
		<div class="row">
		<div class="form-group">
			<label class="col-sm-1 control-label"  for="cContent">수업설명</label>
			<div class="col-sm-11">
			<textarea class="form-control" rows="10" cols="50" id="cContent" name="cContent">${course.content.cContent}</textarea>
			</div>
		</div>
		</div>	
		
		<div class="row">
		<div class="form-group">
		  	<label class="col-sm-1 control-label"  for="pics">수업이미지</label>
		  	<div class="col-sm-11">
			 <c:if test="${empty course.pictures}">
	                                            		
	         </c:if> 
	         <c:if test="${!empty course.pictures}">
	              <ul>
				     <c:forEach items="${course.pictures}" var="pic">
				         <c:if test="${!empty pic.cPicture }">
				             <li><img src="displayFile?filename=${pic.cPicture }"></li>
				         </c:if>
				     </c:forEach>
	               </ul>
               </c:if>
			</div>
		</div>
		</div>
	
		<div class="row">
		<div class="form-group" style="text-align : center">      
			<input type="submit" class=" btn btn-primary btn-lg" value="등록">
			<input type="reset" class=" btn btn-default btn-lg" value="취소">
		</div>
		</div>
	

		
	</form>
	</div>
	</div>
	
	
<%@ include file="../include/footer.jsp"%>	

<script>
		 
		 $(function() {
			 
			$("select[name='ttDay'] option").each(function(idx, obj) {
				$(obj).html(arrDay[$(obj).val()]);
				
			});
		})
	</script>