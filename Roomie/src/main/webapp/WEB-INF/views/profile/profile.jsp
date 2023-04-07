<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ include file="uploadModal.jsp" %> --%>
<!doctype html>

<html lang="utf-8">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">


<!--Modal-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
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

<!-- style css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/modal_style.css">
<!-- jquery 사용하기 위해 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 타이틀 -->
<title>ROOMIE</title>

<style>
/*
All grid code is placed in a 'supports' rule (feature query) at the bottom of the CSS (Line 310). 
    
The 'supports' rule will only run if your browser supports CSS grid.
Flexbox and floats are used as a fallback so that browsers which don't support grid will still recieve a similar layout.
*/
html, body {
	height: 100vh;
	height: calc(var(- -vh, 1vh)* 100);
}

/* Base Styles */
:root {
	font-size: 10px;
}

*, *::before, *::after {
	box-sizing: border-box;
}

body {
	font-family: "Open Sans", Arial, sans-serif;
	min-height: 100vh;
	background-color: #fafafa;
	color: #262626;
	padding-bottom: 3rem;
}

.container {
	max-width: 93.5rem;
	margin: 0 auto;
	padding: 0 2rem;
}

.btn {
	display: inline-block;
	font: inherit;
	background: none;
	border: none;
	color: inherit;
	padding: 0;
	cursor: pointer;
}

.btn:focus {
	outline: 0.5rem auto #4d90fe;
}

.visually-hidden {
	position: absolute !important;
	height: 1px;
	width: 1px;
	overflow: hidden;
	clip: rect(1px, 1px, 1px, 1px);
}

/* Profile Section */
.profile {
	padding: 5rem 0;
}

.profile::after {
	content: "";
	display: block;
	clear: both;
}

.profile-image {
	float: left;
	width: calc(33.333% - 1rem);
	display: flex;
	justify-content: center;
	align-items: center;
	margin-right: 3rem;
}

.profile-image img {
	border-radius: 50%;
}

.profile-user-settings, .profile-stats, .profile-bio {
	float: left;
	width: calc(66.666% - 2rem);
}

.profile-user-settings {
	margin-top: 1.1rem;
}

.profile-user-name {
	display: inline-block;
	font-size: 3.2rem;
	font-weight: 300;
}

.profile-edit-btn {
	font-size: 1.4rem;
	line-height: 1.8;
	border: 0.1rem solid #dbdbdb;
	border-radius: 0.3rem;
	padding: 0 2.4rem;
	margin-left: 2rem;
}

.profile-settings-btn {
	font-size: 2rem;
	margin-left: 1rem;
}

.profile-stats {
	margin-top: 2.3rem;
}

.profile-stats li {
	display: inline-block;
	font-size: 1.6rem;
	line-height: 1.5;
	margin-right: 4rem;
	cursor: pointer;
}

.profile-stats li:last-of-type {
	margin-right: 0;
}

.profile-bio {
	font-size: 1.6rem;
	font-weight: 400;
	line-height: 1.5;
	margin-top: 2.3rem;
}

.profile-real-name, .profile-stat-count, .profile-edit-btn {
	font-weight: 600;
}

/* Gallery Section */
.gallery {
	display: flex;
	flex-wrap: wrap;
	margin: -1rem -1rem;
	padding-bottom: 3rem;
}

.gallery-item {
	position: relative;
	flex: 1 0 22rem;
	margin: 1rem;
	color: #fff;
	cursor: pointer;
}

.gallery-item:hover .gallery-item-info, .gallery-item:focus .gallery-item-info
	{
	display: flex;
	justify-content: center;
	align-items: center;
	position: absolute;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.3);
}

.gallery-item-info {
	display: none;
}

.gallery-item-info li {
	display: inline-block;
	font-size: 1.7rem;
	font-weight: 600;
}

.gallery-item-likes {
	margin-right: 2.2rem;
}

.gallery-item-type {
	position: absolute;
	top: 1rem;
	right: 1rem;
	font-size: 2.5rem;
	text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
}

.fa-clone, .fa-comment {
	transform: rotateY(180deg);
}

.gallery-image {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

/* Loader */
.loader {
	width: 5rem;
	height: 5rem;
	border: 0.6rem solid #999;
	border-bottom-color: transparent;
	border-radius: 50%;
	margin: 0 auto;
	animation: loader 500ms linear infinite;
}

/* Media Query */
@media screen and (max-width: 40rem) {
	.profile {
		display: flex;
		flex-wrap: wrap;
		padding: 4rem 0;
	}
	.profile::after {
		display: none;
	}
	.profile-image, .profile-user-settings, .profile-bio, .profile-stats {
		float: none;
		width: auto;
	}
	.profile-image img {
		width: 7.7rem;
	}
	.profile-user-settings {
		flex-basis: calc(100% - 10.7rem);
		display: flex;
		flex-wrap: wrap;
		margin-top: 1rem;
	}
	.profile-user-name {
		font-size: 2.2rem;
	}
	.profile-edit-btn {
		order: 1;
		padding: 0;
		text-align: center;
		margin-top: 1rem;
	}
	.profile-edit-btn {
		margin-left: 0;
	}
	.profile-bio {
		font-size: 1.4rem;
		margin-top: 1.5rem;
	}
	.profile-edit-btn, .profile-bio, .profile-stats {
		flex-basis: 100%;
	}
	.profile-stats {
		order: 1;
		margin-top: 1.5rem;
	}
	.profile-stats ul {
		display: flex;
		text-align: center;
		padding: 1.2rem 0;
		border-top: 0.1rem solid #dadada;
		border-bottom: 0.1rem solid #dadada;
	}
	.profile-stats li {
		font-size: 1.4rem;
		flex: 1;
		margin: 0;
	}
	.profile-stat-count {
		display: block;
	}
}

/* Spinner Animation */
@
keyframes loader {to { transform:rotate(360deg);
	
}

}

/*
The following code will only run if your browser supports CSS grid.
Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling. 
*/
@
supports (display: grid) { .profile { display:grid;
	grid-template-columns: 1fr 2fr;
	grid-template-rows: repeat(3, auto);
	grid-column-gap: 3rem;
	align-items: center;
}

.profile-image {
	grid-row: 1/-1;
}

.gallery {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(22rem, 1fr));
	grid-gap: 2rem;
}

.profile-image, .profile-user-settings, .profile-stats, .profile-bio,
	.gallery-item, .gallery {
	width: auto;
	margin: 0;
}

@media ( max-width : 40rem) {
	.profile {
		grid-template-columns: auto 1fr;
		grid-row-gap: 1.5rem;
	}
	.profile-image {
		grid-row: 1/2;
	}
	.profile-user-settings {
		display: grid;
		grid-template-columns: auto 1fr;
		grid-gap: 1rem;
	}
	.profile-edit-btn, .profile-stats, .profile-bio {
		grid-column: 1/-1;
	}
	.profile-user-settings, .profile-edit-btn, .profile-settings-btn,
		.profile-bio, .profile-stats {
		margin: 0;
	}
}

}
@media ( max-width : 1100px) {
	.form-control {
		width: 150px !important;
	}
}

