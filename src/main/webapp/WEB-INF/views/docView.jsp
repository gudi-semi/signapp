<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 상세보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	cursor: pointer;
}

.sign-link:hover {
	color: black;
}
</style>
</head>
<body>

	<h2 style="text-align: center;">문서 상세보기</h2>

	<div class="container">

		<!-- 서명 버튼 테이블 -->
		<div class="approval-wrapper">
			<table border="1">
				<tr>
					<td width="50" height="20" align="center">작성자</td>
					<td width="50" height="20" align="center">결재 1</td>
					<td width="50" height="20" align="center">결재 2</td>
				</tr>
				<tr>
				<td width="80" height="80" align="center">
						${document.employeeName}
				</td>
					<td width="80" height="80" align="center">
					    <c:choose>
					        <c:when test="${not empty sign.fileNameLv1}">
					            <img src="${sign.fileNameLv1}" width="60px" />
					        </c:when>
					        <c:otherwise>
					            <form action="/signLevel1" method="get">
					                <input type="hidden" name="documentNo" value="${document.documentNo}">
					                <button type="submit" id="sign-linkLevel1" class="sign-link">서명</button>
					            </form>
					        </c:otherwise>
					    </c:choose>
					</td>
					<td width="80" height="80" align="center">
				    <c:choose>
				        <c:when test="${not empty sign.fileNameLv2}">
				            <img src="${sign.fileNameLv2}" width="60px" />
				        </c:when>
				        <c:otherwise>
				            <form action="/signLevel2" method="get">
				                <input type="hidden" name="documentNo" value="${document.documentNo}">
				                <button type="submit" id="sign-linkLevel2" class="sign-link">서명</button>
				            </form>
				        </c:otherwise>
				    </c:choose>
				</td>
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
				<th height="100" align="left">내용:</th>
				<td valign="top">${document.documentContent}</td>
			</tr>
		</table>

	</div>
	

	<!-- 본인이 작성한 글인 경우 and 결재 진행하기 전인 경우에만 수정 및 삭제 가능 -->
	<c:if test="${sessionScope.loginEmployee.employeeId == document.employeeId 
				and document.documentStatus == '대기'}">
	
		<!-- 수정 / 삭제 -->
		<a href="/updateDocView?documentNo=${document.documentNo}">수정하기</a>
		<a href="#" id="deleteDocumentLink">삭제하기</a> <!-- href="#" : 임시 링크 역할 -->
	
		<form id="deleteDocumentForm" action="/deleteDocView" method="post" style="display:none">
			<input type="hidden" name="documentNo" value="${document.documentNo}"></input>
		</form>
	</c:if>

	<br><br>
	<div style="display: flex; justify-content: space-between; align-items: center; margin-top: 20px;"> <!-- 돌아가기, 완료 가로로 배치 // 양끝으로 배치 -->
  <a href="/docList" style="color: purple; text-decoration: underline;">목록으로 돌아가기</a>
  
  <button onclick="location.href='/docList'" style="color: purple; border: 1px solid black;">완료</button>
</div>


	<script>
		const employeeLevel = '${sessionScope.employeeLevel}';
		
	    $('#sign-linkLevel2').click(function () {
	        if (employeeLevel !== 'level2') {
	            alert('접근권한이 없습니다.');
	            return false;
	        }
	    });
	    
	    $('#sign-linkLevel1').click(function () {
	        if (employeeLevel !== 'level1') {
	            alert('접근권한이 없습니다.');
	            return false;
	        }
	    });
	
	    <!-- 삭제 -->
		$('#deleteDocumentLink').click(function(e) {
			e.preventDefault(); // 기본 동작 막기 -> 링크처럼(href="#") 동작하지 않도록 차단
			if(confirm('정말 삭제하시겠습니까?')) { // [확인], [취소]
				$('#deleteDocumentForm').submit();
			}
		});
	</script>
</body>
</html>
