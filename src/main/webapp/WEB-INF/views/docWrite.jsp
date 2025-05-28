<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>문서 작성</title>
    <link rel="stylesheet" href="/css/write.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>	
</head>
<body>
    <h1>문서 작성</h1>

	<div class="return-link">
	  <a href="/login">돌아가기</a>
	</div>

	<div class="form-container">
	    <form:form method="post" id="docForm" action="/writeDocument" modelAttribute="document">
	    	<p>작성자: ${sessionScope.loginName}</p>
	        제목 <form:input path="documentTitle" /><br/>
	        내용 <form:textarea path="documentContent" /><br/>
	        <input type="submit" id="submitBtn" value="작성하기"/>
	    </form:form>
    </div>
    <script>
        // 버튼 한 번 누르면 비활성하게
	    $('#docForm').on('submit', function(e){
            const title = $('input[name="documentTitle"]').val().trim();
            const content = $('textarea[name="documentContent"]').val().trim();

            if(title === '') {
                alert('제목을 작성해주세요.');
                e.preventDefault();
                $('#submitBtn').attr('disabled', false);
                return false;
            }
            if(content === '') {
                alert('내용을 작성해주세요.');
                e.preventDefault();
                $('#submitBtn').attr('disabled', false);
                return false;
            }
            $('#submitBtn').attr('disabled', true);
        });
    </script>
</body>
</html>
