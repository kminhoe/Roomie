<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="./resources/css/signup_style.css">
<!-- 타이틀 -->
<title>가입하기 • ROOMIE</title>
</head>
<body class="flex-center">   
  <!-- 회원가입 컨테이너 시작 -->
  <div class="birthday-container">
    <!-- Birthday 로고 이미지 -->
    <div class="flex-center logo-wrapper">
      <img class="navbar-brand" style="margin-top: 30px; object-fit: contain;" src="./resources/image/birthday.png">
    </div>
    <!-- signup submit start -->
	<c:choose>
	  <c:when test="${status == 'email'}">
	  	<!-- 이메일 > 회원가입 > 생년월일 -->
	    <form class="form" method="post" action="/roomie/emailConfirmation.ya">
	      <div class="flex-center">
	        <a style="font-size: 14px; font-weight: bolder; color: #262626; margin-top: 20px;">생일 추가</a>
	      </div>
	      <div class="flex-center" style="margin-top: 20px;">
	        <a style="font-size: 14px; color: #262626;">공개 프로필에 포함되지 않습니다.</a>
	      </div>
	      <div class="flex-center" style="margin-top: 5px;">
	        <a style="font-size: 14px; color: #0095f6;">왜 생일 정보를 입력해야 하나요?</a>
	      </div>
	      <!-- 생년월일 -->
	      <div class="signup-wrapper flex-center" style="margin-top: 13px;">
	        <input class="birthday-input" style="color: #8b8b8b;" id="MEM_BDAY" name="MEM_BDAY" type="date">
	      <!-- email, password, repassword, user, name, mbti -->
	      </div>
	      <div>
	      	<input type="hidden" name="MEM_ID" value="${MEM_ID}">
	      	<input type="hidden" name="MEM_PWD" value="${MEM_PWD}">
	      	<input type="hidden" name="MEM_NAME" value="${MEM_NAME}">
	      	<input type="hidden" name="MEM_USER" value="${MEM_USER}">
	      	<input type="hidden" name="MEM_MBTI" value="${MEM_MBTI}">
	      </div>
	      <div class="flex-center" style="margin-top: 13px;">
	    	<a style="font-size: 12px; color: #8e8e8e;">태어난 날짜를 입력해야 합니다</a>
	      </div>
	      <div class="flex-center" style="margin-top: 20px;">
	    	<a style="font-size: 12px; color: #8e8e8e;">비즈니스나 반려동물 등을 위한 계정인 경우에도 회원님의 생</a>
	      </div>
	      <div class="flex-center">
	    	<a style="font-size: 12px; color: #8e8e8e;">일 정보를 사용하세요</a>
	      </div>
	      <!-- 회원가입 버튼 -->
	      <div class="flex-center button-wrapper">
	    	<button class="signup-button" type="submit" style="cursor:pointer">다음</button>
	      </div>
	    </form>
	  </c:when>
	  <c:otherwise>
	    <!-- 카카오톡 > 회원가입 > 생년월일 -->
	    <form class="form" method="post" action="/roomie/kakaoSignupSuccess.ya">
	      <div class="flex-center">
	        <a style="font-size: 14px; font-weight: bolder; color: #262626; margin-top: 20px;">생일 추가</a>
	      </div>
	      <div class="flex-center" style="margin-top: 20px;">
	        <a style="font-size: 14px; color: #262626;">공개 프로필에 포함되지 않습니다.</a>
	      </div>
	      <div class="flex-center" style="margin-top: 5px;">
	        <a style="font-size: 14px; color: #0095f6;">왜 생일 정보를 입력해야 하나요?</a>
	      </div>
	      <!-- 생년월일 -->
	      <div class="signup-wrapper flex-center" style="margin-top: 13px;">
	        <input class="birthday-input" style="color: #8b8b8b;" id="MEM_BDAY" name="MEM_BDAY" type="date">
	      <!-- email, password, repassword, user, name, mbti -->
	      </div>
	      <div>
	      	<input type="hidden" name="MEM_ID" value="${MEM_ID}">
	      	<input type="hidden" name="MEM_NAME" value="${MEM_NAME}">
	      	<input type="hidden" name="MEM_USER" value="${MEM_USER}">
	      	<input type="hidden" name="MEM_MBTI" value="${MEM_MBTI}">
	      </div>
	      <div class="flex-center" style="margin-top: 13px;">
	    	<a style="font-size: 12px; color: #8e8e8e;">태어난 날짜를 입력해야 합니다</a>
	      </div>
	      <div class="flex-center" style="margin-top: 20px;">
	    	<a style="font-size: 12px; color: #8e8e8e;">비즈니스나 반려동물 등을 위한 계정인 경우에도 회원님의 생</a>
	      </div>
	      <div class="flex-center">
	    	<a style="font-size: 12px; color: #8e8e8e;">일 정보를 사용하세요</a>
	      </div>
	      <!-- 회원가입 버튼 -->
	      <div class="flex-center button-wrapper">
	    	<button class="signup-button" type="submit" style="cursor:pointer">다음</button>
	      </div>
	    </form>
	  </c:otherwise>
	</c:choose>
    <!-- 회원가입 이전 페이지 -->
    <div class="flex-center">
      <a style="font-size: 14px; font-weight: bolder; color: #0095f6; cursor:pointer;" onClick="history.go(-1)">돌아가기</a>
    </div>
    <!-- signup submit end -->
    <!-- 로그인 버튼 -->
    <div class="login-container flex-center">
      <a style="margin-left: 10px; font-size: 14px;">계정이 있으신가요?</a>
      <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer;"
          onclick="href='./login.ya'">로그인</a>
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
      var html = '';
      
        $(".form").validate({
        //규칙
        rules: {
        	MEM_BDAY : {
            required : true, // 필수 입력 여부
            date : true // 날짜 형식
          }
        },
          //메시지
        messages : {
        	MEM_BDAY : {
            required : html, // "날짜는 필수 입력입니다."
            date : html // "날짜 형식을 지켜주세요."
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