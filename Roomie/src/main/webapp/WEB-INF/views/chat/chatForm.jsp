<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

.chat_profile{

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
	background-image: url("../image/rainbow.png");
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

</style>

  <!-- 타이틀 -->
  <title>SNS PROJECT</title>
</head>

<body>

	<!-- 상단 내비게이션 바 시작 -->
	<div style="display: flex; justify-content: center;">
		<div style="display: flex; flex-wrap: inherit; align-items: center; justify-content: space-between; width: 935px;">
			<img class="navbar-brand" style="height: 40px; object-fit: contain;" src="resources/image/roomie_logo_1.png">
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
			<!-- 오른쪽 버튼 -->
			<div class="next" style="cursor:pointer; display: flex; align-items: center;"><img src="resources/image/icon_26.png"></div>
		</div>	
	<!-- 스토리 끝 -->
	
	<!-- 채팅방 start-->
	<div class="chat_box">	
		<div class="chat_list" style="background-color: #fff; height: 100%; width: 350px; border-right: 1px solid #DBDBDB;">
			<!-- 상단 메뉴1 start -->
			<div style="background-color: #fff; height: 60px; width: 100%; display: flex; align-items: center; justify-content: center; border-bottom: 1px solid #DBDBDB;">
				<div style="margin: 50px; font-weight: 600; cursor: pointer;">
					taeyoung kim
				</div>
				<div style="justify-content: flex-end;">
					<img style="height: 24px; cursor: pointer;" src="resources/image/add_friend.png">
				</div>
			</div>
			<!-- 상단 메뉴1 end -->
			<!-- 채팅방 리스트 start -->
			<div style="height: calc(100% - 60px); overflow-y: scroll;">	
				<!-- forEach start-->
				<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
					<div>
						<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
					</div>
					<div>
						<div style="">
							jeongsu Hong
						</div>
						<div style="display: flex; color: gray; align-items: center;">
							<div>
								땡벌
							</div>
							<div style="padding-left: 20px; font-size: 12px;">
								2시간 전
							</div>
						</div>
					</div>
				</div>
				<!-- forEach end-->
										<!-- 제거할 데이터 start-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
																	<!-- forEach start-->
																	<div class="chat_profile" style="height: 70px; border-bottom: 1px solid #DBDBDB; padding: 10px 20px; display: flex; align-items: center; cursor: pointer;">
																		<div>
																			<img style="margin-right: 20px; border: 1px solid #DBDBDB; border-radius: 50%; height: 50px; cursor: pointer;" src="resources/image/profile_05.jpg">
																		</div>
																		<div>
																			<div style="">
																				jeongsu Hong
																			</div>
																			<div style="display: flex; color: gray; align-items: center;">
																				<div>
																					땡벌
																				</div>
																				<div style="padding-left: 20px; font-size: 12px;">
																					2시간 전
																				</div>
																			</div>
																		</div>
																	</div>
																	<!-- forEach end-->
									<!-- 제거할 데이터 start-->
			</div>
			<!-- 채팅방 리스트 end -->
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
						<div style="margin-right: 50px; font-weight: 600; cursor: pointer;">
							jeongsu Hong
						</div>
					</div>
					<div style="justify-content: flex-end;">
						<img style="height: 24px; cursor: pointer;" src="resources/image/icon_information.png">
					</div>
				</div>	
			</div>
			<!-- 상단 메뉴2 end -->
			<!-- 대화 내용 start -->
			<div style="height: calc(100% - 120px); overflow-y: scroll;">
				<div style="display: flex; justify-content: center; font-size: 12px; color: gray; padding: 15px 0;">
					2023년 2월6일 오후 10:03 
				</div>
												<!-- if문으로 누가 보낸 메시지인지에 따라서 좌우 선택 -->
												<!-- 상대방 메시지 start -->
												<div style="display: flex; padding-left: 20px; margin: 10x 0;">
													<div style="display: flex; border: 1px solid #DBDBDB; align-items: center; padding: 10px 15px; border-radius: 25px;">
														난 이제 지쳤어요
													</div>
												</div>
												<!-- 상대방 메시지 end -->
												<!-- 내 메시지 start -->
												<div style="display: flex; padding-right: 20px; margin: 10px 0; flex-direction: row-reverse;">
													<div style="display: flex; background-color: #EBEDF0; align-items: center; padding: 10px 15px; border-radius: 25px;">
														땡벌
													</div>
												</div>
												<!-- 내 메시지 end -->
												<!-- 내 메시지 start -->
												<div style="display: flex; padding-right: 20px; margin: 10px 0; flex-direction: row-reverse;">
													<div style="display: flex; background-color: #EBEDF0; align-items: center; padding: 10px 15px; border-radius: 25px;">
														땡벌
													</div>
												</div>
												<!-- 내 메시지 end -->	
												<!-- if문으로 누가 보낸 메시지인지에 따라서 좌우 선택 -->
			</div>
			<!-- 대화 내용 end -->
			<!-- 메시지 입력 창 start-->
			<div style="display: flex; height: 60px; padding: 20px; bottom: 0; background-color: #fff; align-items: center; ">
				<div style="display: flex; height: 35px; border: solid 1px #DBDBDB; border-radius: 17.5px; padding: 0 20px; align-items: center; width: 100%; justify-content: space-between;">				
					<div>
						<img style="height: 20px; width: 20px; cursor: pointer;" src="resources/image/icon_emoticon.png">
						<input type="text" class="chat_input" style="color: gray; font-size: 12px; border: 0; margin-left: 20px;" placeholder="메시지 입력..."/>
					</div>
					<div>
						<button class="chat_send" style="border: 0; background-color: transparent; font-size: 12px; font-weight: 600;">보내기</button>
					</div>
				</div>
			</div>
			<!-- 메시지 입력 창 end-->
		</div>
		<!-- 채팅 내용 영역 end -->
	</div>
	
	</div>
	
</div>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
	crossorigin="anonymous">
</script>

</body>

<!-- jquery -->
<script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
$(window).load(function (){
	alert("2");
});
</script>

<script>
let websocket;

//입장 버튼을 눌렀을 때 호출되는 함수
function connect() {
    // 웹소켓 주소
    var wsUri = "ws://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/chatForm.ro";
    // 소켓 객체 생성
    websocket = new WebSocket(wsUri);
    //웹 소켓에 이벤트가 발생했을 때 호출될 함수 등록
    websocket.onopen = onOpen;
    websocket.onmessage = onMessage;
}

//웹 소켓에 연결되었을 때 호출될 함수
function onOpen() {
}

//1. 메시지 전송
function sendMessage(message){
}

//2. 메세지 수신
function onMessage(evt) {
}

</script>

<script>

    const story_list = document.querySelector('.story_list'); //전체 슬라이드 컨테이너
    const slideImg = document.querySelectorAll('.story_list li'); //모든 슬라이드들
    let currentIdx = 0; //현재 슬라이드 index
    const slideCount = slideImg.length; // 슬라이드 개수
    const prev = document.querySelector('.prev'); //이전 버튼
    const next = document.querySelector('.next'); //다음 버튼
    const slideWidth = 485; //한개의 슬라이드 넓이
    const slideMargin = 0; //슬라이드간의 margin 값

    //전체 슬라이드 컨테이너 넓이 설정
    story_list.style.width = (slideWidth + slideMargin) * slideCount + 'px';

    function moveSlide(num) {
      story_list.style.left = -num * 485 + 'px';
      currentIdx = num;
    }

    prev.addEventListener('click', function () {
      /*첫 번째 슬라이드로 표시 됐을때는 
      이전 버튼 눌러도 아무런 반응 없게 하기 위해 
      currentIdx !==0일때만 moveSlide 함수 불러옴 */

      if (currentIdx !== 0) moveSlide(currentIdx - 1);
    });

    next.addEventListener('click', function () {
      /* 마지막 슬라이드로 표시 됐을때는 
      다음 버튼 눌러도 아무런 반응 없게 하기 위해
      currentIdx !==slideCount - 1 일때만 
      moveSlide 함수 불러옴 */
      if (currentIdx !== slideCount - 1) {
        moveSlide(currentIdx + 1);
      }
    });

</script>


</html>