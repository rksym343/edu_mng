<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

<label>출석예정</label><button>+</button>
<div>
	<ul>
		<c:forEach var="student" items="">
			<li>
				출석된 리스트에서만 불러오기
			
				학생아이디
				학생이름/학교/학년
				전화번호
				<button>하원</button> 업데이트 됨
			</li>
		</c:forEach>
	</ul>
</div>

<label>출석확인</label>
<div>
	<ul>
		<c:forEach var="student" items="">
			<li>
				학생아이디
				학생이름/학교/학년
				전화번호
				<button>취소</button> 업데이트 값을 기본값으로 다시 세팅
			</li>
		</c:forEach>
	</ul>
</div>
<%@ include file="../include/footer.jsp"%>	