@import
	url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

body {
	font-family: "Poppins", sans-serif;
}

.btn.dropdown-toggle {
	width: 150px;
	text-align: center;
}

span.caret {
	position: absolute;
	left: 90%;
	top: 45%;
}

label {
	padding-top: 5px;
}

.form-label {
	padding-left: 0px !important;
}

.form-control {
	border-radius: 100px;
}

.btn-success {
	background-color: #3b7d4a im !important;
	border-radius: 100px;
	border: none;
	cursor: pointer;
}

.btn-success:hover {
	background-color: #4daf64;
}

img.track {
	border: 3px solid #8a8a8a;
}

.image-upload-button{
  padding: 6px 25px;
  background-color:#98BCD5;
  border-radius: 4px;
  color: white;
  cursor: pointer;
}
/* modal post */
.optionline {
   margin-top: 300px;
   width: 100%;
}

._ab3p {
   display: flex;
   justify-content: flex-start;
   margin-bottom: 16px;
}

._ad6_ {
   padding-left: 32px;
   padding-right: 32px;
   text-align: right;
   box-sizing: border-box;
   color: rgb(var(- -ig-primary-text));
   flex: 0 0 194px;
   font-size: 16px;
   font-weight: 600;
   line-height: 18px;
   margin-top: 6px;
}

._ab3q {
   font-size: 16px;
   font-weight: 600;
   vertical-align: baseline;
}

._ab3t {
   align-items: stretch;
   border: 0;
   box-sizing: border-box;
   color: rgb(var(- -ig-primary-text));
   display: flex;
   flex-direction: column;
   flex-grow: 1;
   flex-shrink: 0;
   font: inherit;
   font-size: 16px;
   justify-content: flex-start;
   margin: 0;
   padding: 0;
   position: relative;
   vertical-align: baseline;
}

._acyg {
   align-items: stretch;
   border: 0;
   display: flex;
   flex-direction: column;
   font: inherit;
   font-size: 100%;
   margin: 0;
   margin-bottom: 16px;
   margin-top: 32px;
   padding: 0;
   vertical-align: baseline;
}

