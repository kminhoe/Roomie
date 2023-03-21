<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="utf-8">
<head>

<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <!-- 내비게이션 바 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!-- 내비게이션 바 구글 아이콘 이미지 -->
  <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">

<!-- 20230307 12:56 -->
<!-- 20230318 05:55 -->

<style>

@media (max-width: 1100px) {
	body{
	height: 100vh;
	}
	
	.chat_background{
	width: 100vw !important;
	padding: 0 !important;
	}
	
	.chat_body{
		width: 100vw !important;
	}
	
	.chat_list{
		display: none;
    }
    
    .chat_chat{
		border: 1px solid #DBDBDB;
		min-width: 100vw !important;
	}
	
	.chat_box{
		height: calc(100% - 90px) !important;
		background-color: transparent !important;
		border: none !important;
		width: 100vw !important;
	}
	
	.story_body {
		display: flex !important;
		justify-content: center !important;
		background-color: #FAFAFA !important;
		border: 1px solid #BDBDBD !important;
		border-bottom: none !important;
		flex-wrap: inherit !important;
		min-width: 100vw !important;
	}
	
	.chat_add{
		display: flex !important;
	}
	
}

.chat_add{
		display: none;
	}
	
.chat_addMessage{
	display: flex;
	height: 60px;
	padding: 20px;
	bottom: 0;
	background-color: #fff;
	align-items: center;
}

.chat_addMessageArea{
	display: flex;
	height: 35px;
	border: solid 1px #DBDBDB;
	border-radius: 17.5px;
	padding: 0 20px;
	align-items: center;
	width: 100%;
	justify-content: space-between;
}

.chat_background{

}

.chat_body{

}

