<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="utf-8">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="./resources/css/signup_style.css">
  <!-- 타이틀 -->
  <title>가입하기 • ROOMIE</title>
</head>
<!-- 바디 시작 -->
<body class="flex-center">  
    <!-- 회원가입 컨테이너 시작 -->
    <div class="emailconfirmation-container">
      <!-- Birthday 로고 이미지 -->
      <div class="flex-center logo-wrapper">
        <img class="navbar-brand" style="margin-top: 30px; object-fit: contain;" src="./resources/image/email_confirmation.png">
      </div>
      <!-- signup submit start -->

        <div class="flex-center">
          <a style="font-size: 14px; font-weight: bolder; color: #262626; margin-top: 20px;">인증 코드 입력</a>
        </div>
        <div class="flex-center" style="margin-top: 10px;">
          <a style="font-size: 14px; color: #262626; margin-top: 10px;">${param.email} 주소로 전송된 인증 코드를</a>
        </div>
        <div class="flex-center" style="margin-top: 5px;" onclick="resend()">
          <a style="font-size: 14px; color: #262626;">입력하세요.</a>
          <a style="margin-left: 5px; font-size: 14px; color: #0095f6; cursor:pointer;">코드 재전송.</a>
        </div>
        <!-- 코드, 아이디(메일 주소) -->
        <input type="hidden" id="key" name="key" value="${param.key}"/>
        <input type="hidden" id="id" name="id" value="${param.email}"/>
        
        <div class="signup-wrapper flex-center" style="margin-top: 30px;">
          <input class="signup-input" type="text" id="email_confirmation_code" name="email_confirmation_code" placeholder="인증 코드" />
        </div>
        <!-- 회원가입 버튼 -->
        <div class="flex-center button-wrapper">
          <button class="signup-button" id="but" style="cursor:pointer">다음</button>
        </div>
        <!-- 회원가입 이전 페이지 -->
        <div class="flex-center">
          <a style="font-size: 14px; font-weight: bolder; color: #0095f6; cursor:pointer;" onClick="history.go(-1)">돌아가기</a>
        </div>

      <!-- signup submit end -->
      <!-- 로그인 버튼 -->
      <div class="login-container flex-center">
        <a style="margin-left: 10px; font-size: 14px;">계정이 있으신가요?</a>
        <a style="margin-left: 10px; font-size: 14px; color: #0095f6; cursor:pointer;"
           onclick="href='./login.html'">로그인</a>
      </div>
    </div>
    <!-- 회원가입 컨테이너 끝 -->
</body>

  <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script> 
<script>

var code = document.getElementById("email_confirmation_code");
var confirm = document.getElementById("key");
var email = document.getElementById("id");


$("#but").click(function(){
	
	console.log("코드 : " + code.value);
	console.log("인증번호 : " + confirm.value);
	
	if(code.value == confirm.value){
		
		location.href = '/roomie/passwordreset.ya?email='+email.value;
		
	}
	
});

$( document ).ready(function() {

	history.replaceState({}, null, location.pathname);
    
});

</script>

<script>

function resend(){
	
	var email = {"mail" : $("input[name='id']").val()};
    
    alert("인증코드를 재 전송했습니다. \n이메일을 다시 확인해주세요.")
	
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
</html>