</style>
</head>
<body>

	<!-- 상단 내비게이션 바 시작 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="z-index: 10000; width: 100%; position: fixed; top: 0px;">
		<div class="container">
			<img class="navbar-brand" style="height: 30px; object-fit: contain;"
				src="resources/image/roomie_logo_1.png">

			<!-- 검색창 -->
			<!-- <input class="form-control" style="width: 200px" type="search" placeholder="Search" aria-label="Search"> -->

			<div>
				<!-- 홈 버튼 -->
				<img class="menu_img"
					style="width: 25px; height: 25px; object-fit: contain"
					src="resources/image/icon_09.png"> &nbsp;&nbsp;
				<!-- 검색 버튼 -->
				<img class="menu_img"
					style="width: 25px; height: 25px; object-fit: contain"
					src="resources/image/icon_07.png"> &nbsp;&nbsp;
				<!-- 탑색 탭 버튼 -->
				<img class="menu_img"
					style="width: 25px; height: 25px; object-fit: contain"
					src="resources/image/icon_22.png"> &nbsp;&nbsp;
				<!-- 채팅 버튼 -->
				<img class="menu_img"
					style="width: 25px; height: 25px; object-fit: contain"
					src="resources/image/icon_04.png"> &nbsp;&nbsp;
				<!-- 알림 버튼 -->
				<img class="menu_img"
					style="width: 25px; height: 25px; object-fit: contain"
					src="resources/image/icon_01.png"> &nbsp;&nbsp;
			</div>
		</div>
	</nav>
	<!-- 상단 내비게이션 바 끝 -->



	<div class="container">
		<div class="profile">
			
			<div class="profile-image">
				<c:choose>
					<c:when test="${user.MEM_MEDIA == null }">
						<img style="width: 200px; height: 200px;"
							src="resources/image/icon_06.png" alt="">
					</c:when>
					<c:otherwise>
						<img style="width: 200px; height: 200px;"
							src="${user.MEM_MEDIA}" alt="">
					</c:otherwise>
				</c:choose>
			</div>

			<div class="profile-user-settings">
			
				<h1 class="profile-user-name">@${user.MEM_USER}</h1>
				<input type="hidden" id="elwey" value="${user.MEM_ID}" >
				<c:choose>
				<c:when test="${user.MEM_ID != session}">
					
					<c:choose>
						<c:when test="${follow.ISFOLLOW == 'F' || follow.FRI_MEM == user.MEM_ID}">
					<input type="button" class="btn profile-edit-btn btn btn-primary"
					id="unfollow_profile" value="FOLLOWING">
						</c:when>
						<c:otherwise>
					<input type="button" class="btn profile-edit-btn btn btn-primary"
					id="follow_profile" value="FOLLOW">
						</c:otherwise>
					</c:choose>
					<button class="btn profile-edit-btn">송금하기</button>
				</c:when>
				<c:otherwise>
				<button class="btn profile-edit-btn btn btn-primary"
					id="edit_profile">프로필 수정하기</button>
					
					<button class="btn profile-edit-btn btn btn-primary"
					aria-label="profile settings" onclick="location.href='/roomie/optionList.ya'">
					<i class="fas fa-cog" aria-hidden="true">설정</i>
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;
					<a  id="add_feed"><img
					style="width: 30px; height: 27px;"
					src="resources/image/icon_08.png"></a><br>

				
				</c:otherwise>
				</c:choose>
				

				

			</div>

			<div class="profile-stats">
				<ul>
					<li><span class="profile-stat-count">
					<input type="hidden" name="BO_MEM" value="${user.MEM_IDX}">
					<c:choose>
						<c:when test="${empty board.POSTS}">
							0
						</c:when>
						<c:otherwise>
							${board.POSTS}
						</c:otherwise>
					</c:choose>
					</span> 글</li>
					<li id="followers"><span class="profile-stat-count">
						<c:choose>
						<c:when test="${empty follow.CNT}">
							0
						</c:when>
						<c:otherwise>
							${follow.CNT}
						</c:otherwise>
						</c:choose>
						</span>
						팔룸잉</li>
					<li id="following"><span class="profile-stat-count">
						<c:choose>
						<c:when test="${empty following.CNT}">
							0
						</c:when>
						<c:otherwise>
							${following.CNT}
						</c:otherwise>
						</c:choose>
					</span>
						팔룸워</li>
				</ul>

			</div>

			<div class="profile-bio">

				<p>
					<span class="profile-real-name">${user.MEM_NAME}</span>
					${user.MEM_CONT}
					<button class="btn profile-edit-btn btn btn-primary" id="mbti"
						onclick="location.href= 'https://www.16personalities.com/ko/%EC%84%B1%EA%B2%A9%EC%9C%A0%ED%98%95-${user.MEM_MBTI}'">${user.MEM_MBTI}</button>
					<c:choose>
					<c:when test="${empty user.MEM_MUSIC}"></c:when>
					<c:otherwise>
					</c:otherwise>
					</c:choose>
				</p>

			</div>

		</div>
		<!-- End of profile section -->

	</div>
	<!-- End of container -->

	<c:choose>
	<c:when test="${empty user.MEM_MUSIC}"></c:when>
	<c:otherwise>
    	<iframe style="border-radius:12px; height:30%;" src="https://open.spotify.com/embed/track/${user.MEM_MUSIC}" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
	</c:otherwise>
	</c:choose>
	<div class="container">
		
		<div class="gallery">
			<c:forEach items="${boardList}" var="post" varStatus="vs">
			
			
			<div id="post${vs.index}" align="center" class="gallery-item" tabindex="0">
				<img 
					src="${post.BO_MEDIA}"
					class="gallery-image" alt="">
				
				
				<div class="gallery-item-info">

					<ul>
						<li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i
							class="fas fa-heart" aria-hidden="true"></i><img
							src="resources/image/icon_01.png"
							style="height: 30px; width: 30px;"> 56</li>
						<li class="gallery-item-comments"><span
							class="visually-hidden">Comments:</span><i class="fas fa-comment"
							aria-hidden="true"></i><img src="resources/image/icon_03.png"
							style="height: 30px; width: 30px;"> 2</li>
					</ul>
				
				</div>
			</div>
			<!-- 모달 시작 -->
		<div id="modal_post${vs.index}" class="modal_overlay" style="z-index:1050; height: -webkit-fill-available; position: fixed;">
			
		<div class="modal_title_side">
					<span style="cursor: grab;" id="close_modal5${vs.index}"
						class="material-icons-outlined"> close </span>
				</div>
			<div style="width: 80vw; height: calc(var(- -vh, 1vh)* 84); overflow: hidden; overflow-y: auto;">
			<div class="contents">
			<div  class="row">
			<div class="col-md-8">
			<div class="border feed_box" style="width: auto; margin:0px;">
        
        <img class="feed_img" src="${post.BO_MEDIA }">
  		
       
        
      </div>
	</div>
	
	<div class="col-md-4" style="background-color:white;">
	<div class="feed_name">
          <div class="profile_box">
            <img class="profile_img" src="${user.MEM_MEDIA }">
          </div>
          <span class="feed_name_txt"> ${user.MEM_NAME } </span>
        </div>
	 <div class="feed_icon">
          <div>
            <!-- 좋아요 버튼 -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_01.png">
            <!-- 댓글 버튼 -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_03.png">
            <!-- 공유 버튼 -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_04.png">
          </div>
          <div>
            <!-- 게시글 저장 버튼 -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_05.png">
          </div>
        </div>
        <div class="feed_like">
          <!-- 좋아요 표시 -->
          <br>
          <p class="feed_txt"> <b>좋아요 10개 </b></p>
        </div>
        <div class="feed_content">
          <!-- 이름, 게시글 내용 -->
          <p class="feed_txt"> <b> ${user.MEM_NAME} </b> ${post.BO_CONT}</p>
          
     
        </div>
        <!-- 댓글 목록 -->
        <div style="padding-left:10px;">
        <input type="hidden" name="COM_WRITER" id="comment_writer" value="${session}">
        <input type="text" value="${post.BO_IDX}" name="BO_IDX" id="comment_artno">
        <input type="text" name="COM_CONT" id="comment_content"> <button id="comment_submit">전송</button>
        <br>
        <hr>
        <br>
        	${commentList}
        	<c:forEach var="coms" items="${commentList}">
          <span class="feed_txt"> <b> ${coms.COM_WRITER } </b> ${coms.COM_CONT}</span>
          <button id="comment_reply">reply</button>
          <br>
          </c:forEach>
         </div>
        </div>
	</div>
	</div>
	</div>
				
	</div>	
	<script>
	 var index = '<c:out value='${vs.index}'/>'
	 var BO_IDX = document.getElementById("comment_artno");
	 var COM_WRITER = document.getElementById("comment_writer");
	 var COM_CONT = document.getElementById("comment_content");

	 
	   for(i = 0; i <= index; i++){
		   	const modal5 = document.getElementById("modal_post"+index);
	    	const buttonAddFeed5 = document.getElementById("post"+index);
	    		buttonAddFeed5.addEventListener("click", function(){
	    		modal5.style.top = window.pageYOffset = 'px';
	    		modal5.style.display = "flex";
	    		document.body.style.overflow = "hidden";
	    		console.log(BO_IDX);
	    });
	    	const buttonCloseModal5 = document.getElementById("close_modal5"+index);
	        buttonCloseModal5.addEventListener("click", function() {
	   	        modal5.style.display = "none";
	   	        document.body.style.overflowY = "visible";
	    	 });
	   }



		
		$(document).on('click', '#comment_submit', function(e){
			e.preventDefault();
	   
	   
	   var param = {"BO_IDX" : BO_IDX.value, 
	         "COM_WRITER" : COM_WRITER.value, 
	         "COM_CONT" : COM_CONT.value
	         }
	   console.log(param);
	$.ajax({
		url: "/roomie/insertComment.ya",
		data: param,
		type: "POST",
		success: function(res){
			alert("comment 완료");
			location.reload();
		},
		error: function(jqXHR, status, err){
			alert(jqXHR.responseText);
			location.reload();
		}
	})
})


