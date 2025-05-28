<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f5f5f5;
        }
        .login-container {
            max-width: 500px;
            margin: 100px auto;
        }
        .card {
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .btn-group-custom {
            display: flex;
            justify-content: space-between;
            gap: 10px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container login-container">
    <div class="card">
    
        <!-- 로그인 상태일 때 -->
        <c:if test="${not empty loginEmployee}">
            <h4 class="mb-4 text-center">${loginEmployee.employeeLevel}  ${loginEmployee.employeeName}님, 환영합니다! </h4>
            <div class="btn-group-custom">
<a 
    href="/docWrite" 
    class="btn btn-primary w-100"
    <c:if test="${loginEmployee.employeeLevel == 'level1' || loginEmployee.employeeLevel == 'level2'}">
        onclick="alert('해당 권한으로는 기안 작성이 불가능합니다.'); return false;"
    </c:if>
>기안 작성</a>
                <a href="/docList" class="btn btn-secondary w-100">기안 리스트</a>
                <a href="logout" class="btn btn-danger w-100">로그아웃</a>
            </div>
        </c:if>

        <!-- 비로그인 상태일 때 -->
        <c:if test="${empty loginEmployee}">
            <h4 class="mb-4 text-center">로그인</h4>
            <form action="login" method="post">
                <div class="mb-3">
                    <label for="employeeId" class="form-label">ID</label>
                    <input type="text" class="form-control" id="employeeId" name="employeeId" required>
                </div>
                <div class="mb-3">
                    <label for="employeePw" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" id="employeePw" name="employeePw" required>
                </div>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger">${error}</div>
                </c:if>
                <div class="d-grid gap-2 mt-3">
                    <button type="submit" class="btn btn-primary">로그인</button>
                    <a href="joinEmployee" class="btn btn-outline-secondary">회원가입</a>
                </div>
            </form>
        </c:if>
        
    </div>
</div>

</body>
</html>
