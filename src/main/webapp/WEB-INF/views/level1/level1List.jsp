<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp"%>
<html>
<head>
<title>lv1 미결재 문서 목록</title>
<link rel="stylesheet" href="/css/list.css">
</head>
<body>
	<h2>lv1 미결재 문서 목록</h2>
	<table class="document-table">
		<tr>
			<th>문서 번호</th>
			<th>제목</th>
			<th>작성자</th>
		</tr>
		<c:forEach var="doc" items="${documentList}">
			<tr>
				<td>${doc.documentNo}</td>
				<td><a href="${pageContext.request.contextPath}/docView?documentNo=${doc.documentNo}">
						${doc.documentTitle} </a></td>
				<td>${doc.employeeName}</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이징 -->
	<c:if test="${page.lastPage > 1}">
    <div style="margin-top: 20px;">
        <c:if test="${startPage > 1}">
            <a href="/level1/level1List?currentPage=${startPage - 1}&rowPerPage=${page.rowPerPage}&searchOption=${page.searchOption}&searchWord=${page.searchWord}">[이전]</a>
        </c:if>

        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <c:choose>
                <c:when test="${i == page.currentPage}">
                    <span style="font-weight: bold; color: green;">[${i}]</span>
                </c:when>
                <c:otherwise>
                    <a href="/level1/level1List?currentPage=${i}&rowPerPage=${page.rowPerPage}&searchOption=${page.searchOption}&searchWord=${page.searchWord}">[${i}]</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${endPage < page.lastPage}">
            <a href="/level1/level1List?currentPage=${endPage + 1}&rowPerPage=${page.rowPerPage}&searchOption=${page.searchOption}&searchWord=${page.searchWord}">[다음]</a>
        </c:if>
    </div>
</c:if>
	<!-- 검색 -->
	<form method="get" action="/level1/level1List" style="margin-top: 10px;">
		<select name="searchOption" id="searchOption">
			<option value="all">전체</option>
			<option value="title">제목</option>
			<option value="user">사용자</option>
		</select> <input type="text" name="searchWord" id="searchWord" value="${page.searchWord}">
		<button type="submit">검색</button>
	</form>
</body>
</html>
