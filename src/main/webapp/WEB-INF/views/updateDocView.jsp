<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.doc-table {
	width: 80%;
}
</style>
</head>
<body>
	<h2>문서 수정 페이지</h2>
	<form id="updateDocumentForm" action="/updateDocView" method="post">
		<input type="hidden" name="documentNo" value="${document.documentNo}">
		<table class="doc-table" border="1" cellpadding="10" cellspacing="0">
			<tr>
				<th width="100" height="40" align="left">문서 번호:</th>
				<td>${document.documentNo}</td>
			</tr>
			<tr>
				<th height="40" align="left">제목:</th>
				<td>
					<input type="text" id="documentTitle" name="documentTitle" value="${document.documentTitle}" style="width: 400px;">
				</td>
			</tr>
			<tr>
				<th height="100" align="left">내용:</th>
				<td valign="top">
					<textarea id="documentContent" name="documentContent" rows="5" cols="60">${document.documentContent}</textarea>
				</td>
			</tr>
		</table>
		<br>
		<button type="button" id="updateBtn">수정하기</button>
	</form>
	
	
	<script>
		const title = $('#documentTitle');
		const content = $('#documentContent');
			
		$('#updateBtn').click(function() {
	
			// 유효성 검사
			if(title.val() == '') {
				alert('제목을 입력하세요');
				return;
			}
			
			if(content.val() == '') {
				alert('내용을 입력하세요');
				return;
			}
			
			// 모든 검사를 통과하면 -> form 전송
			$('#updateDocumentForm').submit();
		});
	</script>
</body>
</html>
