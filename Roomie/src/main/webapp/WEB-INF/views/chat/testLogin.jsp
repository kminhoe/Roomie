<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashSet" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">


<body>

<!-- 로그인하지 않았을 경우 -->
<c:if test="${empty MEM_ID}">
	<div style="display: flex;">
		<div>
			<button type="button" onClick="location.href='testLogin.ya?MEM_ID=test1'">test1 로그인</button>
		</div>
		<div> 
			<button type="button" onClick="location.href='testLogin.ya?MEM_ID=test2'">test2 로그인</button>
		</div>
		<div> 
			<button type="button" onClick="location.href='testLogin.ya?MEM_ID=test3'">test3 로그인</button>
		</div>
	</div>
</c:if>

<!-- 로그인했을 경우 -->
<c:if test="${!empty MEM_ID}">
	<div style="">
		<div>
			<button type="button" onClick="location.href='testLogout.ya'">로그아웃</button>
		</div>
		<div>
			<button type="button" onClick="location.href='chatForm.ya'">채팅방 입장</button>
		</div>
	</div>	
</c:if>

</body>

<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="/roomie/resources/js/common.js" charset="utf-8"></script>


</html>