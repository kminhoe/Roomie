<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>

<!-- kakao 지도 스타일끝 -->
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<!-- 내비게이션 바 -->
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We"
   crossorigin="anonymous">
<!-- 내비게이션 바 구글 아이콘 이미지 -->
<link
   href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
   rel="stylesheet">

<!-- 모달 -->
﻿<%@ include file="modal.jsp" %>

<!-- webSocket 세션 js -->
<script><%@ include file="/resources/js/web.js" %></script>

<!-- style css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/modal_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/kakaomap_style.css">
   
   
<!-- 이미지 슬라이더에 필요한 CSS와 JS 파일 로드 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>



<!-- 타이틀 -->
<title>ROOMIE</title>

<style>
.test_modal {
	width: 300px;
	height: auto;
	right: 70px;
	position: absolute;
	display: none;
}

.modal_notif {
	width: 100%;
	height: auto;
	bottom: 0px;
	background: white;
	border: 1px solid rgba(255, 255, 255, 0.18);
	border-radius: 10px;
	padding: 10px;
	overflow-x: hidden;
	
}

.alarm_profileImg{
	margin-right: 20px;
	border: 1px solid #DBDBDB;
	border-radius: 50%;
	height: 50px;
	cursor: pointer;
}

.alarm_list0{
	background-color: white;
	cursor: pointer;
}

.alarm_list1{
	background-color: #98bcd5;
	cursor: pointer;
}

.alarm_list0:hover {
	background-color: #F2F3F5;
}

.alarm_list1:hover {
	background-color: #98BCF7;
}

</style>

