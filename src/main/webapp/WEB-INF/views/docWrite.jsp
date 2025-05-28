<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>문서 작성</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <h2>문서 작성</h2>
    <p>작성자: ${sessionScope.loginName}</p>

    <form:form method="post" id="docForm" action="/writeDocument" modelAttribute="document">
        제목: <form:input path="documentTitle" /><br/>
        내용: <form:textarea path="documentContent" /><br/>
        <input type="submit" id="submitBtn" value="작성하기"/>
    </form:form>
    <script>
        // 버튼 한 번 누르면 비활성하게
	    $('#docForm').on('submit', function(e){
	        $('#submitBtn').attr('disabled', true);
	    });
    </script>
</body>
</html>
