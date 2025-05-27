<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서명 레벨1</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
<script>
    $(document).ready(function () {
        const signaturePad = new SignaturePad($('canvas')[0], {
            minWidth: 2,
            maxWidth: 2,
            penColor: '#000000'
        });
		
    	// 처음 상태: 결재 상태가 "승인"이 아니면 숨기기
        if ($('#signStatusLv1').val() !== '승인') {
            $('canvas').hide();
        }

        // select 값이 변경될 때 canvas 보이기/숨기기
        $('#signStatusLv1').change(function () {
            if ($(this).val() === '승인' ) {
                $('canvas').show();
            } else {
                $('canvas').hide();
            }
        });
        
        $('#btnClear').click(function () {
            signaturePad.clear();
        });
        
        // 확인 버튼()
        $('#btnSign').click(function () {
            const status = $('#signStatusLv1').val();
        // 승인일 때만 사인 여부 검사, 거절,보류 선택시 경고창 안뜨게
	    if (status === '승인' || status === '대기' && signaturePad.isEmpty()) {
	        alert('사인을 먼저 해 주세요');
	        return;
	    }
            	$.ajax({
            	    async: true,
            	    url: '/signLevel1',
            	    type: 'post',
            	    contentType: 'application/json; charset=UTF-8',
            	    data: JSON.stringify({
            	        documentNo: $('#documentNo').val(),
            	        approverName: "${sessionScope.loginName}",
            	        approverId : "${sessionScope.loginId}",
            	        fileNameLv1: signaturePad.toDataURL(),
            	        signStatusLv1: $('#signStatusLv1').val()
            	    })
            	}).done(function (data) {
            	    alert(data);
            	    signaturePad.clear();
            	    // 거절,보류 선택 후 확인 누르면 no값같이 넘기기위해
            	    location.href = '/docView?documentNo=' + $('#documentNo').val();
            	}).fail(function () {
            	    alert('결재 실패');
            	});

        });
    });
</script>
</head>
<body>
<h1>레벨 1 서명</h1>
<p>document2 : ${documentNo}</p>
<p>서명자: ${sessionScope.loginName}</p>
<p>id : ${sessionScope.loginId}</p>
<p>레벨 : ${sessionScope.employeeLevel }
<input type="hidden" id="documentNo" value="${documentNo}">
<input type="hidden" id="loginId" value="${sessionScope.loginId}">
<input type="hidden" id="approverName" value="${sessionScope.loginName}">
<canvas style="border: 1px solid #FF0000;"></canvas><br>
<label>결재 상태:
    <select id="signStatusLv1">
        <option value="대기">대기</option>
        <option value="거절">거절</option>
        <option value="승인">승인</option>
        <option value="보류">보류</option>
    </select>
</label>
<br><br>
<button type="button" onclick="location.href='/docView?documentNo=' + document.getElementById('documentNo').value">돌아가기</button>
<button type="button" id="btnClear">지우기</button>
<button type="button" id="btnSign">확인</button>
</body>
</html>
