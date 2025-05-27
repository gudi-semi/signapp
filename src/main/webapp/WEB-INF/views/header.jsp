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
    .nav-links a {
        margin-left: 15px;
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }
    .nav-links a:hover {
        text-decoration: underline;
    }
</style>

<div class="header">
    <div class="user-info">
        <span>${sessionScope.loginName}님 환영합니다!</span><br>
        <span>접속중인 계정의 현재 레벨은 ${sessionScope.employeeLevel}입니다.</span>
    </div>
    <div class="nav-links">
        <a href="/">홈으로</a>
        <a href="/logout">로그아웃</a>
    </div>
</div>