</script>
	
		</c:forEach>


		</div>
		
		<!-- End of gallery -->

		<!-- <div class="loader"></div> -->

	</div>
	<!-- End of container -->
	<script>
        /*
Full-page view:
*/

// const posts = document.querySelectorAll('.gallery-item');

// posts.forEach(post => {
// 	post.addEventListener('click', () => {
// 		//Get original image URL
// 		const imgUrl = post.firstElementChild.src.split("?")[0];
// 		//Open image in new tab
// 		window.open(imgUrl, '_blank');
// 	});
// });

    </script>

	<div id="modal_edit_profile" class="modal_overlay">
		<div class="modal_window"
			style="width: 80vw; height: calc(var(- -vh, 1vh)* 84); overflow: hidden; overflow-y: auto;">
			<input type="hidden" value="${user.MEM_IDX}" id="idx" name="MEM_IDX">
			<input type="hidden" value="${user.MEM_ID}" id="idx" name="MEM_ID">
			<div class="modal_title">
				<div class="modal_title_side">
					<span style="cursor: grab;" id="close_modal"
						class="material-icons-outlined"> close </span>
				</div>
				<div class="modal_title_side">프로필 수정</div>
				<div class="modal_title_side">
					<span style="cursor: grab;" id="submit_modal"
						class="material-icons-outlined"> done </span>
				</div>
			</div>
			<br>
			<div style=" display: flex; justify-content: center;">
				<img src="${user.MEM_MEDIA}" id="preview" style="border-radius: 50%; width:75px; height:75px;">
			</div>
			<div style=" display: flex; justify-content: center; padding-top: 10px;">
				<label class="image-upload-button" for="image">
 					 업로드
				</label>
				<input type="file" id="image" name="MEM_MEDIA" style="display:none;">
			</div>
			<br>
			<hr>
			<div class="modal_contents">
				<label for="Name" style="padding-right: 150px; font-size: 15px;">이름</label>
				<input type="text" class="login-input" style="height: 30px"
					id="name" name="MEM_NAME" value="${user.MEM_NAME}"><br>
				<label for="Username" style="padding-right: 140px; font-size: 15px;">아이디</label>
				<input type="text" class="login-input" style="height: 30px" id="id"
					name="MEM_ID" value="${user.MEM_ID}"><br> <label
					for="Bio" style="padding-right: 155px; font-size: 15px;">Bio</label>
				<input type="text" class="login-input" style="height: 30px" id="bio"
					name="MEM_CONT" value="${user.MEM_CONT}"><br><br> <label
					for="Links" style="padding-right: 150px; font-size: 15px;">MUSIC</label>
				<label class="image-upload-button" for="music">
 					 곡 찾기
				</label>
				<input style="display:none;" type="button" id="music" name="MEM_MUSIC" value="${MEM_MUSIC}"><br>
				<label for="mbti" style="padding-right: 140px; font-size: 15px;">MBTI</label>
				<select class="login-input" id="mbtival" name="MEM_MBTI">
        	<option value="INTJ">INTJ</option>
        	<option value="INTP">INTP</option>
        	<option value="ENTJ">ENTJ</option>
        	<option value="ENTP">ENTP</option>
        	<option value="INFJ">INFJ</option>
        	<option value="INFP">INFP</option>
        	<option value="ENFJ">ENFJ</option>
        	<option value="ENFP">ENFP</option>
        	<option value="ISTJ">ISTJ</option>
        	<option value="ISFJ">ISFJ</option>
        	<option value="ESTJ">ESTJ</option>
        	<option value="ESFJ">ESFJ</option>
        	<option value="ISTP">ISTP</option>
        	<option value="ISFP">ISFP</option>
        	<option value="ESTP">ESTP</option>
        	<option value="ESFP">ESFP</option>
        </select>
				<%-- <input type="text" class="login-input" style="height: 30px"
					id="mbti" name="MEM_MBTI" value="${user.MEM_MBTI}"> --%><br>
			</div>
			<br>
		</div>
	</div>

	<div id="modal_followers" class="modal_overlay">
		<div class="modal_window"
			style="width: 80vw; height: calc(var(- -vh, 1vh)* 84); overflow: hidden; overflow-y: auto;">
			<div class="modal_title">
				<div class="modal_title_side">
					<span style="cursor: grab;" id="close_modal2"
						class="material-icons-outlined"> close </span>
				</div>
				<div class="modal_title_side">팔룸잉</div>
				<div class="modal_title_side">
					<span style="cursor: grab;" id="submit_modal2"
						class="material-icons-outlined"> done </span>
				</div>
			</div>
			<br> <br>
			<div style="padding-left: 35%;">
				<input class="form-control" style="width: 300px; height: 30px;"
					type="search" placeholder="Search" aria-label="Search">
			</div>
			<br>
			<hr>
			<c:forEach var="fo" items="${followerList}">
			<div class="modal_contents">
				<li>
					<div class="media">
						<div>
							<a href="javascript:void(0)"> <img style="padding-top: 3%; border-radius: 50%; width:75px; height:75px;"
								 src="${fo.MEM_MEDIA}" alt=""> <i></i>
							</a>
						</div>
						<div class="media-body">
							<div style="padding-top: 3%; padding-left: 5%;">
								<h3 href="javascript:void(0)"><a  style="text-decoration: none; color:black;" href="userProfile.ya?mem_idx=${fo.MEM_IDX}">${fo.MEM_NAME}</a></h3>
							</div>
							<div style="padding-left: 50%;" class="pull-right">
								<button type="button"
									class="btn profile-edit-btn btn btn-primary">
									<i class="icon md-check" aria-hidden="true"></i>Following
								</button>
							</div>
							<h5 style="padding-bottom: 3%; padding-left: 5%;"><a  style="text-decoration: none; color:black;" href="userProfile.ya?mem_idx=${fo.MEM_IDX}">@${fo.MEM_ID}</a></h5>
						</div>
					</div>
				</li>
				<hr>
			</div>
			</c:forEach>
		</div>
	</div>

	<div id="modal_following" class="modal_overlay">
		<div class="modal_window"
			style="width: 80vw; height: calc(var(- -vh, 1vh)* 84); overflow: hidden; overflow-y: auto;">
			<div class="modal_title">
				<div class="modal_title_side">
					<span style="cursor: grab;" id="close_modal3"
						class="material-icons-outlined"> close </span>
				</div>
				<div class="modal_title_side">팔룸워</div>
				<div class="modal_title_side">
					<span style="cursor: grab;" id="submit_modal3"
						class="material-icons-outlined"> done </span>
				</div>
			</div>
			<br> <br>
			<div style="padding-left: 35%;">
				<input class="form-control" style="width: 300px; height: 30px;"
					type="search" placeholder="Search" aria-label="Search">
			</div>
			<br> <br>
			<hr>
			<c:forEach var="fo" items="${followingList}">
			<div class="modal_contents">
				<li>
					<div class="media">
						<div>
							<a href="javascript:void(0)"> <img style="padding-top: 3%; border-radius: 50%; width:75px; height:75px;"
							 src="${fo.MEM_MEDIA}" alt=""> <i></i>
							</a>
						</div>
						<div class="media-body">
							<div style="padding-top: 3%; padding-left: 5%;">
								<h3 href="javascript:void(0)"><a style="text-decoration: none; color:black;" href="userProfile.ya?mem_idx=${fo.MEM_IDX}">${fo.MEM_NAME}</a></h3>
							</div>
							<div style="padding-left: 50%;" class="pull-right">
								<button type="button"
									class="btn profile-edit-btn btn btn-primary">
									<i class="icon md-check" aria-hidden="true"></i>Following
								</button>
							</div>
							<h5 style="padding-bottom: 3%; padding-left: 5%;"><a style="text-decoration: none; color:black;" href="userProfile.ya?mem_idx=${fo.MEM_IDX}">@${fo.MEM_ID}</a></h5>
						</div>
					</div>
				</li>
				<hr>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<div id="modal_music" class="modal_overlay">
		<div class="modal_window"
			style="width: 80vw; height: calc(var(- -vh, 1vh)* 84); overflow: hidden; overflow-y: auto;">
			<div class="modal_title">
				<div class="modal_title_side">
					<span style="cursor: grab;" id="close_modal4"
						class="material-icons-outlined"> close </span>
				</div>
				<div class="modal_title_side">Music</div>
				<div class="modal_title_side">
					
				</div>
			</div>
			<br> <br>
			<div style="padding-left: 35%;">
			<form id="search_spotify">
            <input class="login-input" style="padding-left: 10px:height: 30px" type="text" id="track" placeholder="Search Tracks">
            <input type="submit" value="Search" class="image-upload-button">
       		 </form>
			</div>
			<br> <br>
			<hr>
			<div class="modal_contents">
				<div class="container">
	<div class="gallery-item" style="color:#495057;">
        <div id="results_spotify"></div>
        </div>
