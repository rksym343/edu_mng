<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
      <h1 class="page-header">메시지</h1>
</div>
</div>

	<div class="row">
		<div class="col-lg-3">
		<table border="1">
			<thead>
				<tr><th>발신자아이디</th>
					<th>메시지번호</th>
					<th>강의번호</th>
					<th>수신자아이디</th>
					<th>메시지 내용</th>
					<th>확인여부</th>
				</tr>
			</thead>
			<tbody id="ttbody">
				
			</tbody>
		</table>
			
		</div>
		<div class="col-lg-3">
		<table border="1">
			<thead>
				<tr><th>발신자아이디</th>
					<th>메시지번호</th>
					<th>강의번호</th>
					<th>수신자아이디</th>
					<th>메시지 내용</th>
					<th>확인여부</th>
				</tr>
			</thead>
			<tbody id="ttbody2">
				
			</tbody>
		</table>
			
		</div>
		<div class="col-lg-3">
		<table border="1">
			<thead>
				<tr><th>발신자아이디</th>
					<th>메시지번호</th>
					<th>강의번호</th>
					<th>수신자아이디</th>
					<th>메시지 내용</th>
					<th>확인여부</th>
				</tr>
			</thead>
			<tbody id="ttbody3">
				
			</tbody>
		</table>
			
		</div>
	</div>


<%@ include file="../include/footer.jsp"%>	

<script>
	var memberType = "student";
	var id = "sss01";
$(function() {
	getMyMsg();
})
function getMyMsg(){
		$.ajax({
			// "/message/listMsg/{memberType}/{id}"
			url: "${pageContext.request.contextPath}/message/listMsg/"+memberType+"/"+id,
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);
				$("#ttbody").html("");
				$.each(data, function(i, v) {
					var memId = v.sId =! null ? v.sId : v.spId;
					var isCh = v.isChecked != 0? "true":"false";
					var trTag = 
						"<tr>"+
							"<td>"+v.tId+"</td>"+
							"<td>"+v.msgNo+"</td>"+
							"<td>"+v.cNo+"</td>"+
							"<td>"+memId+"</td>"+
							"<td>"+v.msgContent+"</td>"+
							"<td>"+isCh+"</td>"+						
						"</tr>";
					$("#ttbody").append(trTag);
				});
			}
			
				
		});
		$.ajax({
			// "/message/listMsg/{memberType}/{id}"
			url: "${pageContext.request.contextPath}/message/listMsg/"+memberType+"/"+"sss02",
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);		
				$("#ttbody2").html("");
				$.each(data, function(i, v) {
					var memId = v.sId =! null ? v.sId : v.spId;
					var isCh = v.isChecked != 0? "true":"false";
					var trTag = 
						"<tr>"+
						"<td>"+v.tId+"</td>"+
							"<td>"+v.msgNo+"</td>"+
							"<td>"+v.cNo+"</td>"+
							"<td>"+memId+"</td>"+
							"<td>"+v.msgContent+"</td>"+
							"<td>"+isCh+"</td>"+						
						"</tr>";
					$("#ttbody2").append(trTag);
				});
			}
			
				
		});
		$.ajax({
			// "/message/listMsg/{memberType}/{id}"
			url: "${pageContext.request.contextPath}/message/listMsg/"+"parents"+"/"+"sp01",
			type : "get",
			dataType: "json",
			success:function(data){
				console.log(data);		
				$("#ttbody3").html("");
				$.each(data, function(i, v) {
					var memId = v.sId =! null ? v.sId : v.spId;
					var isCh = v.isChecked != 0? "true":"false";
					var trTag = 
						"<tr>"+
						"<td>"+v.tId+"</td>"+
							"<td>"+v.msgNo+"</td>"+
							"<td>"+v.cNo+"</td>"+
							"<td>"+memId+"</td>"+
							"<td>"+v.msgContent+"</td>"+
							"<td>"+isCh+"</td>"+						
						"</tr>";
					$("#ttbody3").append(trTag);
				});
			}
			
				
		});
}
</script>