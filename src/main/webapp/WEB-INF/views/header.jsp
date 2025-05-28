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
        <span>${sessionScope.employeeLevel} ${sessionScope.loginName}님 반갑습니다. </span><br>
      
    </div>
    <div class="nav-links">
        <a href="/">홈으로</a>
        <a href="/docList">리스트</a>
        <a href="/docWrite">기안 작성</a>
        <a href="https://search.naver.com/search.naver?ssc=tab.image.all&where=image&sm=tab_jum&query=%EA%B8%B0%EC%95%8884#imgId=image_sas%3Aweb_210c2d5c75cc7efbfca73a0d91a5a0a1">기안 84</a>
        <a href="logout">로그아웃</a>
    </div>
</div>