</head>
<body>
   <!-- 상단 내비게이션 바 시작 -->
   <nav class="navbar navbar-expand-lg navbar-light bg-light"
      style="width: 100%; position: fixed; z-index: 2; top: 0; margin-top: 0;">
      <div class="container">
         <img class="navbar-brand" style="height: 44px; object-fit: contain;"
            src="resources/image/Roomie5.png">

         <!-- 검색창 -->
         <!-- <input class="form-control" style="width: 200px" type="search" placeholder="Search" aria-label="Search"> -->

         <div style="display: flex;">
            <!-- 홈 버튼 -->
            <img class="menu_img"
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_09.png"> &nbsp;&nbsp;
            <!-- 검색 버튼 
            <img class="menu_img"
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_07.png"> &nbsp;&nbsp; -->
            <!-- 탑색 탭 버튼 -->
            <img class="menu_img"
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_22.png"
               onclick="window.location.href='searchForm.ya'"> &nbsp;&nbsp;
            <!-- 채팅 버튼 -->
            <div class="menu_img">
            	<div style="position: relative;">
		            <div>
			            <img class="menu_img"
			               style="width: 25px; height: 25px; object-fit: contain; cursor: pointer;"
			               src="resources/image/icon_04.png"
			               onclick="window.location.href='chatForm.ya'"> &nbsp;&nbsp;
		            </div>
		            <div id="msgNotif" style="position: absolute; top: -10px; right: 15px;">
		            	<img style="width: 10px; height: 10px;" src="">
		            </div>
	            </div>
			</div>
            <!-- 알림 버튼 -->
            <div class="menu_img">
            	<div style="position: relative;">
            		<div>
            			<img class="menu_img" id="notifBtn"
							style="width: 25px; height: 25px; object-fit: contain; cursor: pointer;"
							src="resources/image/icon_01.png"> &nbsp;&nbsp;
            		</div>
            		<div id="notifAlarm" style="position: absolute; top: -10px; right: 15px;">
		            	<img style="width: 10px; height: 10px;" src="">
		            </div>
            	</div>
            </div>
            <!-- 스토리 버튼 -->
            <img class="menu_img" id="add_stories"
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_17.png" onclick="location.href='http://localhost:8090/roomie/storiesUpload.ya'"> &nbsp;&nbsp;
            <div class="modal_overlay" id="modal_add_stories" style="position: fixed;">
           		<div class="modal_window_stories" id="modal_window_stories" style="width: 800px; height: 600px;">

           		</div>
           </div>
            <!-- 게시글 업로드 버튼 -->
            <img class="menu_img" id="add_feed"
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_08.png"> &nbsp;&nbsp;
            <!-- 프로필 이동 버튼 -->
            <c:choose>
					<c:when test="${empty MEMBER.MEM_MEDIA}">
						<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain"
							src="resources/image/icon_06.png" alt=""> &nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain"
							src="resources/image/${MEMBER.MEM_MEDIA}" alt=""> &nbsp;&nbsp;
							
					</c:otherwise>
				</c:choose>
			﻿<%@ include file="../option/upload_modal.jsp" %>
         </div>
      </div>
   </nav>
   <!-- 상단 내비게이션 바 끝 -->

   <!-- 메인 바디 영역 시작 -->
   <div class="main_body">
      <!-- 왼쪽 바디 영역 시작 -->
      <div class="left_body">
      
         <!-- 스토리 시작 -->
         <div class="story">
            <!-- 왼쪽 버튼 -->
            <div class="story_prev"
               style="top: 50px; cursor: pointer; position: relative; z-index: 1; width: 20px; visibility: hidden;">
               <img src="resources/image/icon_29.png" onclick="prev_action();">
            </div>
            <ul class="story_list">
               <li class="sub_story">
                  <div class="text">
                     <a onclick="href='#'"><img
                        src="resources/image/profile_01.jpg" alt="프로필"></a> <span
                        style="font-size: 12px; margin-left: 3px;"></span>
                  </div>
               </li>
               <li>
                  <div class="sub_story">
                     <div class="text">
                        <img src="resources/image/profile_02.jpg" alt="프로필"> <span
                           style="font-size: 12px; margin-left: 3px;"></span>
                     </div>
                  </div>
               </li>
            </ul>
            
            <!-- 오른쪽 버튼 -->
            <div class="story_next"
               style="top: -68px; left: 436px; cursor: pointer; position: relative; z-index: 1; width: 20px;">
               <img src="resources/image/icon_30.png" onclick="next_action();">
            </div>
         </div>
         <!-- 스토리 끝 -->
         
         <!-- 게시글 시작 -->
         <div id="create_box">
         
         </div>
         <div class="uploadB"></div>
         
         <div class="uploadB"></div>
         
         <c:forEach var="boardList" items="${boardList}" varStatus="status">
         
         
         <div class="border feed_box">
            <div class="feed_name">
               <div class="profile_box">
               
               <c:choose>
					<c:when test="${empty boardList.MEM_MEDIA}">
						<img class="profile_img" src="resources/image/icon_p.jpg" > 
					</c:when>
					<c:otherwise>
						<img class="profile_img" src="/roomie/${boardList.MEM_MEDIA }">
					</c:otherwise>
				</c:choose>
               
                 
               </div>
               <span class="feed_name_txt"> ${boardList.MEM_NAME} </span>
               <!-- 더보기 버튼 -->
               <img class="more_details" style="right: -340px !important;" src="resources/image/icon_28.png"
                  alt="더보기">
            </div>
            
            <input type="hidden" id="bo_mem" value="${boardList.BO_MEM}">
            <input type="hidden" id="bo_name" value="${boardList.BO_USER}">
            <input type="hidden" id="bo_idx" value="${boardList.BO_IDX}">

            
            <%-- <img class="feed_img" style="height: 478px;"
               src="resources/files/board/${boardList.BO_MEDIA}"> --%>
               
               <!-- BO_MEDIA를 쉼표로 구분하여 배열에 담기 -->
               <c:set var="mediaArray" value="${fn:split(boardList.BO_MEDIA, ',')}" />

               <!-- 이미지 슬라이더 -->
               <div class="slider">
               <c:forEach items="${mediaArray}" var="media">
               <div><img class="feed_img" style="height: 478px;" src="resources/files/board/${media}" /></div>
               </c:forEach>
               </div>

            <div class="feed_icon">
               <div>
                 
                 <!-- 좋아요 -->
                 <div id="likeBut${status.index}" class="likeBut" style="display: inline-block;">
                 
                <input type="hidden" id="idx" value="${MEMBER.MEM_IDX}">
                <input type="hidden" id="board_idx" value="${boardList.BO_IDX}">
                
                 <c:if test="${not empty LIKEB}">
                 
		         <c:set var="liked" value="false" />

                 <c:forEach var="like" items="${LIKEB}">
                     <c:if test="${boardList.BO_IDX == like.LIKEB_BOARD}">
                     <c:set var="liked" value="true" />
                     </c:if>
                 </c:forEach>

                <c:if test="${liked == true}">
                

                <img class="material-icons-outlined" id="like_y" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/heart_yes (2).png" >
                
                </c:if>

                <c:if test="${liked == false}">

                <img class="material-icons-outlined" id="like_n" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_01.png" >
                </c:if>

                 </c:if>
                 
                 <c:if test="${empty LIKEB}">
  
                 <img class="material-icons-outlined" id="like_n"
                     style="width: 20px; height: 20px; object-fit: contain"
                     src="resources/image/icon_01.png">
                 
                 </c:if>
                 </div>
                 
                  <!-- 댓글 버튼 -->
                  <img class="material-icons-outlined"
                     style="width: 20px; height: 20px; object-fit: contain"
                     src="resources/image/icon_03.png">
                  <!-- 공유 버튼 -->
                  <img class="material-icons-outlined"
                     style="width: 20px; height: 20px; object-fit: contain"
                     src="resources/image/icon_04.png">
               </div>
               <div>
                  <!-- 게시글 저장 버튼 -->
                  <img class="material-icons-outlined"
                     style="width: 20px; height: 20px; object-fit: contain"
                     src="resources/image/icon_05.png">
               </div>
            </div>
            <div class="feed_like">
            <div class="likec" id="feed_like${status.index}" style="padding: 0px;">
               <!-- 좋아요 표시 -->
               <p class="feed_txt">

               <c:choose>
               <c:when test="${boardList.COUNT == null}">
               <b>좋아요 0개</b>
               <input type="hidden" value="${boardList.COUNT}">
               </c:when>
               
               <c:otherwise>
               <b>좋아요 ${boardList.COUNT}개</b>
               <input type="hidden" value="${boardList.COUNT}">
               </c:otherwise>
               </c:choose>
               

               </p>
            </div></div>
            <div class="feed_content">
               <!-- 이름, 게시글 내용 -->
               <p class="feed_txt">
                  <b> ${boardList.MEM_NAME} </b> ${boardList.BO_CONT}
               </p>
            </div>
            <!-- 댓글 목록 -->
            <div class="feed_reply">
               <span class="feed_txt"> <b> taeyeong </b> 제주도 가고 싶어요 ㅠㅠ
               </span> <span class="feed_txt"> <b> junseok </b> 제주도 ㄱ ㄱ
               </span>
            </div>
            <!-- 댓글 달기 -->
            <div class="inputContainer">
               <div class="type_comment">
                  <input class="inputBox" type="text" placeholder="댓글 달기...">
               </div>
               <span>
                  <button class="buttonBox" type="summit">게시</button>
               </span>
            </div>
         </div>
         
         </c:forEach>
         <!-- 게시글 끝 -->
        
         <!-- 왼쪽 바디 영역 끝 -->
         <!-- 오른쪽 바디 영역 시작 -->
         <div class="right_body">
            <!-- 계정 전환 시작 -->
            <div class="feed_name" style="justify-content: space-between">
               <div style="display: flex; align-items: center;">
                  <div class="big_profile_box">
                     <!-- 계정 프로필 이미지 -->
                     <img class="profile_img" src="resources/image/profile_06.jpg">
                  </div>
                  <div class="name_content">
                     <!-- 사용자 이름 -->
                     <span class="feed_name_txt"> daemyeong </span>
                     <!-- 이름 -->
                     <span class="name_content_txt"> Yoon Daemyeong </span>
                  </div>
               </div>

               <!-- 계정 전환 -->
               <a class="link_txt"> 전환 </a>
            </div>
            <!-- 계정 전환 끝 -->
            <!-- 회원님을 위한 추천 -->
            <div class="recommend_box">
               <span style="color: gray"> 회원님을 위한 추천</span> <span
                  style="font-size: 12px"> 모두 보기 </span>
            </div>
            <!-- 회원 목록 시작 -->
            <div>
               <!-- 회원 시작 -->
               <div class="feed_name" style="justify-content: space-between">
                  <div class="profile_box">
                     <!-- 회원 프로필 이미지 -->
                     <img class="profile_img" src="resources/image/profile_01.jpg">
                  </div>
                  <div class="name_content">
                     <!-- 회원 사용자 이름 -->
                     <span class="feed_name_txt"> yeongjun </span>
                     <!-- 회원 상태 -->
                     <span class="name_content_txt"> EZEN 신규가입</span>
                  </div>
                  <!-- 팔로우 버튼 -->
                  <a class="link_txt"> 팔로우 </a>
               </div>
               <!-- 회원 끝 -->
               <!-- 첫번째 회원 시작 -->
               <div class="feed_name" style="justify-content: space-between">
                  <div class="profile_box">
                     <img class="profile_img" src="resources/image/profile_02.jpg">
                  </div>
                  <div class="name_content">
                     <span class="feed_name_txt"> junseok </span> <span
                        class="name_content_txt"> yeongjun 외 5명이 팔로우</span>
                  </div>
                  <a class="link_txt"> 팔로우 </a>
               </div>
               <!-- 첫번째 회원 끝 -->
               <!-- 두번째 회원 시작 -->
               <div class="feed_name" style="justify-content: space-between">
                  <div class="profile_box">
                     <img class="profile_img" src="resources/image/profile_03.jpg">
                  </div>
                  <div class="name_content">
                     <span class="feed_name_txt"> taeyeong </span> <span
                        class="name_content_txt"> yeongjun 외 5명이 팔로우</span>
                  </div>
                  <a class="link_txt"> 팔로우 </a>
               </div>
               <!-- 두번째 회원 끝 -->
               <!-- 세번째 회원 시작 -->
               <div class="feed_name" style="justify-content: space-between">
                  <div class="profile_box">
                     <img class="profile_img" src="resources/image/profile_04.jpg">
                  </div>
                  <div class="name_content">
                     <span class="feed_name_txt"> minhoe </span> <span
                        class="name_content_txt"> 회원님을 위한 추천 </span>
                  </div>
                  <a class="link_txt"> 팔로우 </a>
               </div>
               <!-- 세번째 회원 끝 -->
               <!-- 네번째 회원 시작 -->
               <div class="feed_name" style="justify-content: space-between">
                  <div class="profile_box">
                     <img class="profile_img" src="resources/image/profile_05.jpg">
                  </div>
                  <div class="name_content">
                     <span class="feed_name_txt"> jeongsu </span> <span
                        class="name_content_txt"> 회원님을 위한 추천 </span>
                  </div>
                  <a class="link_txt"> 팔로우 </a>
               </div>
               <!-- 네번째 회원 끝 -->
            </div>
            <!-- 회원 추천 목록 끝 -->

            <!-- ROOMIE -->
            <div class="comment_box">
               <span> 소개 · 도움말 · 홍보 센터 · API · 채용 정보 </span> <span>
                  개인정보처리방침 · 약관 · 위치 · 인기 계정 · 해시태그 · 언어 </span> <br> <span> ⓒ
                  2023 ROOMIE </span>
            </div>
         </div>
         <!-- 오른쪽 바디 영역 끝 -->
      </div>
      <!-- 메인 바디 영역 끝 -->
      <!-- 푸터 시작 -->
      <footer>
         <div>
            <!-- 홈 버튼 -->
            <img style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_09.png"> &nbsp;&nbsp;
            <!-- 탐색 탭 버튼 -->
            <img 
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_22.png"
               onclick="window.location.href='searchForm.ya'"> &nbsp;&nbsp;
            <!-- 채팅 버튼 -->
            <img style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_04.png"
               onclick="window.location.href='chatForm.ya'"> &nbsp;&nbsp;
            <!-- 알림 버튼 -->
            <img style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_01.png"> &nbsp;&nbsp;
            <!-- 스토리 버튼 -->
            <img id="add_stories"
               style="width: 25px; height: 25px; object-fit: contain"
               src="resources/image/icon_17.png" onclick="location.href='http://localhost:8090/roomie/storiesUpload.ya'"> &nbsp;&nbsp;
            <!-- 게시글 버튼 -->
            <img style="width: 25px; height: 25px; object-fit: contain"
               onclick="document.getElementById('add_feed').click();"
               src="resources/image/icon_08.png"> &nbsp;&nbsp;
               <!-- 프로필 이동 버튼 -->
            <c:choose>
					<c:when test="${empty MEMBER.MEM_MEDIA}">
						<img style="width: 25px; height: 25px; object-fit: contain""
							src="resources/image/icon_06.png" alt=""> &nbsp;&nbsp;
					</c:when>
					<c:otherwise>
						<img style="width: 25px; height: 25px; object-fit: contain""
							src="${MEMBER.MEM_MEDIA}" alt=""> &nbsp;&nbsp;
					</c:otherwise>
				</c:choose>
         </div>
      </footer>

