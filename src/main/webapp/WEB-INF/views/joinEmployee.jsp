<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
	<style>
		body {
		  background-color: #f4f4f4;
		  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
		  margin: 0;
		  padding: 40px 20px;
		  color: #333;
		}
	</style>
</head>
<body class="bg-light">
    <div class="container mt-5" style="max-width: 500px;">
        <div class="card"> <!-- 카드로 감싸기 -->
            <div class="card-body">
                <h2 class="mb-4 text-center">회원가입</h2>

                <form action="joinEmployee" method="post">
                    <div class="mb-3">
                        <label for="employeeName" class="form-label">이름</label>
                        <input type="text" class="form-control" id="employeeName" name="employeeName" required>
                    </div>

                    <div class="mb-3">
                        <label for="employeeId" class="form-label">ID</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="employeeId" name="employeeId" required>
                            <button type="button" id="searchIdBtn" class="btn btn-secondary">중복확인</button>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="employeePw" class="form-label">비밀번호</label>
                        <input type="password" class="form-control" id="employeePw" name="employeePw" required>
                    </div>

                    <div class="mb-3">
                        <label for="employeeLevel" class="form-label">직급</label>
                        <select class="form-select" id="employeeLevel" name="employeeLevel" required>
                            <option value="">-- 선택하세요 --</option>
                            <option value="level1">level1</option>
                            <option value="level2">level2</option>
                            <option value="level3">level3</option>
                        </select>
                    </div>

                    <div class="d-flex justify-content-center gap-3 mt-4">
					    <button type="submit" class="btn btn-success px-4">회원가입</button>
					    <a href="login" class="btn btn-secondary px-4">취소</a>
					</div>
                </form>
            </div>
        </div>
    </div>

    <script>
        $('#searchIdBtn').click(function(){
            let id = $('#employeeId').val();
            $.ajax({
                url: '/idck',
                type: 'post',
                data: { id: id },
                success: function(res) {
                    if (res === 'success') {
                        alert('사용 가능한 아이디입니다.');
                    } else {
                        alert('이미 사용중인 아이디입니다.');
                    }
                }
            });
        });
    </script>
</body>
</html>
