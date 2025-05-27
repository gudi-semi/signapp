<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
<script>
	$(document).ready(function () {
		// 캔버스에 사인 후 객체로 받는 SignaturePad 생성자
		// SignaturePad API설명은 https://github.com/szimek/signature_pad 페이지 readme파일 API부분참고
		const signaturePad = new SignaturePad($('canvas')[0], {
			minWidth: 2,
			maxWidth: 2,
			penColor: '#000000'
		});
		
		// 캔버스 내용을 초기화하는 SignaturePad API clear()메서드
		$('#btnClear').click(function () {
			signaturePad.clear();
		});
		
		// AJax로 SignaturePad객체안 사인이미지를 서버로 전송
	('#btnSign').click(function () {
	if (signaturePad.isEmpty()) {
		alert('사인을 먼저 해 주세요');
	} else {
		// 사인 이미지와 문서 번호, 결재자 ID를 포함하여 전송
		$.ajax({
			async: true,
			url: '/signLevel2',
			type: 'post',
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
			data: {
				approverId: $('#approverId').val(),       // 결재자 ID
				fileName: signaturePad.toDataURL(),      // 서명이미지 
				signStatusLv2: $('#signStatusLv2').val()  // 결재 상태 
			}
		}).done(function (data) {
			alert(data); // 예: '결재 완료'
			signaturePad.clear();
			location.href = '/docList'; // 결재 후 문서 리스트로 이동
		}).fail(function () {
			alert('결재 실패');
		});
	}
});
	
	
</script>

</head>
<body>
	<h1>level2</h1>
	<!-- id : 사인 레벨이 되는 로그인 사용자 id -->
	<div id="id">manager</div> <!-- <input id ="id" type="text" value="manage"> -->
	<canvas style="border: 1px solid #FF0000;"></canvas>
	<br>
	<button type="button" id="btnClear">지우기</button>
	<button type="button" id="btnSign">결제하기</button>
</body>
</html>
