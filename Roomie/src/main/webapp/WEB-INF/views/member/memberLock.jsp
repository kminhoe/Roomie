<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="../css/login_style.css">
  <!-- 로딩 화면 css -->
  <link rel="stylesheet" href="../css/fakeLoader.min.css">
  
  
  <!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">
  
  
  
  <!-- 타이틀 -->
  <title>ROOMIE</title>
</head>
<!-- 바디 시작 -->
<body class="flex-center">
  <!-- 로딩 화면 -->
  <div class="fakeLoader"></div>
  <!-- 로그인 컨테이너 시작 -->
  <div class="login-container">
    <!-- ROOMIE 로고 이미지 -->
    <div class="flex-center logo-wrapper">
      <img class="navbar-brand" style="height: 100px; margin-top: 30px; object-fit: contain;" src="../image/Roomie4.png">
    </div>
    <!-- login submit start -->
    <form class="input-wrapper form" action="../views/index.html">
      <!-- 사용자 이름 또는 이메일 -->
      <div class="login-wrapper flex-center">
        <input class="login-input" type="text" id="email" name="email" placeholder="이메일"/>
      </div>
      <!-- 비밀번호 -->
      <div class="login-wrapper flex-center">
        <input class="login-input" type="password" id="password" name="password" placeholder="비밀번호" />
      </div>
      <!-- 로그인 버튼 -->
      <div class="flex-center button-wrapper">
        <button class="login-button" type="submit" style="cursor:pointer">로그인</button>
      </div>
    </form>
    <!-- login submit end -->

    <div class="hr-sect" style="color: #5b5b5b;">또는</div>
 
    <!-- 카카오톡 로그인 시작 -->
    <div class="login-wrapper flex-center">
      <img style="width: 20px; height: 20px; object-fit: contain; text-align: center;" src="../image/kakao_icon_02.png">
      <a style="margin-left: 10px; color: #f9e000;">KakaoTalk으로 로그인</a>
    </div>
    <!-- 비밀번호 찾기 -->
    <div class="flex-center findpass">
      <a style="color: #0095f6; cursor:pointer"
      onclick="href='./emailcheck.html'">비밀번호를 잊으셨나요?</a>
    </div>
    <!-- 회원가입 -->
    <div class="signup-container flex-center">
      <a style="margin-left: 10px; font-size: 14px;">계정이 없으신가요?</a>
      <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer"
          onclick="href='../views/emailsignup.html'">가입하기</a>
    </div>
  </div>
  <!-- 로그인 컨테이너 끝 -->
  <!-- 
    validation 플러그인 (jquery-3.2.1.min.js, jquery.validate.min.js)
    •	required : 필수 입력 element
    •	remote : element의 검증을 지정된 다른 자원에 ajax 로 요청
    •	minlength : 최소 길이를 지정
    •	maxlength : 최대 길이를 지정
    •	rangelength : 길이의 범위를 지정
    •	min : 최소값을 지정
    •	max : 최대값을 지정
    •	range : 값의 범위를 지정
    •	step : 할당된 단계의 값을 가지도록 지정
    •	email : 이메일 주소형식으 가지도록 지정
    •	url : url 형식을 가지도록 지정
    •	date : 날짜 형식을 가지도록 지정
    •	dateISO : ISO 날짜 형식을 가지도록 지정
    •	number : 10진수를 가지도록 지정
    •	digits : 숫자 형식을 가지도록 지정
    •	equalTo : 엘리먼트와 다른 엘리먼트의 일치 여부
  -->
  <script src="../js/jquery-3.2.1.min.js"></script>
  <script src="../js/jquery.validate.min.js"></script>
  <script>
    $(function(){
      var html = '<div style="position: relative; z-index: 1; margin-left: -30px; margin-top: 5px;"><img style="object-fit: contain; style="position: relative;" src="../image/icon_23.png"><div>';
      
        $(".form").validate({
        //규칙
        rules:{
          email : {
            required : true, // 필수 입력 여부
            email : true // 이메일 형식
          },
          password : {
            required : true, // 필수 입력 여부
            minlength : 8	// 최소 입력 글자수
          }
        },
          //메시지
        messages : {
          email : {
            required : html, // "이메일은 필수 입력입니다."
            email : html // "이메일 형식을 지켜주세요."
          },
          password: {
            required : html, // 비밀번호는 필수 입력입니다.
            minlength : html // 최소 8글자 이상 입력해주세요.
          },
        },
        //메시지 태그
        errorElement : 'span', 	// 태그
        errorClass : 'error',	// 클레스 이름
        validClass :'vaild' 
      });
    });
  </script>
  <!-- 로딩 화면 플러그인 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="../js/fakeLoader.min.js"></script>
  <script>
    $(document).ready(function(){
      $.fakeLoader ({
        timeToHide : 1200,
        bgColor : "#98bcd5",
        spinner : "spinner5"
      });
    });
  </script>
</body>
</html>