</div>
				
			</div>

		</div>
	</div>
	

	
	
	

	<!-- ajax modify -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
	<script>

$(document).on('click', '#submit_modal', function(e){
	e.preventDefault();
	   var idx = document.getElementById("idx");
	   var name = document.getElementById("name");
	   var id = document.getElementById("id");
	   var bio = document.getElementById("bio");
	   var mbti = document.getElementById("mbtival");
	   
	   var param = {"MEM_IDX" : idx.value, 
	         "MEM_NAME" : name.value, 
	         "MEM_ID" : id.value, 
	         "MEM_CONT" : bio.value,  
	         "MEM_MBTI" : mbti.value}
	   console.log(param);
	$.ajax({
		url: "/roomie/userModifyAjax.ya",
		data: param,
		type: "POST",
		success: function(res){
			alert("수정 완료");
			location.reload();
		},
		error: function(jqXHR, status, err){
			alert(jqXHR.responseText);
			location.reload();
		}
	})
})


</script>

<script>
$(document).on('click', '#follow_profile', function(e){
	e.preventDefault();
	   var id = document.getElementById("id");
	   var fri_mem = document.getElementById("elwey");
	   var elem = document.getElementById("follow_profile");
	   console.log(elem.id);
	   console.log(idx.value);
	   var param = {
		   "FOLLOWING" : id.value, 
	       "FRI_MEM" : fri_mem.value
	         }
	   console.log(param);
	$.ajax({
		url: "/roomie/userFollow.ya",
		data: param,
		type: "POST",
		success: function(res){
			alert("입력 완료");
			e.preventDefault();
			if (elem.value=="FOLLOWING"){
		    	elem.value = "FOLLOW";
		    }
		    else {
		    	elem.value = "FOLLOWING";
		    	elem.setAttribute("id" , "unfollow_profile");
		    	console.log(elem.id)
		    }
		},
		error: function(jqXHR, status, err){
			alert("로그인 해주세요");
			location.href='login.ya';
		}
	})
})
</script>

<script>
$(document).on('click', '#unfollow_profile', function(e){
	e.preventDefault();
	   var id = document.getElementById("id");
	   var fri_mem = document.getElementById("elwey");
	   var elem = document.getElementById("unfollow_profile");
	   console.log(elem.id);
	   console.log(idx.value);
	   var param = {
		   "FOLLOWING" : id.value, 
	       "FRI_MEM" : fri_mem.value
	         }
	   console.log(param);
	$.ajax({
		url: "/roomie/userUnFollow.ya",
		data: param,
		type: "POST",
		success: function(res){
			alert("입력 완료");
			e.preventDefault();
			if (elem.value=="FOLLOW"){
		    	elem.value = "FOLLOWING";
		    }
		    else {
		    	elem.value = "FOLLOW";
		    	elem.setAttribute("id" , "follow_profile");
		    	console.log(elem.id);
		    }
		},
		error: function(jqXHR, status, err){
			alert("로그인 해주세요");
			location.href='login.ya';
		}
	})
})
</script>

