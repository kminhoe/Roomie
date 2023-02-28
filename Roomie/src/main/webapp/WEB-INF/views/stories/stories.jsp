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
	       src="./resources/image/profile_05.jpg">
	</div>
	<div class="name_content">
	  <!-- 사용자 이름 -->
	  <span class="feed_name_txt"> ${STORIES[0].MEM_USER} </span>
	</div>
  </div>
  
  <!-- 스토리스 슬라이드 시작 -->
  <div data-slide="slide" class="slide">
    <div class="slide-items" id="slide-items">
  		<!-- 스토리 리스트 시작 -->
        <c:forEach items="${STORIES}" var="S">     
			<c:set var = "STORY_IMAGE" value = "${S.STORY_IMAGE}"/>
			<c:set var = "length" value = "${fn:length(STORY_IMAGE)}"/>

			<c:choose>
				<c:when test="${fn:substring(STORY_IMAGE, length -4, length) == '.mp4'}">
			        <video id="videos" muted style="display: block; max-width: 100%;">
			            <source src="./resources/image/${S.STORY_IMAGE}" type="video/mp4">
			        </video>
				</c:when>
				<c:otherwise>
					<img src="./resources/image/${S.STORY_IMAGE}" alt="${S.STORY_IDX}">
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
        <button class="slide-next">Next</button>
    </nav>
  </div>
  
  <!-- 스토리 슬라이드 끝 -->

  <script src="./resources/js/stories.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  
  <script>
/* 	 $(document).ready(function(){
		 readStories();
	 }) */
  </script>
  
  <script>
/* 	 function readStories() {
			var paramData = {"MEM_ID": "k_2668536757"};
			var htmls = '';
			
			htmls += '<img src="./resources/image/cat1.png" alt="Cat 1">';
			htmls += '<img src="./resources/image/cat2.png" alt="Cat 2">';
			htmls += '<img src="./resources/image/cat3.png" alt="Cat 3">';
			htmls += '<img src="./resources/image/cat4.png" alt="Cat 4">';

			$.ajax({
				url: "/roomie/selectStories.ya"
				, data : paramData 
				, type : 'POST'
				, dataType : 'json'
				, success: function(status){
	                console.log(status);
	                
	                
	                $('.slide-items').replaceWith(htmls);
	                
				}
				, error: function(error){
					console.log("에러 : " + error);
				}
			});
		}  */
  </script>
</body>
</html>