<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
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

로그인중입니다...

</body>
<!-- jquery -->
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/jquery.session.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->

<script>
	//웹소켓 연결
	var webSocket = new WebSocket("ws://localhost:8090/roomie/roomieChat");
	
	//웹소켓이 연결되면 일반세션의 아이디를 키값으로 갖는 웹소켓세션 생성.
	webSocket.onopen = function() {
		  webSocket.send('1#' + '<%=session.getAttribute("MEM_ID")%>' + '#1');
		  location.href='boardList.ya';
		};
		
	//페이지가 닫히기 직전에 일반세션의 아이디를 키값으로 갖는 웹소켓세션을 삭제.
	window.onbeforeunload = function() {
		webSocket.send('3#' + "<%=session.getAttribute("MEM_ID")%>" + '#1');
	}

</script>
</html>