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
    <!-- 이메일 로고 이미지 -->
    <div class="flex-center logo-wrapper">
      <img class="navbar-brand" style="margin-top: 30px; object-fit: contain;" src="./resources/image/email_confirmation.png">
    </div>
    <!-- signup submit start -->
    <form id="form" name="form" method="post" action="/roomie/emailSignupSuccess.ya">
      <div class="flex-center">
        <a style="font-size: 14px; font-weight: bolder; color: #262626; margin-top: 20px;">인증 코드 입력</a>
      </div>
      <div class="flex-center" style="margin-top: 10px;">
        <a style="font-size: 14px; color: #262626; margin-top: 10px;">${MEM_ID} 주소로 전송된 인증 코드를</a>
      </div>
      <div class="flex-center" style="margin-top: 5px;">
        <a style="font-size: 14px; color: #262626;">입력하세요.</a>
        <a style="margin-left: 5px; font-size: 14px; color: #0095f6; cursor:pointer;" href="javascript:fn_sendEmail_Ajax('${MEM_ID}');">코드 재전송.</a>
      </div>
      <!-- 코드 -->
      
      <div class="signup-wrapper flex-center" style="margin-top: 30px;">
      	<input type="hidden" name="MEM_ID" value="${MEM_ID}">
      	<input type="hidden" name="MEM_PWD" value="${MEM_PWD}">
      	<input type="hidden" name="MEM_NAME" value="${MEM_NAME}">
      	<input type="hidden" name="MEM_USER" value="${MEM_USER}">
      	<input type="hidden" name="MEM_BDAY" value="${MEM_BDAY}">
      	<input type="hidden" name="MEM_MBTI" value="${MEM_MBTI}">
        <input class="signup-input" type="text" id="email_confirmation_code" name="email_confirmation_code" placeholder="인증 코드" />
      </div>
      <!-- 회원가입 버튼 -->
      <div class="flex-center button-wrapper">
        <button class="signup-button" type="button" style="cursor:pointer" onclick="fn_checkCode();">다음</button>
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
         onclick="href='./login.ya'">로그인</a>
    </div>
  </div>
  <!-- 회원가입 컨테이너 끝 -->
</body>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).ready(function(){
		fn_sendEmail_Ajax('${MEM_ID}');
	});
</script>

<script>
	// 이메일 인증 코드 발송
	function fn_sendEmail_Ajax(userEmail) {
	
		var form = {
			email : userEmail
		};

		$.ajax({
			url : "/roomie/emailConfirmationPro.ya",
			data : form,
			dataType: "json",
			type : "post",
			async : false,
			success : function(data) {
				alert("입력하신 이메일 주소에서 발급된 코드를 확인하세요.");
				console.log("status : " + data.status);
			},
			error: function(error){
				console.log("status : " + error.status);
	        }
		});
	}
	
	// 이메일 인증 확인
	function fn_checkCode() {
		
		var form = {
				joinCode : $('#email_confirmation_code').val()
			};

		$.ajax({
			url : "/roomie/emailCodeCheck.ya",
			data : form,
			dataType: "json",
			type : "post",
			async : false,
			success : function(data) {
				if (data.status == "TRUE") {
					alert("회원가입을 축하드립니다.")
					document.form.submit();
				} else {
					alert("인증코드가 맞지 않습니다.");
				}
			},
			error: function(error){
				console.log("status : " + error.status);
	        }
		});
	}
</script>
</html>