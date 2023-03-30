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
  <div class="emailcheck-container">
    <!-- 로고 이미지 -->
    <div class="flex-center logo-wrapper">
    <img class="navbar-brand" style="margin-top: 30px; object-fit: contain;" src="./resources/image/icon_24.png">
    </div>
    <!-- passwordreset submit start -->
    
    <input type="hidden" id="key" name="key" value="${key}"/>
    
    <div class="flex-center">
        <a style="font-size: 16px; font-weight: bolder; color: #262626; margin-top: 20px;">로그인에 문제가 있나요?</a>
    </div>
    <div class="flex-center" style="margin-top: 10px;">
        <a style="font-size: 14px; color: #8e8e8e; margin-top: 10px;">이메일 주소를 입력하시면 계정에 다시 액세스할 수</a>
    </div>
    <div class="flex-center" style="margin-top: 5px;">
        <a style="font-size: 14px; color: #8e8e8e;">있도록 인증 번호를 보내드립니다.</a>
    </div>
    <!-- 이메일 -->
    <div class="signup-wrapper flex-center" style="margin-top: 30px;">
        <input class="signup-input" type="text" id="email" name="email" placeholder="이메일" />
    </div>
    <!-- 다음 버튼 -->
    <div class="flex-center button-wrapper">
        <button class="signup-button" id="login-button" type="submit" style="cursor:pointer">다음</button>
    </div>
   
    <div class="hr-sect" style="color: #5b5b5b;">또는</div>
    <!-- 새 계정 만들기 -->
    <div class="flex-center">
    <a style="margin-left: 10px; font-weight: bolder; font-size: 14px; color: #262626; cursor:pointer;"
        onclick="href='./emailsignup.html'">새 계정 만들기</a>
    </div>
    <!-- signup submit end -->
    <!-- 로그인으로 돌아가기 -->
    <div class="login-container flex-center">
    <a style="margin-left: 10px; font-size: 14px; color: #262626; cursor:pointer;"
        onclick="href='./login.html'">로그인으로 돌아가기</a>
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
  <script src="./resources/js/jquery-3.2.1.min.js"></script>
  <script src="./resources/js/jquery.validate.min.js"></script>
  <script>
    /* $(function(){
      var html = '<div style="position: relative; z-index: 1; margin-left: -30px; margin-top: 5px;"><img style="object-fit: contain; style="position: relative;" src="./image/icon_23.png"><div>';
       */
      
      
        /* $(".form").validate({
        //규칙
        rules: {
          email : {
            required : true, // 필수 입력 여부
            email : true // 이메일 형식
          }
        },
          //메시지
        messages : {
          email : {
            required : html, // "이메일은 필수 입력입니다."
            email : html // "이메일 형식을 지켜주세요."
          },
        },
        //메시지 태그
        errorElement : 'span', 	// 태그
        errorClass : 'error',	// 클레스 이름
        validClass :'vaild' 
      }); */
   /*  }); */
  </script>
  
<script>
  
  $("#login-button").on("click",function(e){
	    isMailAuthed=true;
	    
	    var email = {"mail" : $("input[name='email']").val()};
	    
	    
	    $.ajax({
	        url : "/roomie/emailcheck.ya" 
	        ,data :email
	        ,success: function(map){
	        	  
	        	let arr = new Array();
	        	var key = "";
	        	var mail = "";
	        	$.each(map, function(i, value){
	        		
	        		arr.push(value);
	        		});
                
               if(arr[0] == "NO"){
            	   alert("등록된 계정을 찾을 수 없습니다.\n 다시 한번 확인해 주세요.");
               } else {
	        	location.href = '/roomie/emailconfirm.ya?key='+arr[0]+'&email='+arr[1];
               }
	        		
	        },error : function(req,status,err){
	        	alert("실패");
	            console.log(req);
	        }
	    });//ajax
	});//mailCheck
  
  </script>

</body>
</html>