<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="./resources/css/signup_style.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- 타이틀 -->
  <title>가입하기 • ROOMIE</title>
<body class="flex-center">  
  <!-- 회원가입 컨테이너 시작 -->
  <div class="emailconfirmation-container">
    <!-- Birthday 로고 이미지 -->
    <div class="flex-center logo-wrapper">
      <img class="navbar-brand" style="margin-top: 30px; object-fit: contain;" src="./resources/image/email_confirmation.png">
    </div>
    <!-- signup submit start -->
    <form action="./index.html">
      <div class="flex-center">
        <a style="font-size: 14px; font-weight: bolder; color: #262626; margin-top: 20px;">인증 코드 입력</a>
      </div>
      <div class="flex-center" style="margin-top: 10px;">
        <a style="font-size: 14px; color: #262626; margin-top: 10px;">${MEM_ID} 주소로 전송된 인증 코드를</a>
      </div>
      <div class="flex-center" style="margin-top: 5px;">
        <a style="font-size: 14px; color: #262626;">입력하세요.</a>
        <a style="margin-left: 5px; font-size: 14px; color: #0095f6; cursor:pointer;">코드 재전송.</a>
      </div>
      <!-- 코드 -->
      <div class="signup-wrapper flex-center" style="margin-top: 30px;">
        <input class="signup-input" type="text" id="email_confirmation_code" name="email_confirmation_code" placeholder="인증 코드" />
      </div>
      <!-- 회원가입 버튼 -->
      <div class="flex-center button-wrapper">
        <button class="signup-button" type="submit" style="cursor:pointer">다음</button>
      </div>
      <!-- 회원가입 이전 페이지 -->
      <div class="flex-center">
        <a style="font-size: 14px; font-weight: bolder; color: #0095f6; cursor:pointer;" onClick="history.go(-1)">돌아가기</a>
      </div>
    </form>
    <!-- signup submit end -->
    <!-- 로그인 버튼 -->
    <div class="login-container flex-center">
      <a style="margin-left: 10px; font-size: 14px;">계정이 있으신가요?</a>
      <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer;"
         onclick="href='../views/login.html'">로그인</a>
    </div>
  </div>
  <!-- 회원가입 컨테이너 끝 -->
</body>
</html>