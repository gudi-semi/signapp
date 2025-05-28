<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<html>
<head>
<title>문서 목록</title>
</head>
<body>
	<h2>문서 목록</h2>
	<table border="1">
		<tr>
			<th>문서 번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>진행 상태</th>
		</tr>
		<c:forEach var="doc" items="${documentList}">
			<tr>
				<td>${doc.documentNo}</td>
				<td><a href="docView?documentNo=${doc.documentNo}">
						${doc.documentTitle} </a></td>
				<td>${doc.employeeName}</td>
				<td><c:if test="${doc.documentStatus == '대기'}">⏳ 대기</c:if> <c:if
						test="${doc.documentStatus == '승인'}">✅ 승인</c:if> <c:if
						test="${doc.documentStatus == '거절'}">❌ 거절</c:if> <c:if
						test="${doc.documentStatus == '진행중'}">🕒 진행중</c:if> <c:if
						test="${doc.documentStatus == '보류'}">⏸️ 보류</c:if></td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<c:if test="${page.lastPage > 1}">
		<div style="margin-top: 20px;">
			<c:forEach var="i" begin="1" end="${page.lastPage}">
				<c:choose>
					<c:when test="${i == page.currentPage}">
						<span style="font-weight: bold; color: green;">[${i}]</span>
					</c:when>
					<c:otherwise>
						<a
							href="/docList?currentPage=${i}&rowPerPage=${page.rowPerPage}&searchOption=${page.searchOption}&searchWord=${page.searchWord}">[${i}]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
	</c:if>
	<!-- 검색 -->
	<form method="get" action="/docList" style="margin-top: 10px;">
		<select name="searchOption" id="searchOption">
			<option value="all">전체</option>
			<option value="title">제목</option>
			<option value="user">사용자</option>
			<option value="status">진행 상태</option>
		</select> <input type="text" name="searchWord" id="searchWord" value="${page.searchWord}">
		<button type="submit">검색</button>
	</form>
</body>
</html>
