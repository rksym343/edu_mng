<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp"%>

	<form action="" method="get">
		<label>출석예정</label><button>새로고침</button>
		<div>
			<ul>
				<c:forEach var="student" items="">
					<li>
						학생아이디
						학생이름/학교/학년
						등원예정시간
						전화번호
						<button>등원</button> 인설트 됨
					</li>
				</c:forEach>
			</ul>
		</div>
	</form>
	
	<label>출석확인</label>
	<div>
		<ul>
			<c:forEach var="student" items="">
				<li>
					학생아이디
					학생이름/학교/학년
					전화번호
					<button>취소</button> 삭제됨
				</li>
			</c:forEach>
		</ul>
	</div>
<%@ include file="../include/footer.jsp"%>	