.chat_box{	
	background-color: #fff;
	border: 1px solid #DBDBDB;
	height: 100%;
	width: 900px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.chat_content{
	height: calc(100% - 120px);
	/* overflow-y: scroll; */
}

.chat_content2{
	height: 100%;
	overflow-y: scroll;
}

.chat_profile{
	height: 70px;
	border-bottom: 1px solid #DBDBDB;
	padding: 10px 20px;
	display: flex;
	align-items: center;
	cursor: pointer;
}

.chat_profile:hover {
	background-color: #F2F3F5;
}

.chat_input{
	color: gray;
	font-size: 12px;
	border: 0;
	margin-left: 20px;
}

.chat_input:focus{
	outline: none;
}

.chat_send{
	color: skyblue;
	border: 0;
	background-color: transparent;
	font-size: 12px;
	font-weight: 600;
}

.chat_send:hover{
	color: purple;
}

.chat_date{
	display: flex;
	justify-content: center;
	font-size: 12px;
	color: gray;
	padding: 15px 0;
}

.chat_otherMsgBox{
	 display: flex;
	 padding-left: 20px;
	 margin: 10px 0;
}

.chat_otherMsg{
	display: flex;
	border: 1px solid #DBDBDB;
	align-items: center;
	padding: 10px 15px;
	border-radius: 25px;
	max-width: 380px;
	word-break:break-all;
}

.chat_profileImg{
	margin-right: 20px;
	border: 1px solid #DBDBDB;
	border-radius: 50%;
	height: 50px;
	cursor: pointer;
}

.chat_profileCont{
	display: flex;
	color: gray;
	align-items: center;
}

.chat_profileMsg{
	text-overflow:ellipsis;
	overflow:hidden;
	white-space:nowrap;
	width:150px;
}

.chat_profileDate{
	color: red;
	padding-left: 10px;
	font-size: 12px;
}

.chat_roomList{
	height: calc(100% - 60px);
	overflow-y: scroll;
}
.chat_myMsgBox{
	 display: flex;
	 padding-right: 20px;
	 margin: 10px 0;
	 flex-direction: row-reverse;
}

.chat_myMsg{
	 display: flex;
	 background-color: #EBEDF0;
	 align-items: center;
	 padding: 10px 15px;
	 border-radius: 25px;
	 max-width: 380px;
	 word-break:break-all;
}

.chat_otherId{
	 margin-right: 50px;
	 font-weight: 600;
	 cursor: pointer;
}

/* 스토리 관련 */

.story_body {
	display: none;
	width: calc(100% - 350px);
	min-width: 400px;
}

.sub_story {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	width: 66px;
	height: 66px;
	background-image: url("resources/image/rainbow.png");
	background-size: contain;
}

.story {
    left: 15px;
    width: 485px;
    height: 90px;
    overflow: hidden;
    margin-left: 15px;
}

.story_list {
    transition: left 0.5s ease-out;
}

.text {
    position: relative;
    left: 0px;
    top: 12px;
    text-align: center;
}

.sub_story img {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background-color: white;
}

ul {
    display: flex;
    position: relative;
    flex-direction: row;
    left: 0px;
    padding: 0px;

}

ul li {
    display: flex;
    flex-direction: row;
    margin-right: 15px;
}

/* 모달 관련 */

.modal_overlay {
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

.chat_friend_modal {
		width: 400px;
		height: 650px;
		position: absolute;
		left: 50%;
		top: 75px;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background-color: #fff;
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
		/* X축의 가운데를 기준으로 */
		transform: translate(-50%);
		padding: 10px;
		z-index: 1;
	}
	
.chat_friend{
	display:flex;
	flex-direction: row;
	justify-content: space-between;
	padding: 10px 20px;
	align-items: center;
	cursor: pointer;
}

.chat_friend:hover{
	background-color: #efefef;
}

.chat_friend_clicked{
	display:flex;
	flex-direction: row;
	justify-content: space-between;
	padding: 10px 20px;
	align-items: center;
	cursor: pointer;
	background-color: #98bcd5;

}


.chat_friendList{
	display: flex;
	flex-direction:column;
	position:relative;
	height:calc(100% - 75px);
	top: 65px;
}

.chat_friendProfile{
	margin-right: 20px;
	border-radius: 50%;
	height: 50px;
	cursor: pointer;
}

</style>

  <!-- 타이틀 -->
  <title>SNS PROJECT</title>
</head>

<body>
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@임시 로그아웃 버튼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
		
			<!-- <button type="button" onClick="location.href='testLogout.ya'">로그아웃</button> -->
		
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@임시 로그아웃 버튼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

	<!-- 상단 내비게이션 바 시작 -->
	<div style="display: flex; justify-content: center;">
		<div style="display: flex; flex-wrap: inherit; align-items: center; justify-content: space-between; width: 935px;">
			<img class="navbar-brand" style="height: 40px; object-fit: contain;" src="resources/image/roomie_logo_1.png" onClick="location.href='boardList.ya'">
		</div>
		<div class="chat_add" id="addChatRoom" style="align-items: center; padding-right: 10px;">
			<img style="height: 24px; cursor: pointer;" src="resources/image/add_friend.png">
		</div>
	</div>
	<!-- 상단 내비게이션 바 끝 -->

	<!-- 채팅 전체 start-->
	<div class="chat_background" style="display: flex; flex-wrap: inherit; justify-content: center; background-color: #efefef; height: calc(100vh - 40px); width: 100%; padding: 20px;">
		<div class="chat_body" style="display:flex; width: 900px; align-items: center; flex-direction: column;">			
			<!-- 스토리 시작 -->
			<div class="story_body">
				<!-- 왼쪽 버튼 -->
				<div class="prev" style="cursor:pointer; display: flex; align-items: center;"><img src="resources/image/icon_27.png"></div>
					<!-- 스토리 -->
					<div class="story">
						<ul class="story_list" id="chatRoomListMobile">
							<!-- 모바일버전의 채팅룸이 입력되는 장소. -->
						</ul>
					</div>
				<!-- 오른쪽 버튼 -->
				<div class="next" style="cursor:pointer; display: flex; align-items: center;"><img src="resources/image/icon_26.png"></div>
			</div>
			<!-- 스토리 끝 -->
			
			<!-- 채팅방 start-->
			<div class="chat_box">
				<div class="chat_list" style="background-color: #fff; height: 100%; width: 350px; border-right: 1px solid #DBDBDB;">
					<!-- 상단 메뉴1 start -->
					<div style="background-color: #fff; height: 60px; width: 100%; display: flex; align-items: center; justify-content: center; border-bottom: 1px solid #DBDBDB;">
						<!-- 로그인한 회원 이름 -->
						<div style="margin: 50px; font-weight: 600; cursor: pointer;">
							<%=session.getAttribute("MEM_NAME") %>
						</div>
						<div id="addChatRoom" style="justify-content: flex-end;">
							<img style="height: 24px; cursor: pointer;" src="resources/image/add_friend.png">
						</div>
					</div>
					<!-- 상단 메뉴1 end -->
					<!-- 채팅방 리스트 start -->
					<form id="chatRoom" name="chatRoom" method="post">
					<div class="chat_roomList" id="chatRoomList">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@ chatRoomList 삽입 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					</div>
					<!-- 채팅방 리스트 end -->
					</form>
				</div>
				<!-- 채팅방 end -->
			
				<!-- 채팅 내용 영역 start -->
				<div class="chat_chat" style="background-color: #fff; height: 100%; width: calc(100% - 350px); min-width: 400px;">
				
					<!-- 상단 메뉴2 start -->
					<div style="background-color: #fff; height: 60px; width: 100%; display: flex; flex-direction:column; justify-content: center; padding: 0 20px; border-bottom: 1px solid #DBDBDB;">
						<div style="display: flex; justify-content: space-between;">
							<div style="display: flex; justify-content: flex-start;">
								<div>
									<img style="margin-right: 20px; border-radius: 50%; height: 30px; cursor: pointer;" src="resources/image/profile_05.jpg">
								</div>
								<div class="chat_otherName" id="chatOtherName">
									<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@ 채팅대상의 이름 입력되는 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@ -->
								</div>
							</div>
							<div style="justify-content: flex-end;">
								<img style="height: 24px; cursor: pointer;" src="resources/image/icon_information.png">
							</div>
						</div>	
					</div>
					<!-- 상단 메뉴2 end -->
					
					<!-- 대화 내용 start -->
					<div class="chat_content" id="chatContent">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@ showChatList() 입력되는 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@ -->	
					</div>
					<!-- 대화 내용 end -->
					
					<!-- 메시지 입력 창 start-->
					<form id="addMessage" name="addMessage" method="post">
					<div class="chat_addMessage">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@ 채팅입력창 입력되는 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
						<!-- <div class="chat_addMessageArea"> -->
							<!-- <div>
								<img style="height: 20px; width: 20px; cursor: pointer;" src="resources/image/icon_emoticon.png">
								<input type="text" class="chat_input" id="CHAT_CONTENT" name="CHAT_CONTENT" placeholder="메시지 입력..."/>
							</div>
							<div>
								<button type="button" class="chat_send" id="chat_send" name="chat_send">보내기</button>
							</div>
						</div> -->
					</div>
					<input type="hidden" id="CHAT_MYID" name="CHAT_MYID" value="<%=session.getAttribute("MEM_ID") %>"/>
					<div id="chatTarget">
						<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@ 채팅 상대 입력되는 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
					</div>
					</form>
					<!-- 메시지 입력 창 end-->
					
				</div>
				<!-- 채팅 내용 영역 end -->
			</div>
		</div>
	</div>

	<!-- 모달 start -->
	<div class="modal_overlay" id="modal_overlay">
		<div class="chat_friend_modal" id="modal1">
			<div class="result_menu" style="display: flex; flex-direction: row; position:fixed; width: 95%; height: 50px; border-bottom: 1px solid #DBDBDB; top:0; z-index: 1; background-color: #fff; justify-content: center; align-items: center;">
				<div>
					새로운 채팅
				</div>
				<div id="writeNewMsg" style="position: absolute; right: 10px;">
					<img style="height: 20px; width: 20px; cursor: pointer;" src="resources/image/icon_write.png">
				</div>
			</div>
			<div style="display: flex; position:relative; height:20px; top: 50px;">
				친구 목록
			</div>
			<!-- 친구 리스트 start-->
			<div class="chat_friendList" id="chatFriendList">
				<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@ showFriendList() 입력되는 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@ -->
			</div>
			<!-- 친구 리스트 end -->
		</div>
	</div>
	<!-- 모달 end -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
		crossorigin="anonymous">
	</script>

</body>

<!-- jquery -->
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/jquery.session.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->

<script type="text/javascript"> /* window 시작 시 */

	//웹소켓 객체 생성
	var webSocket = new WebSocket("ws://localhost:8090/roomie/roomieChat");
	
	//웹소켓 연결 시, 일반세션이 존재하면 웹소켓세션을 다시 생성요청(ChatServer) 
	webSocket.onopen = function() {
		if('<%=session.getAttribute("MEM_ID")%>' != ""){
			webSocket.send('1#' + '<%=session.getAttribute("MEM_ID")%>' + '#1');
		}else{
			/* 로그인 페이지로 이동. */
		}
	}
	
	//페이지가 닫히기 직전에 일반세션의 아이디를 키값으로 갖는 웹소켓세션을 삭제요청(ChatServer)
	window.onbeforeunload = function() {
		if("<%=session.getAttribute("MEM_ID")%>" != ""){
			webSocket.send('3#' + "<%=session.getAttribute("MEM_ID")%>" + '#1');
		}
	}
	
	//웹소켓(ChatServer)에서 메시지를 전송받았을때 실행
	webSocket.onmessage = function(message){
		var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>';
		var messageNotification = '<img style="width: 10px; height: 10px;" src="resources/image/icon_notification1.png">';
		var wsMsg = "";
		// ex) 2#받는사람#보내는사람#안녕하세요
		var msgIndex1 = message.data.indexOf("#",2); //2번째 #의 인덱스.
		var msgIndex2 = message.data.indexOf("#",msgIndex1 + 1) //3번째 #의 인덱스.
		var sender = message.data.substring(msgIndex1 + 1,msgIndex2); //보낸사람 아이디.
		var senderId = sender.replace(/[.@]/g, ""); //email형식의 아이디에서 @와 .을 제거하고 사용.
		
		var newChatContentId = senderId + "chatContent"; //메시지를 보낸 상대와의 채팅방.
		
		var chatScroll = document.getElementById(newChatContentId);
		
		var msg = message.data.substring(msgIndex2 + 1); //메시지
		
		var notifId = "notif" + senderId;
		
		/* chatRoomList 불러오기 */
		$.ajax({
			  url : "chatRoomList.ya"
			, type : 'POST'
			, data : {"MEM_ID" : MEM_ID}
			, dataType : 'json'
			, success: function(result){
				
				chatRoomList(result);
				
				wsMsg += 		'<div class="chat_otherMsgBox">';
				wsMsg += 			'<div class="chat_otherMsg">';
				wsMsg += 				msg
				wsMsg += 			'</div>';
				wsMsg += 		'</div>';
				
				$("#" + newChatContentId).append(wsMsg);
				
				if(document.getElementById(newChatContentId)){ //특정 요소가 존재하는지 확인
					/* 메시지를 보낸 상대와의 채팅방이 이미 열려있는 상태일 땐 메시지알림아이콘을 띄우지 않는다. */
					chatScroll.scrollTop = chatScroll.scrollHeight; /* 스크롤 가장 아래로 */
					
				}else{
					$("#" + notifId).html(messageNotification); //id를 notif + "아이디(eamil의 @ 앞 부분)"으로 설정한 자식위치에 messageNotification 주입.	
				}

			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
		
	};

$(window).on('load',function (){
	webSocket.onerror = function(message){ wsError(message);};
	/* 웹소켓 연결 종료 시 메시지 */
	function wsClose(message){
		console.log("disconnect", message);
	}
	/* 에러 시 메시지 */
	function wsError(message){
		console.log("error", message);
	}
	/* 웹소켓 연결 종료 */
	function wsCloseConnection(){
		webSocket.close();
	}
	
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	/* chatRoomList 불러오기 */
	$.ajax({
		  url : "chatRoomList.ya"
		, type : 'POST'
		, data : {"MEM_ID" : MEM_ID}
		, dataType : 'json'
		})
		.done(function(result){
			chatRoomList(result);
		})
		.fail(function(error) {
		    alert("실패");
		    console.log("에러 : " + error);
		});
});
</script>

<script> /* chatRoomList() 채팅룸을 불러오는 함수 */
function chatRoomList(result){
	var htmls = "";
	var htmlsMobile	= "";
		
		//ChatController의 chatRoomList에서 반송된 List<Map>형식의 데이터를 2중 for문을 통해 사용.
		for(var i=0; i<result.length; i++){
			var map = result[i]; // List<Map>의 i번째 Map을 나타내는 객체 map
			for(var key in map){ // 해당 map의 Key를 나타내는 객체 key
				if(key == "CHAT_OTHERID"){
				console.log("chatRoom: " + result[i]);
				var notifId = "notif" + result[i]["CHAT_OTHERID"].replace(/[.@]/g, "");
				
				var otherId = result[i]["CHAT_OTHERID"].replace(/[.@]/g, "");
				
				<!-- PC화면일때 보여지는 채팅룸 -->
				htmls += '<div class="chat_profile" data-id="' + result[i]["CHAT_OTHERID"] +'" data-name="' + result[i]["CHAT_OTHERNAME"] + '" data-index="chatRoom' + i + '" style="position: relative">';
				htmls += '<!-- 채팅상대 profile img -->';
				htmls += 	'<div>';
				htmls += 		'<img class="chat_profileImg" src="resources/image/profile_05.jpg">';
				htmls += 	'</div>';
				htmls += 	'<!-- 채팅상대  -->';
				htmls += 	'<div>';
				htmls += 		'<div>';
				htmls += 			result[i]["CHAT_OTHERID"];
				htmls += 		'</div>';
				htmls += 		'<div class="chat_profileCont">';
				htmls +=			'<div id="lastMsg" class="chat_profileMsg">';
				htmls +=			result[i]["CHAT_CONTENT"];
				htmls +=			'</div>';
				htmls +=			'<div class="chat_profileDate">';
				htmls +=				result[i]["CHAT_DATE"];
				htmls +=			'</div>';
				htmls +=		'</div>';
				htmls +=	'</div>';
				htmls +=	'<div class="chat_notification" id="' + notifId + '" style="position: absolute; top: 50%; right: 10px; transform: translate(0, -50%);">';
				htmls +=		'<img style="width: 10px; height: 10px;" src="">';
				htmls +=	'</div>';
				htmls += '</div>';
				
				<!-- 모바일화면일때 보여지는 채팅룸 -->
				htmlsMobile +=	'<li class="sub_story" data-id="' + result[i]["CHAT_OTHERID"] + '" data-index="chatRoom' + i + '">';
				htmlsMobile +=		'<div class="text">';
				htmlsMobile +=			'<a onclick=""><img src="' + 'resources/image/profile_02.jpg' + '" alt="프로필"></a>';
				htmlsMobile +=			'<span style="font-size: 12px; margin-left: 3px;">' + otherId + '</span>';
				htmlsMobile +=		'</div>';
				htmlsMobile +=	'</li>';
				
				}
			}
		}
		
	$("#chatRoomList").html(htmls); //id="chatRoomList"인 요소 하위에 htlmls 추가.
	$("#chatRoomListMobile").html(htmlsMobile); //id="chatRoomListMobile"인 요소 하위에 htmlsMobile 추가.
	
	var MEM_ID = '<%=(String) session.getAttribute("MEM_ID")%>';
	
	<!-- 메시지를 보낸사람과의 채팅창이 열려있을때 실행 start -->
	////id="chatContent"인 요소의 하위 요소중 class가 .chat_content2인 요소가 존재하면,
	if(document.querySelector("#chatContent .chat_content2")){
		var newChatContentId = document.querySelector("#chatContent .chat_content2").id; //id="chatContent"인 요소의 하위 요소중 class가 .chat_content2인 요소의id값을 나타내는 객체 newChatContentId
		if(document.getElementById(newChatContentId)){ //특정 요소가 존재하는지 확인
			/* 메시지를 보낸 상대와의 채팅방이 이미 열려있는 상태일 땐 DB에서 해당 알림데이터 삭제 */
			
			var notifData3 = {
					"CHAT_MYID" : MEM_ID
					,"CHAT_OTHERID" : newChatContentId
					, "TYPE" : 3
					};
				
				$.ajax({
					  url : "roomNotif.ya"
					, type : 'POST'
					, data : notifData3
					, dataType : 'json'
					, success: function(result){
						
						/* roomNotif에서 클릭한 대상에대한 알림 데이터 삭제. */
					}
					, error: function(error){
						alert("실패");
						console.log("에러 : " + error);
					}
				});
				
		}
	}
	<!-- 메시지를 보낸사람과의 채팅창이 열려있을때 실행 end -->
	
	<!-- 자신에게 존재하는 메시지알림을 채팅룸에 아이콘으로 표시 start -->
	var notifData2 = {
		"CHAT_MYID" : MEM_ID
		, "TYPE" : 2
		};
	
		$.ajax({
			  url : "roomNotif.ya"
			, type : 'POST'
			, data : notifData2
			, dataType : 'json'
			, success: function(result){
				
				addNotifMsg(result);
				
			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
	<!-- 자신에게 존재하는 메시지알림을 채팅룸에 아이콘으로 표시 end -->
	
}
</script>

<script> /* addNotifMsg() chatRoomList에 메시지 알림표시를 추가해주는 함수 */

function addNotifMsg(result){
	
	for(var i=0; i<result.length; i++){
		
		var senderId = "notif" + result[i]["NOTIFMSG_SENDER"].replace(/[.@]/g, "");
		var messageNotification = '<img style="width: 10px; height: 10px;" id="notifIcon" src="resources/image/icon_notification1.png">';
		$("#" + senderId).html(messageNotification); //id를 notif + "아이디"으로 설정한 자식위치에 messageNotification 주입.
		
		}
	}

</script>

<script> /* showChatList() 채팅리스트를 불러오는 함수 */
function showChatList(result){
	
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	var htmls = "";
	var newChatContentId = document.querySelector("#chatContent .chat_content2").id; //id="chatContent"인 요소의 하위 요소중 class가 .chat_content2인 요소의id값을 선택.
	var escapedNewChatContentId1 = newChatContentId.replace("\@", "\\@");
	var escapedNewChatContentId2 = escapedNewChatContentId1.replace("\.", "\\.");
	
	//result에 담긴 list 항목만큼 반복.
	for(var i=0; i<result.length; i++){
		var map = result[i];		
		for(var key in map){
			//채팅 메시지를 보낸사람에 따라서 출력.
			if(key == "CHAT_OTHERID"){
				// 메시지를 입력한 사람의 id가 자신과 같으면 오른쪽에, 자신과 다르면 왼쪽에 표시되도록 분류.
				if(MEM_ID == result[i]["CHAT_OTHERID"]){
						htmls += 		'<div class="chat_otherMsgBox">';
						htmls += 			'<div class="chat_otherMsg">';
						htmls += 				result[i]["CHAT_CONTENT"];
						htmls += 			'</div>';
						htmls += 		'</div>';
					}else{
						htmls += 		'<div class="chat_myMsgBox">';
						htmls += 			'<div class="chat_myMsg">';
						htmls += 				result[i]["CHAT_CONTENT"];
						htmls += 			'</div>';
						htmls += 		'</div>';
					}
				$("#" + escapedNewChatContentId2).html(htmls); //채팅 상대방의 채팅영역에 채팅내용을 입력.
				
				var chatScroll = document.getElementById(newChatContentId);
				chatScroll.scrollTop = chatScroll.scrollHeight; /* 스크롤 가장 아래로 */
			}
		}
	}
}
</script>

<script> /* showFriendList() 친구리스트를 불러오는 함수 */
function showFriendList(result){
	
	var MEM_ID = '<%=(String) session.getAttribute("MEM_ID")%>';
	var htmls = "";
	var empty = "";
	
	for(var i=0; i<result.length; i++){
		if(result[i]["MEM_ID"] == MEM_ID){ //나 자신이면 출력하지 않음.
		}else{
			// 이스케이프 처리 후 id 문자열
			var escapedEmailId = result[i]["MEM_ID"].replace(/[.@]/g, "");

			htmls +=	'<div class="chat_friend" id="' + result[i]["MEM_ID"] + '">';
			htmls +=		'<div style="display:flex; flex-direction: row;">';
			htmls +=			'<img class="chat_friendProfile" src="resources/image/profile_05.jpg">';
			htmls +=		'</div>';
			htmls +=		'<div>';
			htmls +=			'<div>';
			htmls +=				result[i]["MEM_ID"];
			htmls +=			'</div>';
			htmls +=			'<div style="font-size: 15px; color: gray;">';
			htmls +=				result[i]["MEM_NAME"] ;
			htmls +=			'</div>';
			htmls +=		'</div>';
			htmls +=		'<div>';
			htmls +=			result[i]["MEM_MBTI"] ;
			htmls +=		'</div>';
			htmls +=	'</div>';
			
			$("#chatFriendList").html(htmls);
		}
	}

	/* 글 작성 아이콘 클릭 시, 색이 변한 대상을 대상으로 글쓰기가 가능하도록 채팅창을 띄움 */
	$("#writeNewMsg").click(function(e){ //글작성아이콘 클릭 시,
		var selectedFriendId = document.querySelector(".chat_friend_clicked").id;
		var escapedSelectedFriendId = selectedFriendId.replace(/[.@]/g, "");
		var newChatContent = "";
		var sendTarget = ""; /* 프로필 클릭 시 채팅입력 대상을 변경하기 위한 변수 */
		var newChatContentId = escapedSelectedFriendId + "chatContent";
		
		<!-- 새로운 상대와 채팅할 영역을 chatContent 하위에 추가 start  -->
		newChatContent += '<div class="chat_content2" id="' + selectedFriendId + '">';
		newChatContent += '</div>'
		
		$("#chatContent").html(newChatContent); //newChatContent를 chatContent 하위요소로 추가
		<!-- 새로운 상대와 채팅할 영역을 chatContent 하위에 추가 end  -->
		
		<!-- className이  "chat_friend_clicked"인 객체의 아이디값을 전송 start -->
		sendTarget += '<input type="hidden" id="CHAT_OTHERID" name="CHAT_OTHERID" value="';
		sendTarget +=	selectedFriendId;
		sendTarget += '"/>';
		
		$("#chatTarget").html(sendTarget); // 채팅입력 form에서 채팅상대를 나타내는 CHAT_OTHERID를 클릭한 친구로 변경		
		<!-- className이  "chat_friend_clicked"인 객체의 아이디값을 전송 end -->
		
		$("#chatOtherName").html(selectedFriendId);// 채팅영역의 프로필에 id표시
		$("#modal_overlay").css('display', 'none'); // 모달창 끄기
		$("#" + newChatContentId).html(empty); // 채팅창 비우기
		
	});
}
</script>

<script> /* 채팅 보내기버튼을 클릭했을 때 실해되는 기능 */
$(addMessage).on('click', '#chat_send', function(){
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	var CHAT_MYID = $('#CHAT_MYID').val();
	var CHAT_OTHERID = $('#CHAT_OTHERID').val();
	var CHAT_CONTENT = $('#CHAT_CONTENT').val();
	var chatContent = document.getElementById('CHAT_CONTENT'); // 입력한 내용을 삭제할 text input의 id값으로 객체 생성.
	var paramData = {
			"CHAT_MYID" : CHAT_MYID
			, "CHAT_OTHERID" : CHAT_OTHERID
			, "CHAT_CONTENT" : CHAT_CONTENT
		};
	var notifData1 = {
			"CHAT_MYID" : CHAT_MYID
			, "CHAT_OTHERID" : CHAT_OTHERID
			, "CHAT_CONTENT" : CHAT_CONTENT
			, "TYPE" : 1
		};

	if(chatContent.value == ""){ //입력한 채팅내용이 없는 경우
		chatContent.focus();//채팅 입력창으로 포커스.
		return;
	}else{ //입력한 내용이 있을 경우
		$.ajax({
		    url: "addMessage.ya",
		    type: 'POST',
		    data: paramData,
		    dataType: 'json'
		})
		.done(function(result) {
		    showChatList(result);
		    chatRoomListCallback();
		})
		.fail(function(error) {
		    alert("실패");
		    console.log("에러 : " + error);
		});

		function chatRoomListCallback() {
		    $.ajax({
		        url: "chatRoomList.ya",
		        type: 'POST',
		        data: {"MEM_ID": MEM_ID},
		        dataType: 'json'
		    })
		    .done(function(result) {
		        chatRoomList(result);
		     	// 웹소켓으로 메시지를 보내는 코드를 현재 위치로 지정한 이유.
		        // <webSocket.send는 addMessage가 완료된 후에 실행되어야한다.>
		        // webSocket.send를 바깥영역에 배치할 경우, addMessage가 완료되기전에 메시지를 받는쪽의 chatRoomList가 먼저 실행되는 문제가 발생할 수 있다.
		        // 그럴경우 최근에 받은 메시지가 chatRoomList에 반영되지 않아서 가장 위로 올라가지 않는 문제가 발생할 수 있다.
				webSocket.send("2#" + CHAT_OTHERID + "#" + CHAT_MYID + "#" + CHAT_CONTENT); //chatServer의 onMessage로 OTHERID와 MYID와 CONTENT를 보낸다.(ex_"2#받는사람&보내는사람#안녕하세요")
		        
		        roomNotifCallback();
		    })
		    .fail(function(error) {
		        alert("실패");
		        console.log("에러 : " + error);
		    });
		}

		function roomNotifCallback() {
		    $.ajax({
		        url: "roomNotif.ya",
		        type: 'POST',
		        data: notifData1,
		        dataType: 'json'
		    }).done(function(result) {
		        /* NOTIFMSG에 데이터만 주입 */
		    }).fail(function(error) {
		        alert("실패");
		        console.log("에러 : " + error);
		    });
		}
	}
	
	chatContent.value = ""; //해당 요소(입력한 채팅)의 내용을 삭제.
	
	chatContent.focus(); //채팅 입력창 포커스.
	
});
</script>

<script> /* 채팅룸(프로필) 선택 시 Controller로 CHAT_OTHERID 전송하고 받아온 데이터로 showChatList() 실행 */
$(document).on("click", ".chat_profile, .sub_story",function(e){
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	
	e.preventDefault();
	var clickId = e.currentTarget.dataset.id; //클릭한 대상의 id를 나타내는 객체.
	
	var escapedClickId = clickId.replace(/[.@]/g, "");
	
	var clickNotifId = "notif" +  escapedClickId; //알림 아이콘이 들어가는 위치의 id값을 나타내는 객체.
	
	<!-- chatContent 하위에 상대방에 따른 새로운 newChatContent 생성 start -->
	var newChatContentId = escapedClickId + "chatContent"; //newChatContent의 id로 적용할 객체.
	
	var newChatContent = "";
	newChatContent += '<div class="chat_content2" id="' + newChatContentId + '">';
	newChatContent += '</div>'
	
	$("#chatContent").html(newChatContent); //newChatContent를 chatContent 하위요소로 추가
	<!-- chatContent 하위에 상대방에 따른 새로운 newChatContent 생성 end -->
	
	<!-- 채팅대상을 변경하는 기능 start -->
	var sendTarget = ""; // 채팅룸 클릭 시 채팅입력 대상을 변경하기 위한 객체.
	
	sendTarget += '<input type="hidden" id="CHAT_OTHERID" name="CHAT_OTHERID" value="';
	sendTarget +=	clickId;
	sendTarget += '"/>';
	
	$("#chatTarget").html(sendTarget); //채팅입력 form에 채팅상대인 CHAT_OTHERID를 클릭 한 대상으로 지정
	
	var clickName = e.currentTarget.dataset.name; //클릭한 대상의 name을 나타내는 객체.
	
	$("#chatOtherName").html(clickName); //채팅영역의 프로필에 name표시
	<!-- 채팅대상을 변경하는 기능 end -->

	<!-- 클릭한 대상과의 채팅 내용을 불러옴 start -->
	$.ajax({
		  url : "chatRoom.ya"
		, type : 'POST'
		, data : {"CHAT_OTHERID" : clickId }
		, dataType : 'json'
		, success: function(result){
			
			showChatList(result);
			
		}
		, error: function(error){
			alert("실패");
			console.log("에러 : " + error);
		}
	});
	<!-- 클릭한 대상과의 채팅 내용을 불러옴 end -->
	
	<!-- 선택한 채팅방의 알림 아이콘을 제가하는 기능 start -->
	if(e.currentTarget.querySelector("#" + clickNotifId).querySelector("#notifIcon")){ //선택한 chatRoom에 알림 아이콘이 존재할 경우.
		
		var notifData3 = {
				"CHAT_MYID" : MEM_ID
				,"CHAT_OTHERID" : clickId
				, "TYPE" : 3
				};
			
			$.ajax({
				  url : "roomNotif.ya"
				, type : 'POST'
				, data : notifData3
				, dataType : 'json'
				, success: function(result){
					// roomNotif에서 클릭한 대상에대한 알림 데이터 삭제.
				}
				, error: function(error){
					alert("실패");
					console.log("에러 : " + error);
				}
			});
		
		}
	<!-- 선택한 채팅방의 알림 아이콘을 제가하는 기능 end -->
		
	<!-- 알림 아이콘 삭제 start -->
	var deleteNotif = '<img style="width: 10px; height: 10px;" src="">'; //채팅룸 리스트에서 알림 아이콘을 삭제하기 위한 객체.
	
	$("#" + clickNotifId).html(deleteNotif); //알림 아이콘을 삭제.
	<!-- 알림 아이콘 삭제 end -->
	
	<!-- 채팅입력창 추가 start -->
	var htmls = "";
	htmls += 	'<div class="chat_addMessageArea">';
	htmls +=			'<div>';
	htmls +=				'<img style="height: 20px; width: 20px; cursor: pointer;" src="resources/image/icon_emoticon.png">';
	htmls +=				'<input type="text" class="chat_input" id="CHAT_CONTENT" name="CHAT_CONTENT" placeholder="메시지 입력..."/>';
	htmls +=			'</div>';
	htmls +=			'<div>';
	htmls +=				'<button type="button" class="chat_send" id="chat_send" name="chat_send">보내기</button>';
	htmls +=			'</div>';
	htmls +=		'</div>';
	
	$(".chat_addMessage").html(htmls);
	<!-- 채팅입력창 추가 end -->
	
});

</script>

<script> /* 채팅추가 아이콘을 클릭 시 친구목록 띄우기 */
var addChatRoom = document.querySelectorAll("#addChatRoom");
$(addChatRoom).click(function(e){
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	$("#modal_overlay").css('display', 'flex'); /* 모달창 띄우기 */
	
	e.preventDefault();
	
	/* 로그인한(session) 아이디를 Controller로 보내서 친구리스트 불러오기 */
	$.ajax({
		  url : "showFriend.ya"
		, type : 'POST'
		, data : {"CHAT_MYID" : MEM_ID }
		, dataType : 'json'
		, success: function(result){
			
			showFriendList(result);
			
			//친구리스트 클릭 시 다른 버튼 비활성
			//ClassName이 chat_friend인 모든 객체를 가져온다.
			$('.chat_friend').click(function(e){
				// 이스케이프 처리 후 id 문자열
				var escapedGetId = e.currentTarget.id.replace(/[.@]/g, "");
				//클릭한 버튼에 chat_friend_clicked 클래스 추가.
				$('.chat_friend[id ="' + e.currentTarget.id + '"]').addClass('chat_friend_clicked');
				//나머지 버튼에는 chat_friend_clicked 클래스 삭제.
				$('.chat_friend[id !="' + e.currentTarget.id + '"]').removeClass('chat_friend_clicked');
			});
			
		}
		, error: function(error){
			alert("실패");
			console.log("에러 : " + error);
		}
	});
});
	
	//modal_overlay 클릭 시 모달창 끄기.(모달창 이외의 배경)
	//모달오버레이를 지정하는 객체 modalOverlay 선언.
	var modalOverlay = document.getElementById("modal_overlay");
	//모달오버레이를 클릭 시 closeModal 이벤트 발생.
	modalOverlay.addEventListener('click', closeModal);
	
	function closeModal(e) {
		
		var target = e.target;
		
		if(target == modal_overlay){ //클릭한 요소의 class가 modal_overlay일 경우 모달창 끄기, 아닐경우 변화없음.
			$("#modal_overlay").css('display', 'none');
		}
	}
</script>

<!-- 프로필 슬라이드 -->
  <script>
    const story_list = document.querySelector('.story_list'); //전체 슬라이드 컨테이너
    const story_slideImg = document.querySelectorAll('.story_list li'); //모든 슬라이드들
    let story_currentIdx = 0; //현재 슬라이드 index
    const story_slideCount = story_slideImg.length; // 슬라이드 개수
    const story_prev = document.querySelector('.prev'); //이전 버튼
    const story_next = document.querySelector('.next'); //다음 버튼
    const story_slideWidth = 485; //한개의 슬라이드 넓이
    const story_slideMargin = 0; //슬라이드간의 margin 값

    //전체 슬라이드 컨테이너 넓이 설정
    story_list.style.width = (story_slideWidth + story_slideMargin) * story_slideCount + 'px';

    function story_moveSlide(num) {
      story_list.style.left = -num * 485 + 'px';
      story_currentIdx = num;
    }

    story_prev.addEventListener('click', function () {
      /*첫 번째 슬라이드로 표시 됐을때는 
      이전 버튼 눌러도 아무런 반응 없게 하기 위해 
      currentIdx !==0일때만 moveSlide 함수 불러옴 */
      if (story_currentIdx !== 0) story_moveSlide(story_currentIdx - 1);
    });

    story_next.addEventListener('click', function () {
      /* 마지막 슬라이드로 표시 됐을때는 
      다음 버튼 눌러도 아무런 반응 없게 하기 위해
      currentIdx !==slideCount - 1 일때만 
      moveSlide 함수 불러옴 */
      if (story_currentIdx !== story_slideCount - 1) {
        story_moveSlide(story_currentIdx + 1);
      }
    });
  </script>

	<!-- 세션 관련 JavaScript Start -->
	<script> /* 페이지에 머무르는동안 세션연장을 요청하는 코드이므로, 모든 jsp에 포함시킨다. */
	//일반세션의 타임아웃을 연장하기 위해 서버로 요청하는 코드.
	function keepSessionAlive() {
		
	    $.ajax({
			  url : "keepSessionAlive.ya"
			, success: function(result){
				console.log("세션 연장 요청");
	            setTimeout(keepSessionAlive, 10*60000); // 10분마다 서버와 통신하도록 설정
			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
	}

	//일반세션의 0임아웃을 연장하기 위해 서버로 요청하는 코드.
	$(function() {
	    setTimeout(keepSessionAlive, 10*60000); // 10분마다 서버와 통신하도록 설정
	});
	
	//웹소켓세션의 타임아웃을 연장하기 위해 chatServer로 요청을 보내는 코드.
	setInterval(function() {
		webSocket.send("4#");
		console.log("웹소켓세션 연장 요청");
	}, 10*60000); // 10분마다 서버와 통신하도록 설정
	
	</script>
	<!-- 세션 관련 JavaScript End -->

</html>