<!-- 모달 start -->
	
	<div class="test_modal" id="close1">
		<div style="display: relative; height: 20px; width: 20px; transform: rotate(45deg); background-color: white; position:absolute; top:-10px; left: 150px;"></div>
		<div class="modal_notif">
			<div class="likeAlarm">
				<div style="display: flex; justify-content: center;">
				좋아요
				</div>
				<div id="likeAlarmList">
					<div style="display: flex; justify-content: center; padding: 30px; color: gray;">
						좋아요 알림이 없습니다...
					</div>
				</div>
			</div>
			<div style="border-bottom: 1px solid #EBEDF0; margin: 10px;"></div>
			<div class="reviewAlarm">
				<div style="display: flex; justify-content: center;">
				댓글
				</div>
				<div id="reviewAlarmList">
					<div style="display: flex; justify-content: center; padding: 30px; color: gray;">
						댓글 알림이 없습니다...
					</div>
				</div>
			</div>
			<div style="border-bottom: 1px solid #EBEDF0; margin: 10px;"></div>
			<div class="followAlarm">
				<div style="display: flex; justify-content: center;">
				팔로우
				</div>
				<div id="followAlarmList">
					<div style="display: flex; justify-content: center; padding: 30px; color: gray;">
						팔로우 알림이 없습니다...
					</div>
				</div>
			</div>
		</div>
	</div>	
	<!-- 모달 end -->

