<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 수정</title>
<link rel="stylesheet" href="/css/update.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>	
	<h1>문서 수정 페이지</h1>
	
	<div class="top-link">
	  <a href="docView?documentNo=${document.documentNo}">문서 상세 페이지</a>
	</div>
	
	<div class="container">
		<form id="updateDocumentForm" action="/updateDocView" method="post">
			<input type="hidden" name="documentNo" value="${document.documentNo}">
			<table class="doc-table">
				<tr>
					<th>문서 번호</th>
					<td>${document.documentNo}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" id="documentTitle" name="documentTitle" value="${document.documentTitle}">
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="documentContent" name="documentContent" rows="5">${document.documentContent}</textarea>
					</td>
				</tr>
			</table>
			<br>
			<button type="button" id="updateBtn">수정하기</button>
		</form>
	</div>
	
	
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