<script>
	/* var elem = document.getElementById("follow_profile");
    console.log(elem.id);
	function change()
	{
	    
	    if (elem.value=="FOLLOWING"){
	    	elem.value = "FOLLOW";
	    	
	    }
	    else {
	    	elem.value = "FOLLOWING";
	    	elem.setAttribute("id" , "unfollow_profile");
	    	console.log(elem.id)
	    }
	    	
	} */
	</script>

<script>

$("#submit_modal").click(function(){
	var formData = new FormData();
	var idx = document.getElementById("idx");
	var temp = $("#image")[0].files[0];
	console.log(temp);
	
	console.log(idx.value);
	
	formData.append('MEM_IDX', idx.value);
	
	for(var i = 0; i<$('#image')[0].files.length; i++){
		formData.append('uploadFile', $('#image')[0].files[i]);
	}
	
	for (var key of formData.keys()){
		console.log(key);
	}
	
	$.ajax({
		type : "POST",
		url: "/roomie/uploadImage.ya",
		processData: false,
		contentType: false,
		data : formData,
		success : function(data){
		},
		error : function(xhr, status, error){
		}
	});
})
	
</script>

	<!-- 모달 코드 -->
	<script>
    // 모달 띄우기 코드
    const modal = document.getElementById("modal_edit_profile");
    const buttonAddFeed = document.getElementById("edit_profile");
    buttonAddFeed.addEventListener("click", e => {
        modal.style.top = window.pageYOffset + 'px'; // top을 이용해 시작 y위치를 바꿔줌 
        modal.style.display = "flex";
        document.body.style.overflowY = "hidden"; // 스크롤 없애기
    });
    
    </script>
    
    <script>

    // 모달 닫기 코드
    const buttonCloseModal = document.getElementById("close_modal");
    buttonCloseModal.addEventListener("click", e => {
        modal.style.display = "none";
        document.body.style.overflowY = "visible";
    });

    // 모달 확인 코드
    const submitModal = document.getElementById("submit_modal");
    submitModal.addEventListener("click", function(){
        modal.style.display = "none";
        document.body.style.overflowY = "visible";
    });

    const modal2 = document.getElementById("modal_followers");
    const buttonAddFeed2 = document.getElementById("followers");
    buttonAddFeed2.addEventListener("click", function() {
        modal2.style.top = window.pageYOffset + 'px';
        modal2.style.display = "flex";
        document.body.style.overflowY = "hidden";

    });
    const buttonCloseModal2 = document.getElementById("close_modal2");
    buttonCloseModal2.addEventListener("click", function() {
        modal2.style.display = "none";
        document.body.style.overflowY = "visible";
    });

    const submitModal2 = document.getElementById("submit_modal2");
    submitModal2.addEventListener("click", function(){
        modal2.style.display = "none";
        document.body.style.overflowY = "visible";
    });

    const modal3 = document.getElementById("modal_following");
    const buttonAddFeed3 = document.getElementById("following");
    buttonAddFeed3.addEventListener("click", function() {
        modal3.style.top = window.pageYOffset + 'px';
        modal3.style.display = "flex";
        document.body.style.overflowY = "hidden";

    });
    const buttonCloseModal3 = document.getElementById("close_modal3");
    buttonCloseModal3.addEventListener("click", function() {
        modal3.style.display = "none";
        document.body.style.overflowY = "visible";
    });

    const submitModal3 = document.getElementById("submit_modal3");
    submitModal3.addEventListener("click", function(){
        modal3.style.display = "none";
        document.body.style.overflowY = "visible";
    });
    
    const modal4 = document.getElementById("modal_music");
    const buttonAddFeed4 = document.getElementById("music");
    buttonAddFeed4.addEventListener("click", function() {
        modal4.style.top = window.pageYOffset + 'px';
        modal4.style.display = "flex";
        document.body.style.overflowY = "hidden";

    });
    const buttonCloseModal4 = document.getElementById("close_modal4");
    buttonCloseModal4.addEventListener("click", function() {
        modal4.style.display = "none";
        document.body.style.overflowY = "visible";
    });
    
  
    


</script>

	<!-- 모바일 사이징 부분 -->
	<script>

const resizeOps = () => {
    document.documentElement.style.setProperty("--vh", window.innerHeight * 0.01 + "px");
  };

  resizeOps();
  window.addEventListener("resize", resizeOps);

</script>

	<!-- 프로필 수정 코드 -->
	<script>
function mcheck() {
	alert("정보가 수정되었습니다.");
	modifier.submit();
	return;
}


</script>

<script>

$('input[type="file"]').on('change', function(e){
    var fileName = e.target.files[0].name;
    if (fileName) {
      $(e.target).parent().attr('data-message', fileName);
      setImageFromFile(this, '#preview');
    }
  });
  
  $(document).on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
    if ($('input[type="file"]').length) {
      if (['dragover', 'dragenter'].indexOf(e.type) > -1) {
        if (window.dragTimeout)
          clearTimeout(window.dragTimeout);
        $('body').addClass('dragged');
      } else if (['dragleave', 'drop'].indexOf(e.type) > -1) {
        // Without the timeout, some dragleave events are triggered
        // when the :after appears, making it blink...
        window.dragTimeout = setTimeout(function() {
          $('body').removeClass('dragged');
        }, 100);
      }
    }
  });
function setImageFromFile(input, expression) {
	if (input.files && input.files[0]) {
	  var reader = new FileReader();
	  reader.onload = function (e) {
	  $(expression).attr('src', e.target.result);
	  }
	  reader.readAsDataURL(input.files[0]);
	}
}


