<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/page_header.jsp"%>
	<style>
		.keyword-form-none{
			display: none;
		}
		h3{
			margin-left : 0; 
		}
	</style>
	
	
	 <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"> 이번달 개설강의
                    <!-- <small>Subheading</small> -->
                </h1>
                <ol class="breadcrumb">
                    <li><a href="${pageContext.request.contextPath}">Home</a>
                    </li>
                    <li class="active">개설강의목록</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
	
        
        <div class="row">                      	
			<div class="col-lg-2">
				<select name="searchType" class="form-control">
					<option value="cName" ${cri.searchType=='cName'? 'selected' :'' } ${cri.searchType==null? 'selected' :'' }>강의명</option>
					<option value="subject" ${cri.searchType=='subject'? 'selected' :'' }>과목</option>
					<option value="teacher" ${cri.searchType=='teacher'? 'selected' :'' }>선생님</option>
					<option value="ttDay" ${cri.searchType=='ttDay'? 'selected' :'' }>요일</option>
					<option value="grade" ${cri.searchType=='grade'? 'selected' :'' }>학년</option>						
				</select>
			</div>	
			<div class="col-lg-3">
				<c:if test=" ${cri.searchType=='ttDay'}">								
					<select id="ttDay" class="form-control keyword-form keyword-form-none">
						<option value="1" ${cri.keyword=='1'? 'selected' :'' }>월</option>
						<option value="2" ${cri.keyword=='2'? 'selected' :'' }>화</option>
						<option value="3" ${cri.keyword=='3'? 'selected' :'' }>수</option>
						<option value="4" ${cri.keyword=='4'? 'selected' :'' }>목</option>
						<option value="5" ${cri.keyword=='5'? 'selected' :'' }>금</option>
						<option value="6" ${cri.keyword=='6'? 'selected' :'' }>토</option>
						<option value="0" ${cri.keyword=='0'? 'selected' :'' }>일</option>
					</select>
				</c:if>
				<%-- <c:if test=" ${cri.searchType=='ttDay'}">	 --%>
				<select id="gdNo" class="form-control keyword-form keyword-form-none">
					<c:forEach items="${studentGradeList }" var="grade">
						<option value="${grade.gdNo }" ${cri.keyword==grade.gdNo ? 'selected' :'' }>${grade.gdName }</option>
					</c:forEach>
				</select>
				<%-- </c:if>
				<c:if test=" ${cri.searchType=='subject'}">	 --%>
				<select id="sbNo" class="form-control  keyword-form keyword-form-none">
					<c:forEach items="${subjectList }" var="subject">
						<option value="${subject.sbNo }" ${cri.keyword==subject.sbNo ? 'selected' :'' }>${subject.sbName }</option>
					</c:forEach>
				</select>
			<%-- </c:if>
			<c:if test=" ${cri.searchType=='cName' || cri.searchType=='teacher' || cri.searchType==''}">	 --%>
				<input class="form-control col-md-3  keyword-form" id="keyword-input" type="text" value="${cri.keyword}">
			<%-- </c:if> --%>
		</div>	
			<button id="searchBtn" class="btn btn-default"><i class="fa fa-search"></i></button>
			<p></p>
		</div>
      <!-- search end -->


        <!-- ITEMS -->
        <c:forEach items="${listCourses }" var="course">         
        <div class="row">
            <div class="col-md-1 text-center">
            	<!-- 앞부분 아이콘 -->
                <p><i class="fa fa-list-alt   fa-4x"></i>
                </p>
                <p>${course.studentGrade.gdName }</p>
                <p>${course.subject.sbName }</p>
            </div>
            <div class="col-md-5">
                <a href="#" onclick="readCourse(${course.cNo })" class="c-${course.cNo }" data-cri="${pageMaker.makeSearch(cri.page) }">
                    <img class="img-responsive img-hover" src="http://placehold.it/600x300" alt="">
                </a>
            </div>
            <div class="col-md-6">
                <h3><a href="#" onclick="readCourse(${course.cNo })" class="c-${course.cNo }" data-cri="${pageMaker.makeSearch(cri.page) }">${course.cName }</a></h3>
                <p><a href="#"><i class="fa  fa-user"></i>  ${course.teacher.tName }</a></p>
                <c:if test="${empty course.timetables }">
					<p>시간미정</p>
				</c:if>
				<c:if test="${!empty course.timetables }">
					<c:forEach items="${course.timetables }" var="tt">
						<p>
						<c:choose>
					       <c:when test="${tt.ttDay == 0}">
					          <span class="ttDay label label-danger">${tt.ttDay }</span> 
					       </c:when>
					       <c:when test="${tt.ttDay == 6}">
					           <span class="ttDay label label-primary">${tt.ttDay }</span> 
					       </c:when>
					       <c:otherwise>
					           <span class="ttDay label label-default">${tt.ttDay }</span> 
					       </c:otherwise>
						  </c:choose>	
								${tt.ttStarttime }시 ~ ${tt.ttEndtime }시 
						</p>
					</c:forEach>
				</c:if>
                
                
                <a class="btn btn-primary" href="#" onclick="readCourse(${course.cNo })" class="c-${course.cNo }" data-cri="${pageMaker.makeSearch(cri.page) }">
                	MORE <i class="fa fa-angle-right  "></i></a> 
            </div>
        </div>

        <hr>
        </c:forEach>
        
        
       
                <div class="box-footer">
					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<!-- 이전 페이지 있을때만 표시 -->
								<li><a href="listCourses${pageMaker.makeSearch(pageMaker.startPage-1) }">&laquo;</a></li>
							</c:if>
							
							<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
								<li ${pageMaker.cri.page == idx? 'class=active' : '' } >
									<a href="listCourses${pageMaker.makeSearch(idx) }">${idx }</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next}">
								<!-- 이후 페이지 있을때만 표시 -->
								<li><a href="listCourses${pageMaker.makeSearch(pageMaker.endPage+1) }">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>
                
    

