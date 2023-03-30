<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- style css -->
<link rel="stylesheet" type="text/css" href="./resources/css/login_style.css">

<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">


<!-- 로딩 화면 css -->
<!-- <link rel="stylesheet" href="./resources/css/fakeLoader.min.css"> -->
<!-- 타이틀 -->
<title>ROOMIE LOGIN</title>

<!-- 모달 디자인 -->
<style>

 .modal_lock {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, 0.8);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
    }

    .modal_window_lock {
        background: white;
        backdrop-filter: blur(13.5px);
        -webkit-backdrop-filter: blur(13.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        position: relative;
        padding: 10px;
    }
    
     .modal_lock_email {
        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        background: rgba(0, 0, 0, 0.8);
        backdrop-filter: blur(1.5px);
        -webkit-backdrop-filter: blur(1.5px);
    }

    .modal_window_lock_email {
        background: white;
        backdrop-filter: blur(13.5px);
        -webkit-backdrop-filter: blur(13.5px);
        border-radius: 10px;
        border: 1px solid rgba(255, 255, 255, 0.18);
        position: relative;
        padding: 10px;
    }
    
</style>

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
      onclick="href='/roomie/passwordcheck.ya'">비밀번호를 잊으셨나요?</a>
    </div>
    <!-- 회원가입 -->
    <div class="signup-container flex-center">
      <a style="margin-left: 10px; font-size: 14px;">계정이 없으신가요?</a>
      <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer"
          onclick="href='./emailSignup.ya'">가입하기</a>
    </div>
  </div>
  
    <!-- 잠금 모달 -->
  <div class="modal_lock" >
        <div class="modal_window_lock" style="width: 330px; height: 440px; text-align: center;" >
            <h2>회원님의 계정이 일시적으로 잠겼습니다</h2>
<p style="fone-size: 12px;">회원님의 Roomie 계정에서 의심스러운 활동을 감지했으며 보안을 위해 계정을 일시적으로 잠갔습니다.</p>
<p style="fone-size: 12px;">Roomie와 비슷하게 만들어진 웹사이트에서 비밀번호를 입력하여 계정이 해킹되었을 수 있습니다. 이러한 공격을 피싱이라고 합니다.</p>
<p style="fone-size: 12px;">앞으로 몇 단계에 걸쳐 회원님의 계정 보안을 위해 신원을 확인한 후 계정 로그인 권한을 복원해드리겠습니다.</p>
<br>

<button style="width: 270px; border-radius: 8px; height: 40px; background-color: #0095ff; border: none; color: #FFFFFF;"
onclick="lock()">계속</button>
        </div>
    </div>
    
    <!-- 잠금 모달 2번째 -->
    <div class="modal_lock_email" >
        <div class="modal_window_lock_email" style="width: 330px; height: 440px; text-align: center;" >
            <div style="text-align: left;" onclick="back()">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z"/>
              </svg></div>
            <h2>이 계정이 회원님의 계정인지 확인해주세요</h2>
            <br><br>
<p>본인 확인을 위한 보안 코드를 보내드립니다.</p>
<!-- 해당 회원의 이메일 불러오기-->
<input type="hidden" id="mem_id" name="mem_id" value="${mem_id}"/>
<p>이메일: ${mem_id}</p>

<br><br><br><br>
<button
onclick="send()"
 style="width: 270px; border-radius: 8px; height: 40px; background-color: #0095ff; border: none; color: #FFFFFF;">
보안코드 보내기</button>
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
		  
		  //잠금 모달창 나오게 변경
		  $(".modal_lock").css({
			  "display": "flex"
			  });
		  
	  }
	  
      var kakaoInfo = '${kakaoInfo}';

      if (kakaoInfo != "") {
          var data = JSON.parse(kakaoInfo);
          /* alert("id : " + data['id']); */
      }
  });  

  </script>
  
  <script>
  
  function lock(){
	  $(".modal_lock").css({
		  "display": "none"
		  });
	  
	  $(".modal_lock_email").css({
		  "display": "flex"
		  });
	  
	  
  }
  
  function back(){
	  $(".modal_lock").css({
		  "display": "flex"
		  });
	  
	  $(".modal_lock_email").css({
		  "display": "none"
		  });
  }
  
  
  function send(){
	  
	  var mail = {"mail" : $("input[name='mem_id']").val()};
	    
	    
	    $.ajax({
	        url : "/roomie/emailcheck.ya" 
	        ,data :mail
	        ,success: function(map){
	        	  
	        	let arr = new Array();
	        	var key = "";
	        	var mail = "";
	        	$.each(map, function(i, value){
	        		
	        		arr.push(value);
	        		});
              
             if(arr[0] == "NO"){
          	   alert("등록된 이메일이 없습니다. 다시 한번 확인해 주세요.");
             } else {
	        	location.href = '/roomie/emailconfirm.ya?key='+arr[0]+'&email='+arr[1];
             }
	        		
	        },error : function(req,status,err){
	        	alert("실패");
	            console.log(req);
	        }
	    });//ajax
	  
  }
  
  
  </script>
  <!-- 로딩 화면 플러그인 -->
<!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="./resources/js/fakeLoader.min.js"></script>
  <script>
    $(document).ready(function(){
      $.fakeLoader ({
        timeToHide : 1200,
        bgColor : "#98bcd5",
        spinner : "spinner5"
      });
    });
  </script>  -->
</body>
</html>