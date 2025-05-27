<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
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
                <td>
	                <a href="docView?documentNo=${doc.documentNo}">
	                	${doc.documentTitle}
                	</a>
                </td>
                <td>${doc.employeeName}</td>
                <td>
                	<c:if test="${doc.documentStatus == '대기'}">⏳ 대기</c:if>
                	<c:if test="${doc.documentStatus == '승인'}">✅ 승인</c:if>
                	<c:if test="${doc.documentStatus == '거절'}">❌ 거절</c:if>
                	<c:if test="${doc.documentStatus == '보류'}">⏸️ 보류</c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