<%@ include file="../include/page_footer.jsp"%>

	<script>
	$(function() {
	//	$("select[name='searchType']").find("option").eq(0).prop("selected",true);
	//	alert($("select[name='searchType'] option:selected").val());
		changeInput($("select[name='searchType'] option:selected").val());
		
		$("#searchBtn").click(function() {
			var keyword=$(".keyword-form[name='keyword']").val();
			var searchType=$("select[name='searchType']").val();
			location.href="${pageContext.request.contextPath}/course/listCourses?searchType="+searchType+"&keyword="+keyword;
		});
		
		$("select[name='searchType']").change(function(e) {
			var searchType = $(this).val();
			changeInput(searchType);
		});
	});
	
	function changeInput(searchType){
		$(".keyword-form").attr("name", "");
		$(".keyword-form").addClass("keyword-form-none");
		if(searchType == 'cName' || searchType == 'teacher' ){
			$("#keyword-input").attr("name", "keyword");
			$("#keyword-input").removeClass("keyword-form-none");
		}else if(searchType == 'subject'){
			$("#sbNo").attr("name", "keyword");
			$("#sbNo").removeClass("keyword-form-none");
		}else if(searchType == 'grade'){
			$("#gdNo").attr("name", "keyword");
			$("#gdNo").removeClass("keyword-form-none");
		}else if(searchType == 'ttDay'){
			$("#ttDay").attr("name", "keyword");
			$("#ttDay").removeClass("keyword-form-none");
		}
	}
	
	
	function readCourse(cNo){
		var cri = $(".c-"+cNo).attr("data-cri");
		location.href="${pageContext.request.contextPath}/course/readCourse"+cri+"&cNo="+cNo;
	}
	
  	
    
    
    </script>
	
</script>

