<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/header.jsp"%>
	<style>
		.keyword-form-none{
			display: none;
		}
		h3{
			margin-left : 0; 
		}
		.c-image{
			width : 600px;
			height : 300px;
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
					<select id="ttDay" class="form-control keyword-form keyword-form-none">
						<c:choose>
							<c:when test="${cri.searchType=='ttDay'}">
								<option value="1" ${cri.keyword=='1'? 'selected' :'' }>월</option>
								<option value="2" ${cri.keyword=='2'? 'selected' :'' }>화</option>
								<option value="3" ${cri.keyword=='3'? 'selected' :'' }>수</option>
								<option value="4" ${cri.keyword=='4'? 'selected' :'' }>목</option>
								<option value="5" ${cri.keyword=='5'? 'selected' :'' }>금</option>
								<option value="6" ${cri.keyword=='6'? 'selected' :'' }>토</option>
								<option value="0" ${cri.keyword=='0'? 'selected' :'' }>일</option>
							</c:when>
							<c:otherwise>
								<option value="1">월</option>
								<option value="2">화</option>
								<option value="3">수</option>
								<option value="4">목</option>
								<option value="5">금</option>
								<option value="6">토</option>
								<option value="0">일</option>
							</c:otherwise>
						</c:choose>
					</select>
				<select id="gdNo" class="form-control keyword-form keyword-form-none">
					<c:forEach items="${studentGradeList }" var="grade">
						<c:choose>
							<c:when test="${cri.searchType=='grade'}">
								<option value="${grade.gdNo }" ${cri.keyword==grade.gdNo? 'selected' :'' }>${grade.gdName }</option>
							</c:when>
							<c:otherwise>
								<option value="${grade.gdNo }">${grade.gdName }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				
				
				<select id="sbNo" class="form-control  keyword-form keyword-form-none">
					<c:forEach items="${subjectList }" var="subject">
						<c:choose>
							<c:when test="${cri.searchType=='subject'}">	
								<option value="${subject.sbNo }" ${cri.keyword==subject.sbNo? 'selected' :'' }>${subject.sbName }</option>
							</c:when>
							<c:otherwise>	
								<option value="${subject.sbNo }">${subject.sbName }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				
				<c:choose>
					<c:when test="${cri.searchType=='cName' || cri.searchType=='teacher'}">
						<input class="form-control col-md-3  keyword-form" id="keyword-input" type="text" value="${cri.keyword}">
					</c:when>
					<c:otherwise>
						<input class="form-control col-md-3  keyword-form" id="keyword-input" type="text" value=""> 
					</c:otherwise>
				</c:choose> 
		</div>	
			<button id="searchBtn" class="btn btn-default"><i class="fa fa-search"></i></button>
			<p></p>
		</div>
      <!-- search end -->

		
		<c:if test="${fn:length(listCourses) == 0}">
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-muted" style="text-align: center; height: 500px; line-height: 500px;">데이터 없음</h3>
				</div>
			</div>
		</c:if> 
		
		
        <!-- ITEMS -->
        <c:if test="${fn:length(listCourses) != 0}">
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
                <a href="#" 
                	onclick="readCourse(${course.cNo })" class="c-${course.cNo }"> 
                <%-- 	data-cri="${pageMaker.makeSearch(cri.page) }"> --%>
                	<c:if test="${!empty course.pictures[0].cPicture}">
	                    <img class="img-responsive img-hover c-image" 
	                    	src="${pageContext.request.contextPath}/file/displayFile?filename=${course.pictures[0].cPicture }" alt="">
                    </c:if>
                    <c:if test="${empty course.pictures}">
	                    <img class="img-responsive img-hover c-image" 
	                    	src="http://placehold.it/600x300" alt="">
                    </c:if>
                </a>
            </div>
            <div class="col-md-6">
                <h3><a href="#" onclick="readCourse(${course.cNo })" class="c-${course.cNo }" >${course.cName }</a></h3>
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
                
                
                <%-- <a class="btn btn-primary" href="#" onclick="readCourse(${course.cNo })" class="c-${course.cNo }" data-cri="${pageMaker.makeSearch(cri.page) }">
                	MORE <i class="fa fa-angle-right  "></i></a>  --%>
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
              
        </c:if>  
        
        <form id="f2" action="readCourse" role="form" method="get">
        	<input type="hidden" name="cNo" value="">
			<input type="hidden" name="page" value=${cri.page }>
			<input type="hidden" name="perPageNum" value=${cri.perPageNum }>
			<input type="hidden" name="searchType" value=${cri.searchType }>
			<input type="hidden" name="keyword" value=${cri.keyword }>
			<input type="hidden" name="fromListPage" value="true">					
		</form>
    

<%@ include file="../include/footer.jsp"%>

	<script>
	$(function() {
	//	$("select[name='searchType']").find("option").eq(0).prop("selected",true);
	//	alert($("select[name='searchType'] option:selected").val());
		changeInput($("select[name='searchType'] option:selected").val());
		
		$("#searchBtn").click(function() {
			var searchType=$("select[name='searchType']").val();
			var keyword=$(".keyword-form[name='keyword']").val();
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
		//var cri = $(".c-"+cNo).attr("data-cri");
		//var cri = ${cri};
		//var url = "?cNo="+cNo+"&fromListPage=true";
		//if()
		//location.href="${pageContext.request.contextPath}/course/readCourse"+cri+"&cNo="+cNo+"&fromListPage=true";
		$("input[name='cNo']").val(cNo);
		$("#f2").submit();
	}
	
  	
    
    
    </script>
	
</script>

