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
	background: transparent;
	border: none;
	color: transparent;
	cursor: pointer;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: bold;
	transition: color 0.3s ease;
}

.sign-link:hover {
	color: rgba(0, 0, 0, 0.6);
}

.status-box {
	position: relative;
	width: 60px;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
}

.status-box .triangle {
	position: absolute;
	top: -22px;
	font-size: 80px;
	color: transparent;
	-webkit-text-stroke: 1.5px orange;
	z-index: 1;
}

.status-box .xmark {
	position: absolute;
	top: -10px;
	font-size: 70px;
	color: transparent;
	-webkit-text-stroke: 2px red;
	opacity: 0.4;
	z-index: 1;
	pointer-events: none;
	font-family: Arial, sans-serif;
}

.status-box .text {
	font-size: 25px;
	position: absolute;
	top: 28px;
	color: orange;
	z-index: 2;
}

.status-box.reject .text {
	top: 23px;
	color: red;
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
				<td width="50" height="20" align="center">결재 2</td>
				<td width="50" height="20" align="center">결재 1</td>
			</tr>
			<tr>
				<td width="80" height="80" align="center">
					${document.employeeName}
				</td>
				<td width="80" height="80" align="center">
					<c:choose>
						<c:when test="${sign.signStatusLv2 == '보류'}">
							<div class="status-box">
								<div class="triangle">&#9651;</div>
								<div class="text">보류</div>
							</div>
						</c:when>
						<c:when test="${sign.signStatusLv2 == '거절'}">
							<div class="status-box reject">
								<div class="xmark">&#10005;</div>
								<div class="text">거절</div>
							</div>
						</c:when>
						<c:when test="${not empty sign.fileNameLv2}">
							<img src="${sign.fileNameLv2}" width="60px" />
						</c:when>
						<c:otherwise>
							<form action="/level2/signLevel2" method="get">
								<input type="hidden" name="documentNo" value="${document.documentNo}">
								<button type="submit" id="sign-linkLevel2" class="sign-link">서명</button>
							</form>
						</c:otherwise>
					</c:choose>
				</td>
				<td width="80" height="80" align="center">
					<c:choose>
						<c:when test="${sign.signStatusLv1 == '보류'}">
							<div class="status-box">
								<div class="triangle">&#9651;</div>
								<div class="text">보류</div>
							</div>
						</c:when>
						<c:when test="${sign.signStatusLv1 == '거절'}">
							<div class="status-box reject">
								<div class="xmark">&#10005;</div>
								<div class="text">거절</div>
							</div>
						</c:when>
						<c:when test="${not empty sign.fileNameLv1}">
							<img src="${sign.fileNameLv1}" width="60px" />
						</c:when>
						<c:otherwise>
							<form action="/level1/signLevel1" method="get">
								<input type="hidden" name="documentNo" value="${document.documentNo}">
								<button type="submit" id="sign-linkLevel1" class="sign-link">서명</button>
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

<!-- 본인이 작성한 글이면서 상태가 대기일 경우만 수정/삭제 -->
<c:if test="${sessionScope.loginEmployee.employeeId == document.employeeId 
	and document.documentStatus == '대기'}">
	<a href="/updateDocView?documentNo=${document.documentNo}">수정하기</a>
	<a href="#" id="deleteDocumentLink">삭제하기</a>
	<form id="deleteDocumentForm" action="/deleteDocView" method="post" style="display:none">
		<input type="hidden" name="documentNo" value="${document.documentNo}">
	</form>
</c:if>

<a href="/docList" style="color: purple; text-decoration: underline;">목록으로 돌아가기</a>
<div style=" text-align: right; width: 600px;">
	<button onclick="location.href='/docList'" style="color: purple; border: 1px solid black;">저장</button>
</div>

 <c:if test="${loginEmployee.employeeLevel == 'level1'}">
 	<a href="/level1/level1List">lv1미결재 문서목록으로</a>
 </c:if>
 <c:if test="${loginEmployee.employeeLevel == 'level2'}">
 	<a href="/level2/level2List">lv2미결재 문서목록으로</a>
 </c:if>

<!-- 조건부 서명 차단 Script -->
<script>
	const employeeLevel = '${sessionScope.employeeLevel}';
	const statusLv2 = '${sign.signStatusLv2}';
	
	console.log("employeeLevel" , employeeLevel);
	console.log("statusLv2" , statusLv2)
	$('#sign-linkLevel2').click(function () {
		if (employeeLevel !== 'level2') {
			alert('접근권한이 없습니다.');
			return false;
		}
	});

	$('#sign-linkLevel1').click(function () {
		if (statusLv2 === '보류' || statusLv2 === '거절' || statusLv2 === '대기' || statusLv2 === '') {
			alert('현재는 결재가 불가능합니다.');
			return false;
		}
		if (employeeLevel !== 'level1') {
			alert('접근권한이 없습니다.');
			return false;
		}
	});

	$('#deleteDocumentLink').click(function(e) {
		e.preventDefault();
		if(confirm('정말 삭제하시겠습니까?')) {
			$('#deleteDocumentForm').submit();
		}
	});
</script>

</body>
</html>
