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
	
	//웹소켓(ChatServer)에서 메시지를 전송받았을때 알림의 종류를 확인한 후 알림아이콘 추가.
	webSocket.onmessage = function(message){
		
		index = message.data.indexOf("#");
		
		result = message.data.substring(0, index);

		if(result == "2"){ //메시지 알림의 경우.
		
			var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>';
			var messageNotification = '<img style="width: 10px; height: 10px;" src="resources/image/icon_notification2.png">';
			$("#msgAlarm").html(messageNotification); //채팅 아이콘에 메시지 알림 아이콘 추가.
			
		}else if(result == "like") { //좋아요 알림의 경우
			
			var likeNotification = '<img style="width: 10px; height: 10px;" src="resources/image/icon_notification2.png">';
			$("#notifAlarm").html(likeNotification); //알림 아이콘에 메시지 알림 아이콘 추가.
			
		}	
	}

	//페이지가 닫히기 직전에 일반세션의 아이디를 키값으로 갖는 웹소켓세션을 삭제.
	window.onbeforeunload = function() {
		if("<%=session.getAttribute("MEM_ID")%>" != ""){
			webSocket.send('3#' + "<%=session.getAttribute("MEM_ID")%>" + '#1');
		}
		
	}