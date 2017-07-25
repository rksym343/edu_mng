<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../include/header.jsp"%>
<div class="col-lg-12">
	<h1 class="page-header">장바구니</h1>
</div>
</div>
<!-- div row -->

<style>
	.right-btns{
		text-align: left;	
			
	}
	.right-btns button{
		margin : 10px 0 10px 10px;
	}
	.center-btns{
		text-align: center;
		padding : 30px;
	}
	.table th, td{
		text-align: center;
	}
	
	.money{
		text-align: right;
		padding: 10px;
	}
	
</style>

<div class="row right-btns">	
	<button id="checkAll" class="btn btn-default">전체선택</button>
	<button id="deleteCart" class="btn btn-default">선택삭제</button>
</div>
<div class="row">
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-hover">
					<thead>
						<tr>							
							<th></th>
							<th>강의번호</th>
							<th>강의명</th>
							<th>강의료</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="cart">
							<c:forEach items="${cart.courses }" var="course">
								<tr class="cart-item">
									<td class="col-md-1"><input type="checkbox" name="ccNo" value="${cart.ccNo }" data-cNo="${course.cNo }"></td>
									<td class="col-md-1">${course.cNo }</td>
									<td class="col-md-5">${course.cName }</td>
									<td class="col-md-3 tuition money" data-tuition="${course.tuition }">${course.tuition }</td>
									<td class="col-md-3">
									<%-- 	<fmt:formatDate value="${course.cStartdate }" pattern="yyyy-MM-dd" /> --%>
									</td>								
								</tr>
							</c:forEach>
						</c:forEach>
						<tr id="total">
						</tr>
					</tbody>
				</table>
			</div>
			<!-- /.table-responsive -->
		</div>
		<!-- /.panel-body -->
	</div>
	<!-- /.panel -->
</div>

<table border='1'>
	<tr>

	</tr>

</table>

<div class="row center-btns">		
	<form action="cartCourses" method="POST" id="f1">
		<input type="hidden" name="memberType" value=${memberType }>
		<input type="hidden" name="id" value=${memberId }>
		<button type="button" id="payCourses" class="btn btn-primary btn-lg">결제하기</button>
	</form>
</div>

<%@ include file="../include/footer.jsp"%>
<script>
$(function() {
	prnSum();
	prnMoney();
	
	$("#checkAll").click(function() {
		if($(this).html()=="전체선택"){
			$("input[name='ccNo']").prop('checked', true);
			$(this).html("전체해제");			
		}else{
			$("input[name='ccNo']").prop('checked', false);
			$(this).html("전체선택");	
		}
	});
	
	$("#deleteCart").click(function() {
		if(confirm("선택된 강좌를 삭제하시겠습니까?")){
		$("input[name='ccNo']:checked").each(function(i, obj) {
			var ccNo = $(obj).val();
			$.ajax({
				url: "${pageContext.request.contextPath}/cart/cartCourses/"+ccNo,
				type : "DELETE",
				dataType : "text",
				success: function(data) {
					console.log(data);
					if(data=="SUCCESS"){
						$(obj).parent().parent().remove();
						prnSum();
						prnMoney();
					}
				}
			});
			prnSum();
		});
		}
	});
	
	$("#payCourses").click(function() {
		$(".cart-item input[name='ccNo']:checked").each(function(i, obj) {
			$("#f1").append("<input type='hidden' name='cNo' value='"+$(obj).attr("data-cNo")+"'>");
		});
		$("#f1").submit();
	});
	
});

function prnSum(){
	var sum = 0;
	var cnt = 0;
	$(".tuition").each(function(i, obj) {
		var tuition = Number($(obj).attr("data-tuition"));
		sum = sum + tuition;
		cnt++;
	});	
	$("#total").html(
			"<td>총계 : </td>"
			+"<td colspan='2'>신청강의수 : "+cnt+"개</td>"
			//+"<td>"+cnt+"</td>"
			+"<td colspan='2'>총 강의료: <span class='money'>"+sum+"</span></td>"
			//+"<td>"+sum+"</td>"
			);
}

function prnMoney(){
	$(".money").each(function(i, obj) {
		var money = $(obj).html();
		var prnMoney = Number(money).toLocaleString('en').split(".")[0]+"원";
		$(obj).html(prnMoney);
	});
}

	
</script>