<script> /* 모달 관련 script */
	//클릭 이벤트
	$(document).on('click', function(e) {
		if($(e.target).is('#notifBtn')) { //클릭한 요소의 id가 notifBtn 이라면
			$('.test_modal').css('display', 'flex'); //test_modal class의 display 속성을 flex로 변경.
		}else if(!$(e.target).closest('.test_modal').length && !$(e.target).is('.test_modal')) { //클릭한 요소의 id가 notifBtn이 아니라면
			$('.test_modal').css('display', 'none'); //test_modal class의 display 속성을 none로 변경.
		}
	});
</script>

<script>
    // 스토리 추가 모달
    const modal_add_stories = document.getElementById("modal_add_stories");
    const buttonAddStories = document.getElementById("add_stories");
    
    buttonAddStories.addEventListener("click", e => {
        modal_add_stories.style.display = "flex";
        document.body.style.overflowY = "hidden";
      });
 </script>        
         
         
      <!-- 모달 스크립트 -->
  <script>
 
     const realUpload = document.querySelector('.real_upload');
     const upload = document.querySelector('.uploadpage');
     
     upload.addEventListener('click', () => realUpload.click());

    const modal_add_feed = document.getElementById("modal_add_feed");
    const modal_add_feed_content = document.getElementById("modal_add_feed_content");
    const modal_add_feed_place = document.getElementById("modal_place_add");
    const buttonAddFeed = document.getElementById("add_feed");

    // 모달 글쓰기 이미지 업로드 띄우기
    buttonAddFeed.addEventListener("click", e => {
      modal_add_feed.style.display = "flex";
      document.body.style.overflowY = "hidden";
    });

    //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
    // 모달 글쓰기 이미지 업로드 닫기
    const buttonCloseModal_add_feed = document.getElementById("close_modal_add_feed");
    buttonCloseModal_add_feed.addEventListener("click", e => {
      modal_add_feed.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      /* $('.upload_list').html('');
      $('#input_content').val(''); */
      location.reload();

    });
    // 모달 글쓰기 닫기
    const buttonCloseModal_add_feed_content = document.getElementById("close_modal_add_feed_content");
    buttonCloseModal_add_feed_content.addEventListener("click", e => {
      modal_add_feed_content.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      /* $('.upload_list').html('');
      $('#input_content').val(''); */
      location.reload();
    });
    // 위치 모달 닫기
    const buttonCloseModal_add_feed_place = document.getElementById("close_modal_add_feed_place");
    buttonCloseModal_add_feed_place.addEventListener("click", e => {
       modal_place_add.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      /* $('.upload_list').html('');
      $('#input_content').val(''); */
      location.reload();
    });
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@


    // 업로드 jquery
    $('.modal_image_upload')
        .on("dragover", dragOver)
        .on("dragleave", dragOver)
        .on("drop", uploadFiles);

    function dragOver(e){
      e.stopPropagation();
      e.preventDefault();

      if (e.type == "dragover") {
        $('.image_upload').html(
          '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_32.png"></div>' +
          '<div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>' +
          '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>'
        );
      } else {
        $('.image_upload').html(
          '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_31.png"></div>' +
          '<div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>' +
          '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>'
        );
      }
    }
    

    function uploadFiles(e){
      e.stopPropagation();
      e.preventDefault();
      
      e.dataTransfer = e.originalEvent.dataTransfer; 
      
      var arr = new Array;
      var arr2 = new Array;
      
      var data =  e.dataTransfer; 
      var maxSize = 10485760;
      const formData = new FormData(); 
      
      console.log("file size : "+ data.files[0].name);
      
      /* formData.append("uploadFile", data.files[0]); */
      

      for (i=0; i<data.files.length; i++) {
         
         
         if(data.files[i].size >= maxSize){
            alert("파일 사이즈 초과");
            
         }
        if (data.files[i].type.match(/image.*|video.*/)) {
          $('.modal_image_upload').css({
            "outline": "none",
            "background-size": "100% 100%",
            'background-color' : 'transparent'
            
          });
          

          // 파일 타입이 이미지 일 경우
          if (data.files[i].type.match(/image.*/)) {
            var html = "";
            html += '<li class="sub_upload"><img style="width: 780px; height: 556px; background:#e2e2e2;" src="' + window.URL.createObjectURL(data.files[i]) + '"></li>';
            
            $('.upload_list').append(html)
            document.getElementById('upload_next').click();
            console.log(window.URL.createObjectURL(data.files[i]));
          } else {
            // 파일 타입이 동영상 일 경우
            var html = "";
            html += '<li class="sub_upload"><video controls width="780px" height="556px" style="background:#e2e2e2;" src="' + window.URL.createObjectURL(data.files[i]) + '"></li>';
            $('.upload_list').append(html)
            document.getElementById('upload_next').click();
          }
          $('.image_upload').html(
            '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_31.png"></div>' +
            '<div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>' +
            '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>'
          );
          
          
        } else {
          // 파일을 업로드하지 못했습니다. 
          $('.modal_image_upload').css({
            'background-color' : '#transparent'
          });
          
          $('.image_upload').html(
            '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_33.png"></div>' +
            '<div style="margin-top: 30px; font-size: 20px;"><a>지원되지 않는 파일입니다</a></div>' +
            '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a style="font-weight: bold;">' + data.files[i].name + '</a><a> 파일을 업로드하지 못했습니다.</a></div>'
          );
          
        }
        formData.append("uploadFile", data.files[i]);
      }
      $.ajax({
         url: '/roomie/register.ya',
         processData: false,
         contentType: false,
         data: formData,
         type: 'POST',
         dataType:'json',
         success: function(result){
            
            console.log(result);
            
            arr = result;
            
            arr.forEach(function(object, index){
               console.log("ajax 확인 : " + object.BO_MEDIA);
               arr2.push(object.BO_MEDIA);
            });
            
            console.log(result.object);

            
            console.log("데이터가 쌓이나요? : " +arr2);
            
            var x = document.createElement("INPUT");
            x.setAttribute("type", "hidden");
            x.setAttribute("value", arr2);
            x.setAttribute("id", "qwer");
            
            document.body.appendChild(x);
            
         }
         
      });
      
      
      console.log(formData.get(data.files[0]));
         
    }
     $(document).ready(function(){
        
       // 스토리 리스트 불러오기
       /* readStories(); */
        
        var arr = new Array;
        var arr2 = new Array;
        
       var regex = new RegExp("(.*?)\.(exe|sh|zip|alz|txt)$");
       var maxSize = 10485760;
       
       function checkExtension(fileName, fileSize){
          if(fileSize >= maxSize){
             alert("파일 사이즈 초과");
             return false;
          }
          if(regex.test(fileName)){
             alert("해당 파일은 업로드 할수 없습니다.");
             return false;
          }
          return true;
       }
       var cloneObj = $(".real_upload").clone();
       
       $("input[type='file']").change(function(e){
          var formData = new FormData();
          var inputFile = $("input[name='uploadFile']");
          var files = inputFile[0].files;
          
                    
          console.log(files);
          
          for(var i=0; i<files.length; i++){
             
             if(!checkExtension(files[i].type, files[i].size)){
                return false;
             } 
             formData.append("uploadFile", files[i]);
          }
          
          $.ajax({
             url: '/roomie/register.ya',
             processData: false,
             contentType: false,
             data: formData,
             type: 'POST',
             dataType:'json',
             success: function(result){
                
                var str =""
                console.log(result);
                
                showUploadedFile(result);
                
                arr = result;
                
                arr.forEach(function(object, index){
                   console.log("ajax 확인 : " + object.BO_MEDIA);
                   arr2.push(object.BO_MEDIA);
                });
                
                console.log(arr2);
                
                var x = document.createElement("INPUT");
                x.setAttribute("type", "hidden");
                x.setAttribute("value", arr2);
                x.setAttribute("id", "qwer");
                
                document.body.appendChild(x);
                
                //str += "<input type='hidden' value='arr2' id=input_fileimage>"
                
                
                
                $(".real_upload").html(cloneObj.html());
             }
          });
          
       });
       function showUploadedFile(uploadResultArr){
           var str = "";
           
           $(uploadResultArr).each(function(i, obj){
              
              
              
              if(obj.BO_MEDIATYPE == 'image'){
                 /* str += "<li>" + obj.BO_MEDIATYPE + "</li>";  */
                 $('.modal_image_upload').css({
                      "outline": "none",
                      "background-size": "100% 100%",
                      'background-color' : 'transparent'});
                 var fileImageCallPath = encodeURIComponent( obj.BO_UPLOADPATH +obj.BO_UUID+ "_"+obj.BO_MEDIA);
                 /* input hidden value obj.BO_UUID */
                 str += '<li class="sub_upload"><img class="uploadedfile" style="width:780px; height:556px; background:#e2e2e2;" src="' + window.URL.createObjectURL(file.files[i]) + '"></li>';
                 
                 
              }else if(obj.BO_MEDIATYPE == 'video'){
                 $('.modal_image_upload').css({
                       "outline": "none",
                       "background-size": "100% 100%",
                       'background-color' : 'transparent'});
                 var fileMediaCallPath = encodeURIComponent( obj.BO_UPLOADPATH +obj.BO_UUID+ "_"+obj.BO_MEDIA);
                 str += '<li class="sub_upload"><video controls width="780px" height="556px" class="uploadedfile" style="background:#e2e2e2;" src="' + window.URL.createObjectURL(file.files[i]) + '"></li>';
                   
              }else{
                 alert("타입확인해바 새꺄!");
              }
              
           });
           $('.upload_list').append(str);
          document.getElementById('upload_next').click();
        }
    
       
    });
     
  
    
     
    $("#boardupload").on("click", function(e){
       if($("#input_content").val() == "" || $("#input_content").val()== null){
             alert("게시글을 작성해주세요");
             return false;
          }
     var str = $("#input_hash").val();
     
     var checkhash = str.indexOf('#');
     
     console.log("str: " + str.length);
     
     if(str.length > 0){
        if(checkhash < 0){
        alert("# 태그를 붙여주세요");
        return false;
        }
     }else if(str.length < 0){
        return true;
     }
       
      
       var BO_MEM = $("#input_user_id").text();
       var BO_HASH = $("#input_hash").val();
       var BO_PLACE = $("#input_place").val();
       var BO_CONT = $("#input_content").val();
       //let files = $("input[name=uploadFile]")[0].files;
       //var file = $("#input_fileimage").val();
       var file = $("#qwer").val();
      var BO_ID = $("#mem_id").val();
      var BO_USER = $("#mem_user").val();
      
       console.log("file이름들: "+ file);
       
       console.log(BO_MEM);
       console.log(BO_HASH);
       console.log(BO_PLACE);
       console.log(BO_CONT);
       //console.log(file);
       
       
       var formData = new FormData();  
       
       //formdata.append("BO_UUID", BO_uuid);
       formData.append("BO_MEM", BO_MEM);
       formData.append("BO_HASH", BO_HASH);
       formData.append("BO_PLACE", BO_PLACE);
       formData.append("BO_CONT", BO_CONT);
       formData.append("BO_MEDIA", file);
       formData.append("BO_ID", BO_ID);
       formData.append("BO_USER", BO_USER);
       
       /* Array.from(files).map(e => formData.append("BO_IMAGE", e));
    formData.append("BO_IMAGE", files); 
       for(let i = 0; i< files.length; i++){
         formData.append("BO_IMAGE", files[i]);
       } */
       
       
       $.ajax({
          url: '/roomie/boardInsert.ya',
          
        //formData 사용 시 processData, contentType 필수 작성
         processData: false,
         contentType: false,
         data: formData,
         type: 'POST',
         dataType:'text',
         success: function(status){
            
            alert("성공");
            
            location.reload();
            
<<<<<<< HEAD
            $('.uploadB').html(
            		'<div class="border feed_box">'+
            		'<div class="feed_name">'+
            		'<div class="profile_box">'+
            		'<c:choose>'+
            		'<c:when test="${empty boardList.MEM_MEDIA}">'+
            		'<img class="profile_img" src="resources/image/icon_p.jpg" >'+ 
            		'</c:when>'+
            		'<c:otherwise>'+
            		'<img class="profile_img" src="/roomie/${boardList.MEM_MEDIA }">'+
            		'</c:otherwise>'+
            		'</c:choose>'+               
            		'</div>'+
            		'<span class="feed_name_txt"> ${boardList.MEM_NAME} </span>'+

            		'<img class="more_details" style="right: -340px !important;" src="resources/image/icon_28.png" alt="더보기">'+
            		'</div>'+
         
            		'<c:set var="mediaArray" value="${fn:split(boardList.BO_MEDIA, ',')}" />'+
            	
            		'<div class="slider">'+
            		'<c:forEach items="${mediaArray}" var="media">'+
            		'<div><img class="feed_img" style="height: 478px;" src="resources/files/board/${media}" /></div>'+
            		'</c:forEach></div>'+
            		'<div class="feed_icon">'+
            		'<div>'+
            	
            		'<img class="material-icons-outlined" id="like_n" style="width: 20px; height: 20px; object-fit: contain"  src="resources/image/icon_01.png"></div>'+
            	
            		'<img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_03.png">'+
            	
            		'<img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_04.png"></div>'+
            		'<div>'+
            	
            		'<img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain"  src="resources/image/icon_05.png"></div></div>'+
            		'<div class="feed_like">'+
            		'<div class="likec" id="feed_like${status.index}" style="padding: 0px;">'+
           
            		'<p class="feed_txt">'+
            		'<b>좋아요 0개</b></p></div></div>'+
            		'<div class="feed_content">'+
            		
            		'<p class="feed_txt">'+
            		'<b> ${boardList.MEM_NAME} </b> ${boardList.BO_CONT}</p></div>'+
            	
            		'<div class="feed_reply">'+
            		'<span class="feed_txt"> <b>  </b> </span> <span class="feed_txt"> <b> </b> </span></div>'+
            	
            		'<div class="inputContainer">'+
            		'<div class="type_comment">'+
            		'<input class="inputBox" type="text" placeholder="댓글 달기..."></div>'+
            		'<span><button class="buttonBox" type="summit">게시</button></span></div></div>'
                  );
=======
           
>>>>>>> branch 'main' of https://github.com/kminhoe/Roomie.git
            
         }
          
       });
       
       
       
    });
    
  </script>

      <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
          crossorigin="anonymous">
  </script> -->

      <!-- 프로필 슬라이드 -->
      <script>
    const story_list = document.querySelector('.story_list'); //전체 슬라이드 컨테이너
    const story_slideImg = document.querySelectorAll('.story_list li'); //모든 슬라이드들
    let story_currentIdx = 0; //현재 슬라이드 index
    const story_slideCount = story_slideImg.length; // 슬라이드 개수
    const story_prev = document.querySelector('.story_prev'); //이전 버튼
    const story_next = document.querySelector('.story_next'); //다음 버튼
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

     <script type="text/javascript"
         src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e089b04e0ca2a1fd1287cb6610d9d01&libraries=services"></script>
      <script src="./resources/js/kakaomap.js"></script>
     

