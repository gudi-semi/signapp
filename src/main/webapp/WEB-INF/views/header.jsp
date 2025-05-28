<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    .header {
        background-color: #f8f9fa;
        padding: 15px 30px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px solid #ddd;
        font-family: Arial, sans-serif;
    }
    .user-info {
        font-size: 16px;
        color: #333;
    }
    .nav-links a,
    .nav-links button {
        margin-left: 15px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
        background: none;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }
    .nav-links a:hover,
    .nav-links button:hover {
        text-decoration: underline;
    }
</style>

<div class="header">
    <div class="user-info">
        <span>${sessionScope.employeeLevel} ${sessionScope.loginName}님 반갑습니다.</span>
    </div>
    <div class="nav-links">
        <a href="/">홈으로</a>
        <a href="/docList">리스트</a>
        
     <a 
    href="/docWrite" 
    class="btn btn-primary w-100"
    <c:if test="${loginEmployee.employeeLevel == 'level1' || loginEmployee.employeeLevel == 'level2'}">
        onclick="alert('해당 권한으로는 기안 작성이 불가능합니다.'); return false;"
    </c:if>
>기안 작성</a>
        
        <a href="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MTVfMzkg%2FMDAxNjIxMDg2MzE0MTYx.1iTUfFxB7Kc2fVVU8FN6dcyFFHv3RLqPUCkwyEUTGNkg.J4gtzGOIQqiIZw4wFJiuWpzdRcBx3jHAuxnByzQ4qXAg.JPEG.emt-9119%2F21.JPG&type=sc960_832">기안 84</a>
        <a href="/logout">로그아웃</a>
    </div>
</div>