</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script>

	  // check to make sure JS is loaded
	  console.log('JS is loaded!');

	  // your code here
	  const client_id = '51f7b5ab05bf459e88b90c02e8f14f4a';
	  const client_secret = '499305d4bc4c4fe2840bd99f41f71ab8';
		  
	  $('#search_spotify').on('submit', function(event) {
	  	event.preventDefault();

	  	$('#results_spotify').empty();
	  	var encoded = btoa(client_id+':'+client_secret);
	  	var searchedTrack = $('#track').val();
	  	var trackurl = 'https://api.spotify.com/v1/search?q=' + searchedTrack + '&type=track';
		

			$.ajax({
		    url: trackurl,
		    type: 'GET',
		    dataType: 'json',
		    crossDomain: true,
		    headers: {
		        "Authorization": `Bearer BQDlcpha3zXRIRNJUwF2R3cQ1NkFama2PR2oDwbanq4XK3VT7ojXcjLI78BRC2wZURXSzAooqxgUI3Iijl0BO_Tv4n4dpSmURBGK_Xz-Ck8ryXpQ09NmT50tTbvnjKl5HSx9EYos7byKoRUBqXuMeHLJMXs_U-28YiH4rAB2LMJn1gF1wNKR0Xja3zeLxfl2FSwK`
		      },

		    success: function(data)
		    {
					console.log(data.tracks.items);
					var trackResults = data.tracks.items;

					trackResults.forEach(function callback(track) {
						var $row = $('<div class="row"></div>');
						var $col3 = $('<div class="contents"><div class="col-md-6"></div>');
						var $col9 = $('<div class="col-md-6"></div></div>');
						var $track = $('<a target="_blank" href="' + track.preview_url + '""></a>');

						if(track.preview_url) {
							$col3.append($track);
							// console.log(track.preview_url);
						}
						if(track.album.images) {
							$track.append('<img src=' + track.album.images[2].url + '>');
						}
						$col9.append('<p class="artist">' + track.artists[0].name + '</p>');
						$col9.append('<input id="track_id" name="MEM_MUSIC" type="hidden" value="'+track.name+'">');
						$col9.append('<p id="track_select">' + track.name + '</p><br>');
						$row.append($col3);
						$row.append($col9);
						$('#results_spotify').append($row);
						console.log(track);
						console.log(track.id);
						
						
						// console.log(track.album.images[0].url);
					});
					var MEM_MUSIC = data.tracks.items[0].id;
					var MEM_IDX = document.getElementById("idx").value;
					
					var preview_url = data.tracks.items[0].preview_url
				
					
					
					var param = {"MEM_MUSIC" : MEM_MUSIC,
							"MEM_IDX" : MEM_IDX}
					
					
					
					$(document).on('click', '#track_select', function(e){
						e.preventDefault();
						   console.log(param);
						$.ajax({
							url: "/roomie/userModifyMusic.ya",
							data: param,
							type: "POST",
							success: function(res){
								modal4.style.display = "none";
							},
							error: function(jqXHR, status, err){
								alert(jqXHR.responseText);
								location.reload();
							}
						})
					})
					
					
		    },
			});
	  });


