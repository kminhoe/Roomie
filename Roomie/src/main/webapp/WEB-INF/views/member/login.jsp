<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="./resources/css/login_style.css">
<!-- 로딩 화면 css -->
<!-- <link rel="stylesheet" href="./resources/css/fakeLoader.min.css"> -->
<!-- 타이틀 -->
<title>ROOMIE LOGIN</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="flex-center">
  <!-- 로딩 화면 -->
  <div class="fakeLoader"></div>
  <!-- 로그인 컨테이너 시작 -->
  <div class="login-container"> 
    <!-- ROOMIE 로고 이미지 -->
    <div class="flex-center logo-wrapper">
      <img class="navbar-brand" style="height: 100px; margin-top: 30px; object-fit: contain;" src="./resources/image/Roomie4.png">
    </div>
    <!-- login submit start -->
    <form class="input-wrapper form" method="post" action="/roomie/loginSuccess.ya">
      <!-- 사용자 이름 또는 이메일 -->
      <div class="login-wrapper flex-center">
        <input class="login-input" type="text" id="MEM_ID" name="MEM_ID" placeholder="이메일"/>
      </div>
      <!-- 비밀번호 -->
      <div class="login-wrapper flex-center">
        <input class="login-input" type="password" id="MEM_PWD" name="MEM_PWD" placeholder="비밀번호" />
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
      <img style="width: 20px; height: 20px; object-fit: contain; text-align: center;" src="./resources/image/kakao_icon_02.png">
      <a style="margin-left: 10px; color: #f9e000; cursor:pointer;" href="javascript:kakaoLogin();">KakaoTalk으로 로그인</a>
    </div>
    <!-- 비밀번호 찾기 -->
    <div class="flex-center findpass">
      <a style="color: #0095f6; cursor:pointer"
      onclick="href='./login.ya'">비밀번호를 잊으셨나요?</a>
    </div>
    <!-- 회원가입 -->
    <div class="signup-container flex-center">
      <a style="margin-left: 10px; font-size: 14px;">계정이 없으신가요?</a>
      <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer"
          onclick="href='./emailSignup.ya'">가입하기</a>
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
  <script src="./resources/js/jquery-3.2.1.min.js"></script>
  <script src="./resources/js/jquery.validate.min.js"></script>
  <script>
    $(function(){
      var html = '<div style="position: relative; z-index: 1; margin-left: -30px; margin-top: 5px;"><img style="object-fit: contain; style="position: relative;" src="./resources/image/icon_23.png"><div>';
      
        $(".form").validate({
        //규칙
        rules:{
          MEM_ID : {
            required : true, // 필수 입력 여부
            email : true // 이메일 형식
          },
          MEM_PWD : {
            required : true, // 필수 입력 여부
            minlength : 8	// 최소 입력 글자수
          }
        },
          //메시지
        messages : {
          MEM_ID : {
            required : html, // "이메일은 필수 입력입니다."
            email : html // "이메일 형식을 지켜주세요."
          },
          MEM_PWD: {
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
  
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
  //카카오로그인
  function kakaoLogin() {

    $.ajax({
        url: '/roomie/login/getKakaoAuthUrl.ya',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            location.href = res;
        }
    });

  }

  $(document).ready(function() {

	  var login = '${login}';

	  if (login == "false") {
		  alert("이메일 또는 비밀번호가 맞지 않습니다.");
	  }
	  
	  if (login == "del") {
		  alert("본 계정은 탈퇴처리 되어 접속하실 수 없습니다.");
	  }
	  
	  if (login == "lock") {
		  alert("본 계정은 활동 정지된 상태입니다.\n관리자에게 문의해주세요.");
	  }
	  
      var kakaoInfo = '${kakaoInfo}';

      if (kakaoInfo != "") {
          var data = JSON.parse(kakaoInfo);
          /* alert("id : " + data['id']); */
      }
  });  

  </script>
  
  <!-- 로딩 화면 플러그인 -->
<!--   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="./resources/js/fakeLoader.min.js"></script>
  <script>
    $(document).ready(function(){
      $.fakeLoader ({
        timeToHide : 1200,
        bgColor : "#98bcd5",
        spinner : "spinner5"
      });
    });
  </script> -->
</body>
</html>