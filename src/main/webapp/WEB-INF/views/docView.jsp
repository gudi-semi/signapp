<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 상세보기</title>
<style>
.container {
	width: 600px;
}

.approval-wrapper {
	display: flex;
	justify-content: flex-end;
	margin-bottom: 10px;
}

.doc-table {
	width: 100%;
}

.sign-link {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	height: 100%;
	color: gray;
	text-decoration: none;
	font-weight: bold;
}

.sign-link:hover {
	color: black; /* 마우스 오버시 색 바뀌게 (선택사항) */
}
</style>
</head>
<body>

	<h2 style="text-align: center;">문서 상세보기</h2>

	<div class="container">

		<div class="approval-wrapper">
			<table border="1">
				<tr>
					<td width="50" height="20" align="center">결재 2</td>
					<td width="50" height="20" align="center">결재 1</td>
				</tr>

				<tr>
					<td width="80" height="80" align="center"><a
						href="/signLevel2" class="sign-link">서명</a></td>
					<td width="80" height="80" align="center"><a
						href="/signLevel1" class="sign-link">서명</a></td>
				</tr>
			</table>
		</div>

		<!-- 문서 내용 테이블 -->
		<table class="doc-table" border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th width="100" height="40" align="left">문서 번호:</th>
				<td>${document.documentNo}</td>
			</tr>
			<tr>
				<th height="40" align="left">제목:</th>
				<td>${document.documentTitle}</td>
			</tr>
			<tr>
				<th height="40" align="left">작성자:</th>
				<td>${document.employeeName}</td>
			</tr>
			<tr>
				<th height="100" align="left">내용:</th>
				<td valign="top">${document.documentContent}</td>
			</tr>
		</table>
		<a>결재2</a>

		<form action="/signLevel2" method="post">

			<input type="hidden" name="documentNo" value="${document.documentNo}">
			<input type="hidden" name="filename" value="서명이미지.png">
			<!-- 예시 -->
			<input type="hidden" name="approverId"
				value="${sessionScope.loginEmployee.approverId}" /> <label>결재
				2 상태:</label> <select name="signStatusLv2">
				<option value="결재">대기</option>
				<option value="거절">거절</option>
				<option value="승인">승인</option>
				<option value="보류">보류</option>
			</select> <br>
			<br> <input type="hidden" name="signImage" id="signImage">

			<button type="submit">결재하기</button>
		</form>

			<!-- 결제 2 끝  -->

		<!-- 결재1 -->
		<form action="/signLevel1" method="post">

			<input type="hidden" name="documentNo" value="${document.documentNo}">
		
			<!-- 예시 -->
			<input type="hidden" name="approverId"
				value="${sessionScope.loginEmployee.approverId}" /> <label>결재
				2 상태:</label> <select name="signStatusLv2">
				<option value="결재">대기</option>
				<option value="거절">거절</option>
				<option value="승인">승인</option>
				<option value="보류">보류</option>
			</select>

			<button type="submit">결재하기</button>

		
		</form>
		<!-- 결제 1 끝  -->

	</div>


	<br>
	<br>
	<a href="/docList">목록으로 돌아가기</a>

</body>
</html>