<script>
    const upload_list = document.querySelector('.upload_list'); //전체 슬라이드 컨테이너
    const upload_slideImg = document.querySelectorAll('.upload_list li'); //모든 슬라이드들
    let upload_currentIdx = 0; //현재 슬라이드 index
    const upload_slideCount = upload_slideImg.length; // 슬라이드 개수
    const upload_prev = document.querySelector('.upload_prev'); //이전 버튼
    const upload_next = document.querySelector('.upload_next'); //다음 버튼
    var upload_slideWidth = 795; //한개의 슬라이드 넓이
    const upload_slideMargin = 0; //슬라이드간의 margin 값
  
    // 창크기 변화 감지
    $( window ).resize(function() {
      var windowWidth = $(window).width();
      if(windowWidth > 1100) {
        // 창 가로 크기가 1100보다 클 경우 
        upload_slideWidth = 795;
      } else {
        // 창 가로 크기가 1100보다 작을 경우
        upload_slideWidth = 325;
      }
      upload_moveSlide(upload_currentIdx);
    });

    var windowWidth = $(window).width();
    if(windowWidth > 1100) {
      // 창 가로 크기가 1100보다 클 경우 
      upload_slideWidth = 795;
    } else {
      // 창 가로 크기가 1100보다 작을 경우
      upload_slideWidth = 325;
    }

    //전체 슬라이드 컨테이너 넓이 설정
    upload_list.style.width = (upload_slideWidth + upload_slideMargin) * upload_slideCount + 'px';

    function upload_moveSlide(num) {
      upload_list.style.left = -num * upload_slideWidth + 'px';
      upload_currentIdx = num;
    }

    upload_prev.addEventListener('click', function () {
      /*첫 번째 슬라이드로 표시 됐을때는 
      이전 버튼 눌러도 아무런 반응 없게 하기 위해 
      upload_currentIdx !==0일때만 upload_moveSlide 함수 불러옴 */
      if (upload_currentIdx !== 0) upload_moveSlide(upload_currentIdx - 1);
    });

    upload_next.addEventListener('click', function () {
      /* 마지막 슬라이드로 표시 됐을때는 
      다음 버튼 눌러도 아무런 반응 없게 하기 위해
      currentIdx !==slideCount - 1 일때만 
      moveSlide 함수 불러옴 */
      if (upload_currentIdx !== upload_slideCount - 1) {
        upload_moveSlide(upload_currentIdx + 1);
      }
    });

    // 글쓰기 다음 페이지
    function modal_add_feed_Next() {
      $('#modal_add_feed_content').css({
        display : 'flex'
      });

      $('#modal_add_feed').css({
       display: 'none'
      })
    }

    // 이전 페이지
    function modal_add_feed_Prev() {
      $('#modal_add_feed_content').css({
        display: 'none'
      });

      $('#modal_add_feed').css({
       display : 'flex'
      })
    }
    
    
    
    function place_add_bnt(){
       $('#modal_place_add').css({
          display : 'flex'
       });
       map.relayout();
       $('#modal_add_feed_content').css({
          display: 'none'   
       });
       
    }
    function modal_place_Prev(){
       $('#modal_place_add').css({
          display : 'none'
       });
       $('#modal_add_feed_content').css({
          display: 'flex'   
       });
    }

  </script>
  
    <script>

    var page = 0;
    var length = 0;
  
	function readStories() {
		var paramData = {"FRI_MEM" : "${MEM_ID}"};
		var htmls = '';

		$.ajax({
			url: "/roomie/storiesList.ya"
			, data : paramData 
			, type : 'POST'
			, dataType : 'json'
			, success: function(status){
	          
	          for (i=0; i<status.length; i++) {
	      		htmls += '<li class="sub_story" style="background-image: url(';
	      		if (status[i].SC_DEL != "Y") {
	    			htmls += "'./resources/image/rainbow.png'";
	      		} else {
	      			htmls += "";
	      		}
	    		htmls += '">';
	    		htmls += '<div class="text">';
	    		htmls += '<a onclick="href=' + "'/roomie/stories.ya?STORY_MEM=" + status[i].STORY_MEM + "'" + '">';
	    		htmls += '<img src="./resources/files/profile/' + status[i].MEM_MEDIA + '"alt="프로필"></a>'
	    		htmls += '<span style="font-size: 12px; margin-left: 3px;);">' + status[i].MEM_USER + '</span>';
	    		htmls += '</div>';
	    		htmls += '</li>';
	          }
	          
	          length = status.length;
	          
	          // visibility:hidden
	          if (status.length <= 5) {
	        	  $('.story_next').css("visibility", "hidden");
	          }
	          
	          
	          $('.story_list').html(htmls);
	          
			}
			, error: function(error){
				console.log("에러 : " + error);
			}
		});
	}
  </script>
  
  
  <script>

     // 왼쪽 버튼
     function prev_action() {
        page--; // 페이지 번호 -1
      
        // 왼쪽 버튼 비활성화
        if (page < 1) {
           $('.story_prev').css("visibility", "hidden");
        }
        
        // 오른쪽 버튼 활성화
        if (Math.floor(length / 6) > page) {
           $('.story_next').css("visibility", "visible");
        }
     }
     
     // 오른쪽 버튼
     function next_action() {
        page++; // 페이지 번호 +1
        
        // 왼쪽 버튼 활성화
        if (page > 0) {
           $('.story_prev').css("visibility", "visible");
        }

        // 오른쪽 버튼 비활성화
        if (Math.floor(length / 6) <= page) {
           $('.story_next').css("visibility", "hidden");
        }
     }
  </script>

 <script>
  
  $(document).ready(function(){
	
     

     let like_n = document.querySelectorAll('#like_n');
     let like_y = document.querySelectorAll('#like_y');
     
     let idx = document.querySelectorAll('#idx');
     let board_idx = document.querySelectorAll('#board_idx');

     let but = document.querySelectorAll('.likeBut');
     
     let count = document.querySelectorAll('.likec');
     
     
     for(let a=0; a < but.length; a++){
        
        but[a].addEventListener('click', function(event) {
           // 이벤트 발생한 요소가 자식 요소인 경우에만 이벤트 처리
           if (event.target && event.target.matches('#like_y')) {
             // 자식 요소에 대한 이벤트 처리
             
                       console.log(board_idx[a].value);
             
                       var like= { "idx": idx[a].value, "board_idx": board_idx[a].value }
                    
                    $.ajax({
                          url : "/roomie/likeBdelete.ya" 
                          ,data : like
                          ,success: function(like){      
                             
                             console.log(idx[a].value + "board_idx" + board_idx[a].value);
                           //console.log(but[a].getAttribute('id'));
                           
                           
                           $('#' + but[a].getAttribute('id')).load(location.href + ' #' + but[a].getAttribute('id'));
                           
                           //특정 div 새로고침
                           //$('#div').load(location.href + ' #div');
                             
                           $('#' + count[a].getAttribute('id')).load(location.href + ' #' + count[a].getAttribute('id'));
     

                          },error : function(request,error,data){
                             alert("실패");
                              console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
                          }
                      });//ajax  
                           
           } else if(event.target && event.target.matches('#like_n')){
              
              console.log(board_idx[a].value);
              
              
              var like= { "idx": idx[a].value, "board_idx": board_idx[a].value }
              
              $.ajax({
                    url : "/roomie/likeBinsert.ya" 
                    ,data : like
                    ,success: function(){              

                       console.log(idx[a].value + "board_idx" + board_idx[a].value);
                       //console.log(but[a].getAttribute('id'));
                       
                       $('#' + but[a].getAttribute('id')).load(location.href + ' #' + but[a].getAttribute('id'));
                   
                       $('#' + count[a].getAttribute('id')).load(location.href + ' #' + count[a].getAttribute('id'));
                       
                       webSocket.send('5#' + board_id[a].value);
            
                    },error : function(request,error,data){
                       alert("실패");
                        console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
                    }
                });//ajax  
              
           }
         });
        
     }
     
     
     
   
  });//document.ready
  
  </script> 

