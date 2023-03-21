<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="./resources/css/signup_style.css">


<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">

<!-- 타이틀 -->
<title>가입하기 • ROOMIE</title>
</head>
<body class="flex-center">  
  <!-- 회원가입 컨테이너 시작 --> 
  <div class="signup-container" style="height: 562px;">
    <!-- ROOMIE 로고 이미지 -->
    <div class="flex-center logo-wrapper">
      <img class="navbar-brand" style="height: 100px; margin-top: 30px; object-fit: contain;" src="./resources/image/Roomie.png">
    </div>
    <!-- 카카오톡 로그인 시작 -->
    <div class="signup-wrapper flex-center email-button" style="margin-top: 50px; cursor:pointer;" onclick="location.href='./login.ya'">
      <img style="width: 20px; height: 20px; object-fit: contain; text-align: center;" src="./resources/image/email_icon.png">
      <a style="margin-left: 10px;">Email으로 로그인</a>
    </div>
    <div class="hr-sect" style="color: #5b5b5b;">또는</div>
    <!-- signup submit start -->
    <form class="form" method="post" action="/roomie/birthday.ya">
      <!-- 이메일 -->
      <div class="signup-wrapper flex-center">
        <input class="signup-input" type="hidden" id="MEM_ID" name="MEM_ID"  value="k_${kakaoId}"/>
      </div>
      <!-- 사용자 이름 -->
      <div class="signup-wrapper flex-center">
        <input class="signup-input" type="text" id="MEM_USER" name="MEM_USER" placeholder="사용자 이름" />
      </div>
      <!-- 이름 -->
      <div class="signup-wrapper flex-center">
        <input class="signup-input" type="text" id="MEM_NAME" name="MEM_NAME" placeholder="이름" />
      </div>
      <!-- 가입유형 -->
      <div class="signup-wrapper flex-center">
        <input class="signup-input" type="hidden" name="status" value="kakao" />
      </div>
      <!-- MBTI 이름 -->
      <div class="signup-wrapper flex-center">
          <select class="signup-input" style="color: #8b8b8b;" id="mbti" name="MEM_MBTI">
            <option value="none">MBTI 선택</option>
            <option value="ISTJ">ISTJ</option>
            <option value="ISFJ">ISFJ</option>
            <option value="ISTP">ISTP</option>
            <option value="ISFP">ISFP</option>
            <option value="INFJ">INFJ</option>
            <option value="INTJ">INTJ</option>
            <option value="INFP">INFP</option>
            <option value="INTP">INTP</option>
            <option value="ESTP">ESTP</option>
            <option value="ESFP">ESFP</option>
            <option value="ESTJ">ESTJ</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ENFP">ENFP</option>
            <option value="ENTP">ENTP</option>
            <option value="ENFJ">ENFJ</option>
            <option value="ENTJ">ENTJ</option>
          </select>
        </div>
      <!-- MBTI 검사 -->
      <div class="signup-wrapper flex-center" style="margin-top: 15px;">
        <a style="margin-left: 10px; font-size: 14px;">내 MBTI를 모르시나요?</a>
        <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer;"
            onclick="window.open('https://www.16personalities.com/ko/%EB%AC%B4%EB%A3%8C-%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95-%EA%B2%80%EC%82%AC')">검사하기</a>
      </div>
      <!-- 회원가입 버튼 -->
      <div class="flex-center button-wrapper">
        <button class="signup-button" type="submit" style="cursor:pointer">가입</button>
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
  <script src="./resources/js/jquery-3.2.1.min.js"></script>
  <script src="./resources/js/jquery.validate.min.js"></script>
  
  <script>
    $(function(){
    	var html = '<div style="position: relative; z-index: 1; margin-left: -30px; margin-top: 5px;"><img style="object-fit: contain; style="position: relative;" src="./resources/image/icon_23.png"><div>';

    	// 유효성 검사   
        $(".form").validate({
        //규칙
        rules:{
          MEM_USER: {
            required : true, // 사용자 이름은 필수 입력 여부
            minlength : 4, // 최소 입력 글자수
            remote : "selectMemberUser.ya"
          },
          MEM_NAME: {
            required : true, // 이름은 필수 입력 여부
            minlength : 4 // 최소 입력 글자수
          }
        },
          //메시지
        messages: {
          MEM_USER: {
            required : html, // 사용자 이름은 필수 입력입니다.
            minlength : html, // 최소 4글자 이상 입력해주세요.
            remote : html
          },
          MEM_NAME: {
            required : html, // 이름은 필수 입력입니다.
            minlength : html // 최소 4글자 이상 입력해주세요.
          },
        },
        //메시지 태그
        errorElement : 'span', 	// 태그
        errorClass : 'error',	// 클레스 이름
        validClass :'vaild' 
      });
    });
  </script>
</body>
</html>