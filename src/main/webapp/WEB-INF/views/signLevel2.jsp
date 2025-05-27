<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서명 레벨2</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/signature_pad@4.1.7/dist/signature_pad.umd.min.js"></script>
<script>
    $(document).ready(function () {
        const signaturePad = new SignaturePad($('canvas')[0], {
            minWidth: 2,
            maxWidth: 2,
            penColor: '#000000'
        });

        $('#btnClear').click(function () {
            signaturePad.clear();
        });

        $('#btnSign').click(function () {
            if (signaturePad.isEmpty()) {
                alert('사인을 먼저 해 주세요');
            } else {
            	$.ajax({
            	    async: true,
            	    url: '/signLevel2',
            	    type: 'post',
            	    contentType: 'application/json; charset=UTF-8',
            	    data: JSON.stringify({
            	        documentNo: $('#documentNo').val(),
            	        approverName: 1,
            	        fileNameLv2: signaturePad.toDataURL(),
            	        signStatusLv2: $('#signStatusLv2').val()
            	    })
            	}).done(function (data) {
            	    alert(data);
            	    signaturePad.clear();
            	    location.href = '/docList';
            	}).fail(function () {
            	    alert('결재 실패');
            	});
            }
        });
    });
</script>
</head>
<body>
<h1>레벨 2 서명</h1>
<p>document1 : ${document.documentNo}</p>
<p>document2 : ${documentNo}</p>
<p>서명자: ${sessionScope.loginName}</p>
<input type="hidden" id="documentNo" value="${documentNo}">
<input type="hidden" id="approverName" value="${sessionScope.loginName}">
<canvas style="border: 1px solid #FF0000;"></canvas><br>
<label>결재 상태:
    <select id="signStatusLv2">
        <option value="대기">대기</option>
        <option value="거절">거절</option>
        <option value="승인">승인</option>
        <option value="보류">보류</option>
    </select>
</label>
<br><br>
<button type="button" id="btnClear">지우기</button>
<button type="button" id="btnSign">결제하기</button>
</body>
</html>