<script>
  
  let but = document.querySelectorAll('.more_details'); 
  let idx = document.querySelectorAll('#bo_idx');
  let name = document.querySelectorAll('#bo_name');
  let mem = document.querySelectorAll('#bo_mem');

  
  for(let len=0; len < but.length; len++){
	  
	  but[len].addEventListener('click',function(){
		 
		    console.log(idx[len].value); 
			$("#modal_overlay1").css("display", "flex");	
			var bo_idx = idx[len].value;
			var bo_name = name[len].value;
			var bo_mem = mem[len].value;
			
			sessionStorage.setItem("BO_IDX", bo_idx ); // 저장
			sessionStorage.setItem("BO_NAME", bo_name ); // 저장
			sessionStorage.setItem("BO_MEM", bo_mem ); // 저장
			
			 console.log(bo_idx);
			 console.log("BO_NAME 확인 : " + bo_name);
			
			 console.log("세션 저장 확인 : " + sessionStorage.getItem("BO_IDX")); // mineItRecord
			
			/* $.ajax({
			    url: "report.ya",
			    type: "POST",
			    data: { bo_idx: bo_idx },
			    success: function(data) {
			    	
			    	//$('#report1').load(location.href + ' #report1');
			        console.log("전송 성공");
			        console.log(bo_idx);
			        sessionStorage.setItem("BO_IDX", bo_idx ); // 저장
			        
			    },
			    error: function(xhr, status, error) {
			        console.error("전송 실패: " + error);
			    }
			});  */
		  
	  });
	  
  }
  

  
  </script>

