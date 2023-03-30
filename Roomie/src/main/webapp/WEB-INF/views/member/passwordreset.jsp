<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="./resources/css/signup_style.css">
  
  <!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">
  
  
  <!-- 타이틀 -->
  <title>비밀번호 재설정 • ROOMIE</title>
</head>
<!-- 바디 시작 -->
<body class="flex-center">  
<!-- 비밀번호 찾기 컨테이너 시작 -->
  <div class="passwordreset-container">
    <!-- 로고 이미지 -->
    <div class="flex-center logo-wrapper">
    <img class="navbar-brand" style="margin-top: 30px; object-fit: contain;" src="./resources/image/icon_25.png">
    </div>
    <!-- passwordreset submit start -->
     
    
    <div class="flex-center">
        <a style="font-size: 16px; font-weight: bolder; color: #262626; margin-top: 20px;">새로운 비밀번호를 입력하세요!</a>
    </div>
    <div class="flex-center" style="margin-top: 10px;">
        <a style="font-size: 14px; color: #8e8e8e; margin-top: 10px;">비밀번호가 다른 사람에게 노출된 경우를 대비해</a>
    </div>
    <div class="flex-center" style="margin-top: 5px;">
        <a style="font-size: 14px; color: #8e8e8e;">모든 세션에서 로그아웃합니다. 다른 사람은 더 이상</a>
    </div>
    <div class="flex-center" style="margin-top: 5px;">
        <a style="font-size: 14px; color: #8e8e8e;">계정에 엑세스할 수 없습니다.</a>
    </div>
    <!-- 아이디 -->
    <input type="hidden" id="email" name="email" value="${param.email }"/>
    
    <!-- 비밀번호 -->
    <div class="signup-wrapper flex-center" style="margin-top: 30px;">
        <input class="signup-input" type="password" id="password" name="password" placeholder="비밀번호" />
    </div>
    <!-- 비밀번호 확인 -->
    <div class="signup-wrapper flex-center">
        <input class="signup-input" type="password" id="repassword" name="repassword" placeholder="비밀번호 확인" />
    </div>
    <!-- 다음 버튼 -->
    <div class="flex-center button-wrapper">
        <button class="signup-button" style="cursor:pointer">다음</button>
    </div>

    <!-- signup submit end -->
    <!-- 로그인으로 돌아가기 -->
    <div class="login-container flex-center">
    <a style="margin-left: 10px; font-size: 14px; color: #262626; cursor:pointer;">로그인으로 돌아가기</a>
    </div>
  </div>
<!-- 비밀번호 찾기 컨테이너 끝 -->
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
<!--   <script src="./jquery-3.2.1.min.js"></script>
  <script src="./jquery.validate.min.js"></script> -->
  <!-- <script>
    $(function(){
      var html = '<div style="position: relative; z-index: 1; margin-left: -30px; margin-top: 5px;"><img style="object-fit: contain; style="position: relative;" src="./image/icon_23.png"><div>';
      
        $(".form").validate({
        //규칙
        rules: {
            password: {
            required : true, // 필수 입력 여부
            minlength : 8	// 최소 입력 글자수
          },
          repassword: {
            required : true,
            minlength : 8,
            equalTo : password
          }
        },
          //메시지
        messages : {
            password: {
            required : html, // 비밀번호는 필수 입력입니다.
            minlength : html // 최소 8글자 이상 입력해주세요.
          },
          repassword: {
            required : html, // 비밀번호 확인은 필수 입력입니다.
            minlength : html, // 최소 8글자 이상 입력해주세요.
            equalTo : html // 비밀번호가 일치하지 않습니다.
          },
        },
        //메시지 태그
        errorElement : 'span', 	// 태그
        errorClass : 'error',	// 클레스 이름
        validClass :'vaild' 
      });
    });
  </script> -->
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script> 
  <script>
  
  $(".signup-button").click(function(){

	  var id = document.getElementById("email");

      var data = {
    		  "password" : $("input[name='password']").val(),
    		  "email" : id.value
    		        };
     
	    
	    
	    $.ajax({
	        url : "/roomie/passwordreset.ya" 
	        ,data :data
	        ,success: function(data){	        	
	        		//alert("보내기 성공");
	        		location.href = '/roomie/login.ya'
	        },error : function(req,status,err){
	        	alert("실패");
	            console.log(req);
	        }
	    });//ajax
	});//비밀번호 변경
  
	//url에서 파라미터 보이지 않게 함
	$( document ).ready(function() {

		history.replaceState({}, null, location.pathname);
	    
	});
	
  </script>
</body>
</html>