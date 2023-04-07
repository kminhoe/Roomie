<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!doctype html>
<html lang="utf-8">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="./resources/css/stories_style.css">
  <!-- 타이틀 -->
  <title>스토리 • ROOMIE</title>
</head>
<body>
  <!-- 스토리 시작 -->

  <!-- 피드 프로필 -->
  <div class="feed_name">
	<div class="profile_box">
	  <img class="profile_img"
	       src="./resources/files/profile/${STORIES[0].MEM_MEDIA}">
	</div>
	<div class="name_content">
	  <!-- 사용자 이름 -->
	  <span class="feed_name_txt"> ${STORIES[0].MEM_USER} </span>
	</div>
  </div>
  <!-- 스토리스 슬라이드 시작 -->
  <div data-slide="slide" class="slide">
  	<img src="./resources/image/icon_41.png" style="width: 30px; height: 30px; margin-left: 410px; margin-top: 10px; position: fixed; z-index: 2; cursor: pointer;" alt="close" onclick="window.location.href='boardList.ya'">
    <div class="slide-items" id="slide-items">
  		<!-- 스토리 리스트 시작 -->
        <c:forEach items="${STORIES}" var="S">     
			<c:set var = "STORY_IMAGE" value = "${S.STORY_IMAGE}"/>
			<c:set var = "length" value = "${fn:length(STORY_IMAGE)}"/>

			<c:choose>
				<c:when test="${fn:substring(STORY_IMAGE, length -4, length) == '.mp4'}">
			        <video id="videos${S.STORY_IDX}" muted style="display: block; max-width: 100%;">
			            <source src="./resources/files/stories/${S.STORY_IMAGE}" type="video/mp4">
			        </video>
				</c:when>
				<c:otherwise>
					<img src="./resources/files/stories/${S.STORY_IMAGE}" alt="${S.STORY_IDX}">
				</c:otherwise>
			</c:choose>
        </c:forEach>
        <!-- 스토리 리스트 끝 -->
    </div>
    <input class="slide-text" type="text" placeholder="${STORIES[0].MEM_USER}님에게 답장하기...">
    <!-- 스토리 오른쪽, 왼쪽 버튼 -->
    <nav class="slide-nav">
        <div class="slide-thumbs"></div>
        <button class="slide-prev">Previous</button>
        <button class="slide-next" id="slide-next">Next</button>
    </nav>
  </div>
  <!-- 스토리 슬라이드 끝 -->
  
  <!-- 스토리 읽기 -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
  	function story_check(index) {
  		var stories_length = '${fn:length(STORIES)}'
		var arr = new Array();
		
  		try {
	 		<c:forEach items = "${STORIES}" var = "item">
	 			arr.push(${item.STORY_IDX})
	 		</c:forEach>
	
			console.log("인덱스 : " + arr[index]);
			
	   		var paramData = {
	  				"SC_MEM" : "${MEM_ID}",
	  				"STORY_IDX" : arr[index]
	  			};
	  		
			$.ajax({
				url: "/roomie/storiesCheck.ya"
				, data : paramData 
				, type : 'POST'
				, dataType : 'json'
				, success: function(status){
		          	// console.log(status);
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		} catch(e) {
			console.log("오류")
		}
  	}
  </script> 
  <script>
  
  	// 스토리 이미지 or 동영상 확장자 확인
  	function ext(index) {
		var arr = new Array();
		
  		try {
	 		<c:forEach items = "${STORIES}" var = "item">
 				arr.push('${item.STORY_IMAGE}')
 			</c:forEach>
		
 			str = arr[index];
 				
	 		return str.slice(-4);
		} catch(e) {
			console.log("오류 : " + e)
		}
  	}
  </script>
  <script defer type="text/javascript" src="./resources/js/stories.js?2134325"></script>
</body>
</html>