<script>
$(window).on('load',function (){
	
	var MEM_ID = '<%=(String)session.getAttribute("MEM_ID")%>';

	/* 알림 표시 추가 */
	$.ajax({
		  url : "boardNotif.ya"
		, type : 'POST'
		, data : {"CHAT_MYID" : MEM_ID}
		, dataType : 'text'
		, success: function(result){
			
			//1.메시지 알림 표시 여부
			if(result.split("#")[1] == "true"){
				var messageNotification = '<img style="width: 10px; height: 10px;" src="resources/image/icon_notification2.png">';
				$("#msgAlarm").html(messageNotification); //채팅 아이콘에 메시지 알림 아이콘 추가.
			}
			
			//2.활동 알림 표시 여부(좋아요, 댓글, 팔로우 등...)
			if(result.split("#")[2] == "true"){
				var likeNotification = '<img style="width: 10px; height: 10px;" src="resources/image/icon_notification2.png">';
				$("#notifAlarm").html(likeNotification); //알림 아이콘에 메시지 알림 아이콘 추가.
			}
			
		}
		, error: function(error){
			alert("실패3");
			console.log("에러 : " + JSON.stringify(error));
		}
	});
	
	/* 알림 리스트 추가 */
	$.ajax({
		  url : "alarmList.ya"
		, type : 'POST'
		, data : {"MEM_ID" : MEM_ID}
		, dataType : 'json'
		, success: function(result){
			
			var htmls = "";
				
				//LikeController의 alarmList에서 반송된 List<Map>형식의 데이터를 2중 for문을 통해 사용.
				for(var i=0; i<result.length; i++){ //알림은 최대 3개까지만 표시.
					
					if(i == 3){break} //좋아요 알림은 3개까지만 표시.
					
					if(result[i]["NOTIFLIKE_CHECK"] == 1){ //확인하지 않은 알림의 경우(배경색이 흰색)
					
						htmls +=		'<div class="alarm_list1" id="' + result[i]["NOTIFLIKE_IDX"]  +'notifLikeIdx" style="display: flex; padding: 10px;">';
						htmls +=			'<div>';
						htmls +=				'<img class="alarm_profileImg" src="resources/image/profile_05.jpg">';
						htmls +=			'</div>';
						htmls +=			'<div style="font-size: 14px; color: gray;">';
						htmls +=				result[i]["NOTIFLIKE_SENDER"]  + '님이<br>';
						htmls +=				result[i]["NOTIFLIKE_BOARD"] + '글을 좋아합니다^^';
						htmls +=			'</div>';
						htmls +=		'</div>';
					
					}else{ //이미 확인한 알림의 경우
						
						htmls +=		'<div class="alarm_list0" id="' + result[i]["NOTIFLIKE_IDX"]  +'notifLikeIdx" style="display: flex; padding: 10px;">';
						htmls +=			'<div>';
						htmls +=				'<img class="alarm_profileImg" src="resources/image/profile_05.jpg">';
						htmls +=			'</div>';
						htmls +=			'<div style="font-size: 14px; color: gray;">';
						htmls +=				result[i]["NOTIFLIKE_SENDER"]  + '님이<br>';
						htmls +=				result[i]["NOTIFLIKE_BOARD"] + '글을 좋아합니다^^';
						htmls +=			'</div>';
						htmls +=		'</div>';		
				
					}
					
				}
				$("#likeAlarmList").html(htmls); //id="likeAlarmList"인 요소 하위에 htlmls 추가.
			
		}
		, error: function(error){
			alert("실패3");
			console.log("에러 : " + JSON.stringify(error));
		}
	});
	
}
)
</script>

