<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="utf-8">
<head>
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
		height: cacl(100% - 90px);
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

}

.chat_input:focus{
	outline: none;
}

.chat_send{
	color: skyblue;
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
	 margin: 10x 0;
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
		
			<button type="button" onClick="location.href='testLogout.ya'">로그아웃</button>
		
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@임시 로그아웃 버튼@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->

	<!-- 상단 내비게이션 바 시작 -->
	<div style="display: flex; justify-content: center;">
		<div style="display: flex; flex-wrap: inherit; align-items: center; justify-content: space-between; width: 935px;">
			<img class="navbar-brand" style="height: 40px; object-fit: contain;" src="resources/image/roomie_logo_1.png">
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
		
		<!-- 
		스토리 시작
		<div class="story_body">
			왼쪽 버튼
			<div class="prev" style="cursor:pointer; display: flex; align-items: center;"><img src="resources/image/icon_27.png"></div>
				스토리
				<div class="story">
				  <ul class="story_list">
				    <li class="sub_story">
				      <div class="text">
				        <a onclick="href='#'"><img src="resources/image/profile_01.jpg" alt="프로필"></a>
				        <span style="font-size: 12px; margin-left: 3px;">yeongjun</span>
				      </div>
				    </li>
				    <li>
				      <div class="sub_story">
				        <div class="text">
				          <img src="resources/image/profile_02.jpg" alt="프로필">
				          <span  style="font-size: 12px; margin-left: 3px;">junseok</span>
				        </div>
				      </div>
				    </li>
				    <li>
				      <div class="sub_story">
				        <div class="text">
				          <img src="resources/image/profile_03.jpg" alt="프로필">
				          <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
				        </div>
				      </div>
				    </li>
				    <li>
				      <div class="sub_story">
				        <div class="text">
				          <img src="resources/image/profile_04.jpg" alt="프로필">
				          <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
				        </div>
				      </div>
				    </li>
				    <li>
				      <div class="sub_story">
				        <div class="text">
				          <img src="resources/image/profile_05.jpg" alt="프로필">
				          <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
				        </div>
				      </div>
				    </li>
				  </ul>
				</div>
			오른쪽 버튼
			<div class="next" style="cursor:pointer; display: flex; align-items: center;"><img src="resources/image/icon_26.png"></div>
		</div>	
	스토리 끝
	 -->
	<!-- 채팅방 start-->
	<div class="chat_box">
		<div class="chat_list" style="background-color: #fff; height: 100%; width: 350px; border-right: 1px solid #DBDBDB;">
			<!-- 상단 메뉴1 start -->
			<div style="background-color: #fff; height: 60px; width: 100%; display: flex; align-items: center; justify-content: center; border-bottom: 1px solid #DBDBDB;">
				<!-- 로그인한 회원 아이디 -->
				<div style="margin: 50px; font-weight: 600; cursor: pointer;">
					<%=session.getAttribute("MEM_ID") %>
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
						<div class="chat_otherId" id="chatOtherId">
							<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@ 채팅대상의 아이디가 입력되는 구간 @@@@@@@@@@@@@@@@@@@@@@@@@@ -->
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
			<div style="display: flex; height: 60px; padding: 20px; bottom: 0; background-color: #fff; align-items: center; ">
				<div style="display: flex; height: 35px; border: solid 1px #DBDBDB; border-radius: 17.5px; padding: 0 20px; align-items: center; width: 100%; justify-content: space-between;">				
					<div>
						<img style="height: 20px; width: 20px; cursor: pointer;" src="resources/image/icon_emoticon.png">
						<input type="text" id="CHAT_CONTENT" name="CHAT_CONTENT" class="chat_input" style="color: gray; font-size: 12px; border: 0; margin-left: 20px;" placeholder="메시지 입력..."/>
					</div>
					<div>
						<button type="button" class="chat_send" id="chat_send" name="chat_send" style="border: 0; background-color: transparent; font-size: 12px; font-weight: 600;">보내기</button>
					</div>
				</div>
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
<script src="resources/js/jquery.min.js"></script>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-latest.js"></script> -->

<script type="text/javascript"> /* window 시작 시 */
/* @@@@@@@@@@@@@@@@@@@@@ 웹소켓 관련 @@@@@@@@@@@@@@@@@@@@@ */
var webSocket = new WebSocket("ws://localhost:8090/roomie/roomieChat");
var echoText = document.getElementById("echoText");
var message = document.getElementById("message");
webSocket.onopen = function(message){ wsOpen(message);};
webSocket.onmessage = function(message){ 
	
	var wsMsg = "";
	
	wsMsg += 		'<div class="chat_otherMsgBox">';
	wsMsg += 			'<div class="chat_otherMsg">';
	wsMsg += 				message.data
	wsMsg += 			'</div>';
	wsMsg += 		'</div>';
	
	$("#chatContent").append(wsMsg);
	chatScroll.scrollTop = chatScroll.scrollHeight; /* 스크롤 가장 아래로 */
	
};

function wsOpen(message){
	webSocket.send('1#' + <%=session.getAttribute("MEM_ID")%> + '#1');
	}

/* @@@@@@@@@@@@@@@@@@@@@ 웹소켓 관련 @@@@@@@@@@@@@@@@@@@@@ */
$(window).on('load',function (){
	/* @@@@@@@@@@@@@@@@@@@@@ 웹소켓 관련 @@@@@@@@@@@@@@@@@@@@@ */
	
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
	
	/* @@@@@@@@@@@@@@@@@@@@@ 웹소켓 관련 @@@@@@@@@@@@@@@@@@@@@ */
	
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>' 
	
	/* chatRoomList 불러오기 */
	$.ajax({
		  url : "chatRoomList.ya"
		, type : 'POST'
		, data : {"MEM_ID" : MEM_ID}
		, dataType : 'json'
		, success: function(result){
			
			chatRoomList(result);
			
			$("div[data-index='chatRoom0']").click();/* 시작 시 가장 윗쪽의 프로필을 자동 클릭 */

		}
		, error: function(error){
			alert("실패");
			console.log("에러 : " + error);
		}
	});
	
});
</script>

<script> /* chatRoomList() 채팅룸을 불러오는 함수 */
function chatRoomList(result){
	
	var htmls = "";
	var htmlsMobile	= "";
	
		for(var i=0; i<result.length; i++){
			var map = result[i]; /* List<Map>의 i번째 map 객체 */
			for(var key in map){ /* map에 존재하는 key */
				if(key == "CHAT_OTHERID"){
				console.log("chatRoom: " + result[i]);
				htmls += '<div class="chat_profile" data-id="' + result[i]["CHAT_OTHERID"] + '" data-index="chatRoom' + i + '">';
				htmls += '<!-- 채팅상대 profile img -->';
				htmls += 	'<div>';
				htmls += 		'<img class="chat_profileImg" src="resources/image/profile_05.jpg">';
				htmls += 	'</div>'
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
				htmls += '</div>';
				
				htmlsMobile +=	'<li class="sub_story" data-id="' + result[i]["CHAT_OTHERID"] + '" data-index="chatRoom' + i + '">';
				htmlsMobile +=		'<div class="text">';
				htmlsMobile +=			'<a onclick=""><img src="' + 'resources/image/profile_02.jpg' + '" alt="프로필"></a>';
				htmlsMobile +=			'<span style="font-size: 12px; margin-left: 3px;">' + result[i]["CHAT_OTHERID"] + '</span>';
				htmlsMobile +=		'</div>';
				htmlsMobile +=	'</li>';
				
				}
			}
		}
	$("#chatRoomList").html(htmls);
	$("#chatRoomListMobile").html(htmlsMobile);
}
</script>

<script> /* showChatList() 채팅리스트를 불러오는 함수 */
//채팅 출력 시 스크롤을 가장 아래로 위치시키기위한 객체
var chatScroll = document.getElementById("chatContent");
function showChatList(result){
	
	var htmls = "";
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	
	
	htmls += '<div class="chat_date">';
	htmls +=	'(마지막으로 메시지를 주고받은 날짜표시) 매일 정각마다 추가. (추가)';
	htmls += '</div>';
	//result에 담긴 list 항목만큼 반복.
	for(var i=0; i<result.length; i++){
		var map = result[i];		
		for(var key in map){
			//채팅 메시지를 보낸사람에 따라서 출력.
			if(key == "CHAT_OTHERID"){
				var test = result[i]["CHAT_OTHERID"];
				if(MEM_ID == test){
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
				$("#chatContent").html(htmls);
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
	
	//result에 담긴 list 항목만큼 반복.
	for(var i=0; i<result.length; i++){
		if(result[i]["MEM_ID"] == MEM_ID){
			//나 자신이면 출력하지 않음.
		}else{
			htmls +=	'<div class="chat_friend" id="' + result[i]["MEM_ID"] + '">';
			htmls +=		'<div style="display:flex; flex-direction: row;">';
			htmls +=			'<img class="chat_friendProfile" src="resources/image/profile_05.jpg">';
			htmls +=		'</div>';
			htmls +=		'<div>';
			htmls +=			'<div>';
			htmls +=				result[i]["MEM_ID"] ;
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
	
	/* 친구를 클릭 시 색이 변하는 기능 */ /* 더 나은 버전의 클릭함수로 대체함(이 부분은 지워도 됨) */
	/* $('.chat_friend').click(function(e){
		if(e.currentTarget.className == "chat_friend"){
			$(this).addClass('chat_friend_clicked');
			$(this).removeClass('chat_friend');
		}else{
			$(this).addClass('chat_friend');
			$(this).removeClass('chat_friend_clicked');
		}
	}); */
	
	/* 글 작성 아이콘 클릭 시, 색이 변한 대상들의 id를 대상으로 글쓰기가 가능하도록 창을 띄움, 모달창 꺼짐  */
	var writeNewMsg = document.querySelectorAll("#writeNewMsg");
	$(writeNewMsg).click(function(e){
		alert("새글 작성");
		var selectedFriend = document.querySelector(".chat_friend_clicked");
		var sendTarget = ""; /* 프로필 클릭 시 채팅입력 대상을 변경하기 위한 변수 */
		alert(selectedFriend.id);
		/* className이  "chat_friend_clicked"인 객체의 아이디값을 전송. */
		sendTarget += '<input type="hidden" id="CHAT_OTHERID" name="CHAT_OTHERID" value="';
		sendTarget +=	selectedFriend.id;
		sendTarget += '"/>';
		
		$("#chatTarget").html(sendTarget);/* 채팅입력 form에서 채팅상대를 나타내는 CHAT_OTHERID를 클릭한 친구로 변경 */
		
		$("#chatOtherId").html(selectedFriend.id);/* 채팅영역의 프로필에 id표시 */
		
		$("#modal_overlay").css('display', 'none'); /* 모달창 끄기 */
		
		$("#chatContent").html(empty); /* 채팅창 비우기 */
		
	});
}
</script>

<script> /* 채팅을 입력하는 기능 */
$(addMessage).on('click', '#chat_send', function(){
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	var CHAT_MYID = $('#CHAT_MYID').val();
	var CHAT_OTHERID = $('#CHAT_OTHERID').val();
	var CHAT_CONTENT = $('#CHAT_CONTENT').val();
	var chatContent = document.getElementById('CHAT_CONTENT');//입력한 내용을 삭제할 input text의 id값으로 객체 생성.
	var paramData = {
			"CHAT_MYID" : CHAT_MYID
			, "CHAT_OTHERID" : CHAT_OTHERID
			, "CHAT_CONTENT" : CHAT_CONTENT
		};

		/* 웹소켓 관련 */
		webSocket.send("2#" + CHAT_OTHERID + "#" + CHAT_CONTENT); //chatServer의 onMessage로 OTHERID와 CONTENT를 보낸다. 
		
		$.ajax({
			  url : "addMessage.ya"
			, type : 'POST'
			, data : paramData
			, dataType : 'json'
			, success: function(result){
				
				showChatList(result);

			}
			, error: function(error){
				alert("실패");
				console.log("에러 : " + error);
			}
		});
	
	//입력한 메시지가 없을 경우 보내지 않음.
	if(chatContent.value == ""){
		return;
	}
	
	chatContent.value = "";//해당 객체의 내용을 삭제.
	
	chatContent.focus();//채팅 입력 시 채팅 입력창으로 포커스.
	
});
</script>

<script> /* 채팅룸(프로필) 선택 시 Controller로 CHAT_OTHERID 전송하고 받아온 데이터로 showChatList() 실행 */
$(document).on("click", ".chat_profile, .sub_story",function(e){
	
	e.preventDefault();
	
	var clickId = e.currentTarget.dataset.id;
	var sendTarget = ""; /* 프로필 클릭 시 채팅입력 대상을 변경하기 위한 변수 */
	
	sendTarget += '<input type="hidden" id="CHAT_OTHERID" name="CHAT_OTHERID" value="';
	sendTarget +=	clickId;
	sendTarget += '"/>';
	/* 채팅입력 form에 채팅상대인 CHAT_OTHERID를 클릭 한 대상으로 지정 */
	$("#chatTarget").html(sendTarget);
	
	$("#chatOtherId").html(clickId);/* 채팅영역의 프로필에 id표시 */

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
});

</script>

<script> /* 채팅추가 아이콘을 클릭 시 친구목록 띄우기 */ /*@@@@@@@@@ 임시로 멤버리스트를 띄움 @@@@@@@@@ */

var addChatRoom = document.querySelectorAll("#addChatRoom");
$(addChatRoom).click(function(e){
	
	$("#modal_overlay").css('display', 'flex'); /* 모달창 띄우기 */
	
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>'
	
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
			//ClassName이 chat_friend인 모든 객체를 가져온다.(태그 메튜 버튼)
			$('.chat_friend').click(function(e){
				//클릭한 버튼의 id값을 getId 변수에 할당한다.
				var getId = e.currentTarget.id;
				//클릭한 버튼에 chat_friend_clicked 클래스 추가.
				$('.chat_friend[id = ' + getId + ']').addClass('chat_friend_clicked');
				//나머지 버튼에는 chat_friend_clicked 클래스 삭제.
				$('.chat_friend[id !=' + getId + ']').removeClass('chat_friend_clicked');
			});
			
		}
		, error: function(error){
			alert("실패");
			console.log("에러 : " + error);
		}
	});
});
	
	//modal_overlay 클릭 시 모달창 끄기.
	//모달오버레이를 지정하는 객체 modalOverlay 선언.
	var modalOverlay = document.getElementById("modal_overlay")
	//모달오버레이를 클릭 시 closeModal 이벤트 발생.
	modalOverlay.addEventListener('click', closeModal);
	
	function closeModal(e) {
		
		var target = e.target;
		
		//클릭해도 모달창이 꺼지지 않게 할 영역들을 class이름으로 target 지정.
		if(target == modal_overlay){
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
  
  <script>
  window.addEventListener('beforeunload', function(event) {
	  
	  webSocket.send('3#' + <%=session.getAttribute("MEM_ID")%> + '#1');
	  
  });
  </script>


</html>