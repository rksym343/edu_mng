<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">시험성적</h1>
</div>
</div>

	<div class="row">
		<table border="1">
			<thead>
				<tr>
					<th>평가번호</th>
					<th>수업명</th>
					<th>평가항목</th>
					<th>평가결과</th>
					<th>한마디</th>
				</tr>
			</thead>
			<tbody id="ttbody">
				
			</tbody>
		</table>
			
	
	</div>


<%@ include file="../include/footer.jsp"%>	

<script>
	var sId = "sss01";
	var cNo = 0;
$(function() {
	getMyExamRecord();
})
function getMyExamRecord(){
		$.ajax({
			// "exam/viewStudentExam/{sId}/{cNo}"
			url: "${pageContext.request.contextPath}/exam/viewStudentExam/"+sId+"/"+cNo,
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);
				$.each(data, function(i, v) {
					var trTag = 
						"<tr>"+
							"<td>"+v.eNo+"</td>"+
							"<td>"+v.course.cName+"</td>"+
							"<td>"+v.examItem.eiTitle+"</td>"+
							"<td>"+v.eResult+"</td>"+
							"<td>"+v.eMemo+"</td>"+						
						"</tr>";
					$("#ttbody").append(trTag);
				});
			}
			
				
		});
}
</script>