<script> /* 알림 리스트(class="alarm_list1")를 클릭했을 때 발생하는 이벤트 */
$(document).on('click','.alarm_list1',function(e){
	
	e.preventDefault(); //버블링 방지
	var notifLikeIdx = e.currentTarget.id.replace("notifLikeIdx","");
	
	//좋아요 알림을 지우기위한 변수
	var paramData1 = {
			"TYPE" : "1"
			, "NOTIFLIKE_IDX" : notifLikeIdx
		};

	$.ajax({
		  url : "checkAlarm.ya"
		, type : 'POST'
		, data : paramData1
		
		, success: function(result){
		
			/* 알림 데이터를 확인 */
			
		}
		, error: function(error){
			alert("실패3");
			console.log("에러 : " + JSON.stringify(error));
		}
	});
	
	//click한 대상의 class를 변경.
	$('.alarm_list1[id ="' + e.currentTarget.id + '"]').addClass('alarm_list0');
	$('.alarm_list1[id ="' + e.currentTarget.id + '"]').removeClass('alarm_list1');
	
})

</script>

<script> /* 알림 버튼의 위치에따라 모달창의 위치를 유동적으로 바꾸는 기능 */
	const button = document.querySelector('#notifBtn');
	const modal = document.querySelector('.test_modal');
	
	positionModal();
	
	window.addEventListener('resize', positionModal);
	
	function positionModal() {
		const rect = button.getBoundingClientRect();
		const modalRect = modal.getBoundingClientRect();
		
		const top = rect.top + window.pageYOffset + rect.height;
		const left = rect.left + window.pageXOffset;
		
		modal.style.top = (top + 30) + 'px';
		modal.style.left = (left - 150) + 'px';
	}
</script>

<script>
	$(document).ready(function(){
	    // 이미지 슬라이더 설정
	    $('.slider').slick({
	        infinite: true,
	        slidesToShow: 1,
	        slidesToScroll: 1
	    });
	});
</script>
     
</body>
</html>