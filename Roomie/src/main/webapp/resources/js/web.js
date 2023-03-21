	//웹소켓 객체 생성
	var webSocket = new WebSocket("ws://localhost:8090/roomie/roomieChat");
	
	//웹소켓 연결 시, 일반세션이 존재하면 웹소켓세션을 다시 생성. 일반세션이 없을경우 
	webSocket.onopen = function() {
		if("<%=session.getAttribute("MEM_ID")%>" != ""){
			webSocket.send('1#' + '<%=session.getAttribute("MEM_ID")%>' + '#1');
		}else{
			/* 로그인 페이지로 이동. */
		}
	}
	
	//페이지가 닫히기 직전에 일반세션의 아이디를 키값으로 갖는 웹소켓세션을 삭제.
	window.onbeforeunload = function() {
		if("<%=session.getAttribute("MEM_ID")%>" != ""){
			webSocket.send('3#' + "<%=session.getAttribute("MEM_ID")%>" + '#1');
		}
	}