</script>

		
<!-- 모달 게시글 이미지 업로드 시작 -->
				<div class="modal_overlay" id="modal_add_feed"
					style="position: fixed;">
					<div class="modal_window" id="modal_window"
						style="width: 800px; height: 600px;">
						<div class="modal_title">
							<div class="modal_title_side">
								<!-- 이미지 추가 버튼 -->
								<div style="margin-top: -10px;">
									<img class="uploadpage" id="target_img"
										style="cursor: pointer;" src="resources/image/icon_34.png">
								</div>
							</div>
							<input type="file" class="real_upload" id="file"
								name="uploadFile" style="display: none;" multiple>
							<!-- 모달 타이틀 -->
							<div style="font-size: 16px;">새 게시물</div>
							<div class="modal_title_side">
								<!-- 다음 페이지(글작성) 버튼 -->
								<div style="margin-top: -8px; margin-right: 15px;">
									<img style="cursor: pointer;" onclick="modal_add_feed_Next();"
										src="resources/image/icon_38.png">
								</div>
								<!-- 모달 닫기 버튼 -->
								<div style="margin-top: -8px;">
									<img id="close_modal_add_feed" style="cursor: pointer;"
										src="resources/image/icon_40.png">
								</div>
							</div>
						</div>
						<div class="modal_image_upload" style="position: fixed;">
							<!-- 업로드 공간 -->
							<div class="upload">
								<ul class="upload_list">

								</ul>
							</div>
						</div>
						<div class="image_upload"
							style="width: 800px; margin-top: 150px; display: inline-block; text-align: center;">
							<div>
								<img style="width: 150px; height: 150px;"
									src="resources/image/icon_31.png">
							</div>
							<div style="margin-top: 30px; font-size: 20px;">
								<a>사진과 동영상을 여기에 끌어다 놓으세요</a>
							</div>
							<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;">
								<a>최대 업로드 파일 크기 : 10MB</a>
							</div>
						</div>
						<!-- 이미지 왼쪽 버튼 -->
						<img class="upload_prev" id="upload_prev"
							style="cursor: pointer; left: 0px; top: -136px; position: relative; z-index: 1;"
							src="resources/image/icon_35.png">
						<!-- 이미지 오른쪽 버튼 -->
						<img class="upload_next" id="upload_next"
							style="cursor: pointer; left: 726px; top: -136px; position: relative; z-index: 1;"
							src="resources/image/icon_36.png">
					</div>
				</div>
				<!-- 모달 게시글 이미지 업로드 끝 -->
				<!-- 모달 게시글 글쓰기 시작 -->
				<div class="modal modal_overlay" id="modal_add_feed_content"
					style="position: fixed;">
					<div class="modal_window" style="width: 800px; height: 600px;">
						<div class="modal_title">
							<div class="modal_title_side">
								<!-- 이전 버튼 -->
								<div style="margin-top: -10px; margin-right: 15px;">
									<img style="cursor: pointer;" onclick="modal_add_feed_Prev();"
										src="resources/image/icon_39.png">
								</div>
							</div>
							<!-- 모달 타이틀 -->
							<div style="font-size: 16px;">새 게시물</div>
							<div class="modal_title_side">
								<!-- 모달 닫기 버튼 -->
								<div style="margin-top: -8px; margin-left: 20px;">
									<img id="close_modal_add_feed_content" style="cursor: pointer;"
										src="resources/image/icon_40.png">
								</div>
							</div>
						</div>
						<div class="modal_image_content" style="height: 100%;">
							<div id="input_image" class="modal_image_upload_content"></div>
							<div class="modal_content_write">
								<div class="feed_name">
									<div class="profile_box">
										<img id="input_profile_image" class="profile_img"
											src="${user.MEM_MEDIA}">
									</div>
									<span class="feed_name_txt"> ${user.MEM_NAME }</span>
								</div>
								<br />
								<div>
									<textarea id="input_hash"
										class="feed_content_textarea form-control col-sm-5"
										style="height: 30px; width: 100%;" rows="1" placeholder="해시태그"></textarea>
								</div>
								<br />
								<div>
									<input type="hidden" id="input_user_id" value="${user.MEM_IDX}" name="BO_MEM">
									<input type="text" id="input_place"
										class="feed_content_textarea form-control col-sm-5"
										style="height: 30px; width: 100% ; min-height: calc(1.5em + 0.75rem + 2px)"
										placeholder="위치 공유" onclick="place_add_bnt();">
								</div>
								<br />
								<div style="height: 100%;">
									<textarea id="input_content"
										class="feed_content_textarea form-control col-sm-5"
										style="height: 100%;" rows="10" placeholder="설명을 입력하세요..."></textarea>
								</div>
								<br /> <br />
								<div style="width: 100%; text-align: center">
									<button class="button" id="boardupload" style="cursor: pointer">글쓰기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모달 게시글 글쓰기 끝 -->
				<!-- 위치 추가 모달 시작 -->

				<div>
					<div class="modal modal_overlay" id="modal_place_add"
						style="position: fixed;">
						<div class="modal_window" style="width: 800px; height: 600px;">
							<div class="modal_title">
								<div class="modal_title_side">
									<!-- 이전 버튼 -->
									<div style="margin-top: -10px; margin-right: 15px;">
										<img style="cursor: pointer;" onclick="modal_place_Prev();"
											src="resources/image/icon_39.png">
									</div>
								</div>
								<!-- 모달 타이틀 -->
								<div style="font-size: 16px;">새 게시물</div>
								<div class="modal_title_side">
									<!-- 모달 닫기 버튼 -->
									<div style="margin-top: -8px; margin-left: 20px;">
										<img id="close_modal_add_feed_content"
											style="cursor: pointer;" src="resources/image/icon_40.png">
									</div>
								</div>
							</div>
							<div class="map_wrap">
								<div id="map"
									style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

								<div id="menu_wrap" class="bg_white">
									<div class="option">
										<div>
											<form onsubmit="searchPlaces(); return false;">
												키워드 : <input type="text" id="keyword" size="15">
												<button type="submit">검색하기</button>
											</form>
										</div>
									</div>
									<hr>
									<ul id="placesList"></ul>
									<div id="pagination"></div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- 위치 추가 모달 끝 -->
				
				
			<!-- 모달 스크립트 -->
		<script>
 
  	const realUpload = document.querySelector('.real_upload');
  	const upload = document.querySelector('.uploadpage');
  	
  	upload.addEventListener('click', () => realUpload.click());

    const modal_add_feed = document.getElementById("modal_add_feed");
    const modal_add_feed_content = document.getElementById("modal_add_feed_content");
    const buttonAddFeed6 = document.getElementById("add_feed");

    // 모달 글쓰기 이미지 업로드 띄우기
    buttonAddFeed6.addEventListener("click", e => {
      modal_add_feed.style.display = "flex";
      document.body.style.overflowY = "hidden";
    });

    // 모달 글쓰기 이미지 업로드 닫기
    const buttonCloseModal_add_feed = document.getElementById("close_modal_add_feed");
    buttonCloseModal_add_feed.addEventListener("click", e => {
      modal_add_feed.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      $('.upload_list').html('');
      $('#input_content').val('');

    });
    // 모달 글쓰기 닫기
    const buttonCloseModal_add_feed_content = document.getElementById("close_modal_add_feed_content");
    buttonCloseModal_add_feed_content.addEventListener("click", e => {
      modal_add_feed_content.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      $('.upload_list').html('');
      $('#input_content').val('');
    });

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
      /* $("#boardupload").on("click", function(e){
     	 
     	 var BO_MEM = $("#input_user_id").text();
     	 var BO_HASH = $("#input_hash").val();
     	 var BO_PLACE = $("#input_place").val();
     	 var BO_CONT = $("#input_content").val();
     	 
     	 console.log(BO_MEM);
     	 console.log(BO_HASH);
     	 console.log(BO_PLACE);
     	 console.log(BO_CONT);
     	 console.log(files.files[0]);
     	 
     	 /* var formData = new FormData(); 
     	 formData.append("uploadFile", files.files[0]);
     	 formData.append("BO_MEM", BO_MEM);
     	 formData.append("BO_HASH", BO_HASH);
     	 formData.append("BO_PLACE", BO_PLACE);
     	 formData.append("BO_CONT", BO_CONT);
     	 
     	 $.ajax({
     		 url: '/roomie/register.ya',
  			processData: false,
  			contentType: false,
  			data: formData,
  			type: 'POST',
  			dataType:'json',
  			success: function(result){
  			}
     		 
     	 });
     	 
     	 
     	 
      }); */
      
      
/*       $("#boardupload").on("click", function(e){

  		
      	$.ajax({
      		url: '/roomie/register.ya',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType:'json',
            success: function(){
              	alert("보내기 성공");
                
            },
            err: function(err){
              console.log("err:", err)
            }
            });
      }); */ 
      
    }
     $(document).ready(function(){
    	 
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
   	 
  	 
   	 var BO_MEM = $("#input_user_id").val();
   	 var BO_HASH = $("#input_hash").val();
   	 var BO_PLACE = $("#input_place").val();
   	 var BO_CONT = $("#input_content").val();
   	 //let files = $("input[name=uploadFile]")[0].files;
   	 //var file = $("#input_fileimage").val();
   	 var file = $("#qwer").val();
   	 alert(BO_MEM);
   	 
   	 
   	 
   	 
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
   	 formData.append("BO_MEDIA", file)
   	 /* Array.from(files).map(e => formData.append("BO_IMAGE", e));
	 formData.append("BO_IMAGE", files); 
   	 for(let i = 0; i< files.length; i++){
   		formData.append("BO_IMAGE", files[i]);
   	 } */
   	 
   	 
   	 $.ajax({
   		 url: '/roomie/boardInsert.ya',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType:'text',
			success: function(status){
				
				alert("성공");
				/* $('#modal_add_feed_content').css({
            		display: 'none'	
            	}); */
				location.reload();
			}
   		 
   	 });
   	 
   	 
   	 
    });
    
  </script>
  
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

















</body>
</html>










