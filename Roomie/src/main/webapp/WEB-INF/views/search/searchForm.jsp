<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="./resources/css/login_style.css">
  <!-- 내비게이션 바 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">      
  <!-- 내비게이션 바 구글 아이콘 이미지 -->
  <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">
         
         
<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">
   

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">  
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
const $j = jQuery.noConflict();
</script>
<script src="./resources/js/jquery-ui.js"></script>

  <!-- 타이틀 -->
  <title>ROOMIE</title>
  
  <style>
    /*

All grid code is placed in a 'supports' rule (feature query) at the bottom of the CSS (Line 310). 
    
The 'supports' rule will only run if your browser supports CSS grid.

Flexbox and floats are used as a fallback so that browsers which don't support grid will still recieve a similar layout.

*/

/* Base Styles */

:root {
font-size: 10px;
}

*,
*::before,
*::after {
box-sizing: border-box;
}

/* body {
font-family: "Open Sans", Arial, sans-serif;
min-height: 100vh;
background-color: #fafafa;
color: #262626;
padding-bottom: 3rem;
} */

.visually-hidden {
position: absolute !important;
height: 1px;
width: 1px;
overflow: hidden;
clip: rect(1px, 1px, 1px, 1px);
}

/* Gallery Section */

.gallery-item-info {
display: none;
}

.gallery-item-info li {
display: inline-block;
font-size: 1.7rem;
font-weight: 600;
}

.gallery-item-likes {
margin-right: 0.2rem;
}

.gallery-item-type {
position: absolute;
top: 1rem;
right: 1rem;
font-size: 2.5rem;
text-shadow: 0.2rem 0.2rem 0.2rem rgba(0, 0, 0, 0.1);
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

.profile-image,
.profile-user-settings,
.profile-bio,
.profile-stats {
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

.profile-edit-btn,
.profile-bio,
.profile-stats {
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

@keyframes loader {
to {
    transform: rotate(360deg);
}
}

/*

The following code will only run if your browser supports CSS grid.

Remove or comment-out the code block below to see how the browser will fall-back to flexbox & floated styling. 

*/

.profile-image {
    grid-row: 1 / -1;
}

.profile-image,
.profile-user-settings,
.profile-stats,
.profile-bio,
.gallery-item,
.gallery {
    width: auto;
    margin: 0;
}

@media (max-width: 40rem) {
    .profile {
        grid-template-columns: auto 1fr;
        grid-row-gap: 1.5rem;
    }

    .profile-image {
        grid-row: 1 / 2;
    }

    .profile-user-settings {
        display: grid;
        grid-template-columns: auto 1fr;
        grid-gap: 1rem;
    }

    .profile-edit-btn,
    .profile-stats,
    .profile-bio {
        grid-column: 1 / -1;
    }

    .profile-user-settings,
    .profile-edit-btn,
    .profile-settings-btn,
    .profile-bio,
    .profile-stats {
        margin: 0;
    }
}

/* 태영 직접 추가 */

	@media (max-width: 1100px){
	
		.search_menu{
			display: none;
		}
		
		.search_icon_alert{
			display: flex !important;
		}
		
		.form-control{
			width: 150px !important;
		}
	
	}

	.search_icon_alert{
		display: none;
	}
	
	.search_menu{
	
	}
	
	/* 태영 gallery */
	
	@media (max-width: 935px){
	
		.search_gallery_item {
			margin-bottom: 2vw !important;
		}
	
	}
	
	.search_container {
		max-width: 93.5rem;
		margin: 0 auto;
		width: auto;
	}
	
	.search_gallery {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	} 

	.search_gallery_item {
		width: 32%;
		margin-bottom: 18px;
		aspect-ratio: 1;
		position: relative;
		cursor: pointer;
	}
	
	.gallery-image {
		width: 100%;
		height: 100%;
	}
	
	.search_gallery_item:hover .gallery-item-info,
	.search_gallery_item:focus .gallery-item-info {
		display: flex;
		justify-content: center;
		align-items: center;
		position: absolute;
		top: 0;
		width: 100%;
		height: 100%;
		aspect-ratio: 1;
		background-color: rgba(0, 0, 0, 0.5);
	}
	
	/* 태영 search result */
	
	.result_menu{
	
	}
	
	.result_tag{
		border: none;
		background-color: transparent;
	}
	
	.result_tag:hover{
		font-weight: 600;
		background-color: #fafafa !important;
		border-bottom: 3px solid gray !important;
	}
	
	.result_tag_clicked{
		font-weight: 600;
		background-color: #fafafa !important;
		border-bottom: 3px solid gray !important;
	}
	
	
	/* 모달 관련 */
	
	.test_modal {

        width: 450px;
		height: 500px;
        background: white;
        backdrop-filter: blur(13.5px);
        -webkit-backdrop-filter: blur(13.5px);
        border-radius: 10px;
        position: relative;
        padding: 10px;
        overflow-x: hidden;
        top: 20px;

		
	}
	
	.test_modal2 {
	
	    width: 450px;
		height: 500px;
        background: white;
        backdrop-filter: blur(13.5px);
        -webkit-backdrop-filter: blur(13.5px);
        border-radius: 10px;
        position: relative;
        padding: 10px;
        overflow-x: hidden;
        top: 20px;

	}
	 
}


.keywords{


width: 450px;
height: 500px;
bottom: 50px;
overflow-x: hidden; 
background-color:yellow;
}

.result:hover {

overflow-x: scroll; 

}

.close1{

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
    position: fixed;
        
}

.close2{

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
    position: fixed;
        
}

p {
  font-size: 13px; /* 글자 크기 조절 */
  
  text-align: center; /* 가운데 정렬 */
  
  margin-top: 50px; /* 위쪽 여백 추가 */
  
 font-weight: bold;
 
 color: #808080;
}


   .modal_overlay{

        width: 100%;
        height: 100%;
        position: absolute;
        left: 0;
        top: 0;
        display: none;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        text-align: center;
        overflow-x: hidden;
        background: rgba(0, 0, 0, 0.8);
        
}



</style>

	</head>
	
<body>
	<!-- 상단 내비게이션 바 시작 -->
	<nav class="" style="width: 100%; display: flex; padding-top: 0.5rem; padding-bottom: 0.5rem; align-items: center; position: fixed; z-index: 1; background-color: #fff;" >
		<div class="search_container" style="display: flex; justify-content: space-between; align-items: center; width: 900px; min-width: 350px;">
			<img class="navbar-brand" style="height: 44px; object-fit: contain;" src="resources/image/roomie_logo_1.png">
			
			<!-- 검색창 -->
			<input class="form-control" id="searchBox" style="width: 200px; height: 30px;"  type="search" placeholder="Search" aria-label="Search">
			
			<div class="search_menu">
				<!-- 홈 버튼 -->
				<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_09.png"> &nbsp;&nbsp;
				<!-- 탑색 탭 버튼 -->
				<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_22.png"> &nbsp;&nbsp;
				<!-- 채팅 버튼 -->
				<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_12.png"> &nbsp;&nbsp;
				<!-- 알림 버튼 -->
				<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_10.png"> &nbsp;&nbsp;	
			</div>
			<div class="search_icon_alert">
				<!-- 알림 버튼 mobile -->
				<img class="menu_img" style="width: 25px; height: 25px; object-fit: contain;" src="resources/image/icon_10.png"> &nbsp;&nbsp;
			</div>
		</div>
	</nav>
	<!-- 상단 내비게이션 바 끝 -->

	<!-- 게시물 리스트 start -->
	<div class="search_container" id="container" style="height: calc(100% - 40px); position: relative; top: 60px;">
		<div class="search_gallery">
		
		 <c:forEach var="board" items="${BOARD}">
		 
		 
		 <div align="center" class="search_gallery_item" tabindex="0" style="width: 286.5px; height: 286.5px;">
				<img src="resources/files/board/${board.BO_MEDIA}" class="gallery-image" alt="" style="width: 286.5px; height: 286.5px; ">
				<div class="gallery-item-info" style="color: #ffffff;">
					<ul>
						<li class="gallery-item-likes">
						<!-- 좋아요 -->
						<c:set var="liked" value="false" />

                         <c:forEach var="like" items="${LIKEC}">
                         <c:if test="${board.BO_IDX == like.LIKEB_BOARD}">
                         <c:set var="liked" value="true" />
                         </c:if>
                         </c:forEach>
						
				<c:if test="${board.COUNT != null}">
                <li class="gallery-item-likes"><img src="resources/image/w_heart.png" style="height: 27px; width: 27px;">
                ${board.COUNT}</li>
                </c:if>

                <c:if test="${board.COUNT == null}">

                </c:if>
                
          
						<li class="gallery-item-comments"><img src="resources/image/w_comment.png" style="height: 27px; width: 27px;"> 5</li>
					</ul>
				</div>
			</div>
		 
		</c:forEach> 


		</div>
	</div>
	
	
	<!-- 모달 start -->
	<!-- 모달창 꼬리표 -->
	<div id="close1" class="close1">
	<div class="test_modal" id="modal1" style="padding: 0px;">
		<div style="position: relative; height: 20px; width: 20px; background-color: #fff; transform: rotate(45deg); top: -20px; z-index: 0; margin: auto;"></div>
		<div id="searchlist">
		
		<c:forEach var="keyword" items="${keyword}">
		<input type="hidden" id="searchList" value="${keyword}">
		</c:forEach>
		
		<c:choose>
		<c:when test="${not empty keyword}">
		<div id="list1" style="text-align: left; font-weight: bold; font-size: 20px; ">&nbsp;&nbsp;검색목록</div>
		</br>
		
		<c:forEach var="searchL" items="${keyword}" varStatus="status">
		
		<c:choose>
		<%-- <c:set var = "str" value = "${searchL.SEARCH_KEYWORD}"/> --%>
		<c:when test="${fn:contains(searchL, '#')}" >
		
		<div id="result${status.index}" class="searchResult">
		<div  class="hash_result" id="result${status.index}" name="result" style=" height: 60px; position: relative;  value="${searchL}">
		<img src="resources/image/hash.png" style="height: 50px;  border-radius: 50%; position: absolute; top: 15%; width: 40px; left:4%">
		<div style='float: right; left: 13%; top: 18%; position: absolute;'>
		<input type='hidden' id='hash_tag' value='${searchL}'>
		<div style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px; font-weight: bold; text-align: left; padding: 0 0 0 10px; '>${searchL} </div>
		<div style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px;  text-align: left; padding: 0 0 0 10px;'>게시물 수</div>
		<div><img src="resources/image/x.png"  id="x" style="height: 10px;  border-radius: 50%; position: absolute; top: 40%; width: 10px; right:4%"></div>
		</div></div>
		</div>
		
		</c:when>
		
		<c:otherwise>
		
		<div id="result${status.index}" class="searchResult">
		<div class="mem_result" name="result" style=" height: 60px; position: relative; value="${searchL}">
   		<img src="resources/image/icon_p.jpg" style="height: 40px; border-radius: 50%; position: absolute; top: 15%; width: 40px; left:4%">
   		<div style='float: right; left: 13%; top: 10%; position: absolute;'>
   		<input type='hidden' id='hash_tag' value='${searchL}'>
   		<div id = 'test' style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px; font-weight: bold; text-align: left; padding: 0 0 0 10px; '>${searchL}</div>
   		<div style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px;  text-align: left; padding: 0 0 0 10px;  color: #8e8e8e;'>게시물 수</div>
   		<img src="resources/image/x.png" id="x" style="height: 10px;  border-radius: 50%; position: absolute; top: 40%; width: 10px; right:4%">
   		</div></div>
		</div>
		
		</c:otherwise>
		</c:choose>
		

		
		<input type="hidden" id="searchList" value="${searchL}"/>
		</c:forEach> 

		
		
		<div id="searchdiv"> </div>
		</c:when>
		
		<c:otherwise>
		<div id="list2" style="text-align: left; font-weight: bold; font-size: 20px; ">&nbsp;&nbsp;검색목록</div>
		<p>최근검색어가 없습니다</p>
		
		</c:otherwise>
		</c:choose>
		
			
			
		</div>
	</div>
	</div>
	
	<div id="close2" class="close2">
	<div class="test_modal2" id="modal2">
		<!-- 모달창 꼬리표 -->
		<div style="position: relative; height: 20px; width: 20px; background-color: #fff; transform: rotate(45deg); top: -20px; z-index: 0; margin: auto;"></div>
		<!-- 검색 분류태그 start -->
		<div class="result_menu" style="display: flex; flex-direction: row; position:fixed; width: 95%; height: 50px; border-bottom: 1px solid #DBDBDB; top:0; z-index: 1; background-color: #fff; justify-content: center; align-items: center;">
			<button class="result_tag" name="result_tag" id="tag_id" style="display: flex; height: 100%; width: 100px; align-items: center; justify-content: center; font-size: 15px; cursor: pointer;">
				계정
			</button>
			<button class="result_tag" name="result_tag" id="tag_tag" style="display: flex; height: 100%; width: 100px; align-items: center; justify-content: center; font-size: 15px; cursor: pointer;">
				태그
			</button>
			<button class="result_tag" name="result_tag" id="tag_place" style="display: flex; height: 100%; width: 100px; align-items: center; justify-content: center; font-size: 15px; cursor: pointer;">
				장소
			</button>
		</div>

		<div class="keywords" id="keywords" style="width: 450px; top: 55px; position: absolute;">
		<!-- 검색 결과 start-->
		<c:forEach var="hash" items="${hash}">
		<input type="hidden" id="keyword" value="${hash.HASH_KEYWORD}"/>
		</c:forEach>
		
		<c:forEach var="mem" items="${mem}">
		<input type="hidden" id="member" value="${mem.MEM_NAME}"/>
		</c:forEach>
		</div>

		
	
	</div>
	</div>
	<!-- 모달 end -->


		 <!-- 모달 시작 -->
        <c:forEach var="board" items="${BOARD}">
		<div id="modal_post" class="modal_overlay" style="z-index:1050; height: -webkit-fill-available; position: fixed;">
			<div style="width: 800px; height: 480px; overflow: hidden; ">

			<div class="contents">
			<div  class="row">
			<div class="col-md-8" style="width: 410px; height: 300px; padding: 0px">
			<div class="border feed_box" style="width: 410px; height: 480px; margin:0px;">
        
        <img src="resources/files/board/${board.BO_MEDIA}" style="width: 410px; height: 480px; margin:0px;">
  		
       
        
      </div>
	</div>
	
	<div class="col-md-4" style="background-color:white; width: 380px; height: 480px; padding: 0px; margin: 0px;">
	
	<div class="feed_name" style="height: 60px; display:table; margin: 0; position: relative; left: 15px;">
      <div class="profile_box" style="width: 40px; height: 60px; display:table-cell; vertical-align:middle;">
        <!-- 프로필 MEM_MEDIA -->
        <img class="profile_img" src="resources/files/profile/${board.MEM_MEDIA}" 
        style="border-radius: 70%; width: 40px; height: 40px; ">
      </div>
      
      <span class="feed_name_txt" 
	      style="font-weight: bold; width: 20%; display:table-cell; vertical-align:middle; font-size: 15px;"> 
	      &nbsp;&nbsp;${board.MEM_NAME} </span>
	  <span class="_ac6e _ac6f _ac6h" style="display:table-cell; width: 25px; vertical-align:middle; font-size: 15px;">•</span>
      <span class="feed_name_txt" style="font-weight: bold; display:table-cell; vertical-align:middle; width: 35px; font-size: 13px;">팔로우</span>
      
   	  <div class="feed_icon" style="position: relative; top: 8px; left: 60px;">
          <!-- 좋아요 버튼 -->
          <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_01.png">
          <!-- 댓글 버튼 -->
          <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_03.png">
          <!-- 공유 버튼 -->
          <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_04.png">
          <!-- 게시글 저장 버튼 -->
          <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="./resources/image/icon_05.png">
      	  <!-- ... 버튼 -->    
          <img class="etc_img" src="resources/image/icon_28.png" >
          <!-- 모달 닫기 버튼 -->
          <span style="position: relative; top: 10px;" id="close1" class="material-icons-outlined" onclick="closes()"> close </span>
      </div>
    </div>
        <hr style="margin: 0px">
        <div class="feed_like">
          <!-- 좋아요 표시 -->
          <br>
          <p class="feed_txt"> <b>${status.index}</b></p>
        </div>
        <div class="feed_content">
          <!-- 이름, 게시글 내용 -->
          <p class="feed_txt" style="text-align: left; margin: 25px;">${board.BO_CONT}</p>
          <!-- 해쉬 -->
          <p class="feed_txt" style="text-align: left; margin: 25px;">${board.BO_HASH}</p>
        </div>
        <!-- 댓글 목록 -->
        <div style="padding-left:10px;">
        <input type="hidden" name="COM_WRITER" id="comment_writer" value="">
      <div class="login-wrapper flex-center">
      </div>
        <input type="hidden" value="" name="BO_IDX" id="comment_artno">
        <input class="login-input" style="width: 300px;" type="text" id="COM_CONT" name="COM_CONT" placeholder="댓글 입력"/>
         <button class="login-button" type="submit" id="comment_submit" style="width: 50px; cursor:pointer">확인</button>
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
	</c:forEach>

<!-- 모달 끝 -->



<script>


var image = document.querySelectorAll(".search_gallery_item");
var modal = document.querySelectorAll(".modal_overlay");

for(let q=0; q < image.length; q++){
	
	image[q].addEventListener('click', function() {
		
		console.log(image.length);
		console.log(q);
		modal[q].style.display = "flex";
		
	});
	
}


</script>


<script>

$j(document).ready(function(){
	
     var modal = document.getElementById("close");
     
    var md = document.getElementById("modal1");
	
	var search = document.getElementById("searchBox");
	
	
	//호버
	$j("div[name=result]").hover(function(){
		  $j(this).css("background-color","#f5f5f5");
		
	       }, function(){
		  
		  $j(this).css("background-color","#ffffff");
		  });
	
	
	  
	 //1.버튼 클릭 시 다른 버튼 비활성
	//ClassName이 result_tag인 모든 객체를 가져온다.(태그 메튜 버튼)
 $j('.result_tag').each(function(index){
		//개발자도구(F12)로 확인해보면 menu-index가 부여되어있는것을 확인할 수 있다.
		$j(this).attr('menu-index', index);
	}).click(function(){
		//클릭한 버튼의 menu-index값을 index 변수에 할당한다.
		var index = $j(this).attr('menu-index');
		//클릭한 버튼에 result_tag_clicked 클래스 추가.
		$j('.result_tag[menu-index=' + index + ']').addClass('result_tag_clicked');
		//나머지 버튼에는 result_tag_clicked 클래스 삭제.
		$j('.result_tag[menu-index!=' + index + ']').removeClass('result_tag_clicked');
		
	});
	 
 
	 
	 
	 //최근검색목록 삭제
	    var x = document.querySelectorAll("#x");
	  	var data = document.querySelectorAll("#hash_tag");
	  	let result = document.querySelectorAll('.searchResult');
	  	 
	
	  	 
	  	 for(let y=0; y < x.length ; y++){
	  		 
	  		 x[y].addEventListener('click', function(){
	  			 
	  			 var val = data[y].value;
	  			 
	  			$j.ajax({
		 	        url : "/roomie/searchDelete.ya" 
		 	        ,data : { keyword: val }
		 	        ,success: function(slist){	
		 	        	
		 	        	
		 	        	result[y].remove();
		 	        	
		 	        // 검색결과 개수 확인 후 "최근검색어가 없습니다" 문구 출력
		                let searchCount = document.querySelectorAll('.searchResult').length;
		                if (searchCount === 0) {
		                   
	
		                    $j('#searchlist').remove();
		                    $j('#list1').remove();
		              
		                    // div 엘리먼트 생성
		                	const divElement = document.createElement('div');

		                    // id 속성 추가
		                    divElement.setAttribute('id', 'list2');
		                 
		                	// 스타일 속성 추가
		                	divElement.style.textAlign = 'left';
		                	divElement.style.fontWeight = 'bold';
		                	divElement.style.fontSize = '20px';

		                	// p 요소 생성
		                	const pElement = document.createElement('p');
		                	pElement.textContent = '최근검색어가 없습니다';

		                	// 내용 추가
		                	divElement.innerHTML = '&nbsp;&nbsp;검색목록';
		                	divElement.appendChild(pElement);

		                	// body 요소에 추가
		                	document.querySelector("#modal1").appendChild(divElement); 

		                    
		                    
		                }
		 	       
		 	        },error : function(request,error,data){
		 	        	alert("실패");
		 	            console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
		 	        }
		 	    });//ajax
	  			 
	  		 }); //click
	  		 
	  	 } //for
	  	 
	

	
	
    //hash 배열 선언
	var inputSource = document.querySelectorAll("#keyword");
	var arr = new Array;

    for(var i=0; i < inputSource.length; i++){
    	arr.push(inputSource[i].value);
    }

    //member 배열 선언
    var member = document.querySelectorAll("#member");
	var mem = new Array;

    for(var i=0; i < member.length; i++){
    	arr.push(member[i].value);
    }

    
    
    var keyword = document.getElementById("keywords");
    var mr = document.getElementById("tag_id");
    var hr = document.getElementById("tag_tag"); 
    
    
    
 search.addEventListener('keyup', function(e) {
    	
    	$j("#close1").css('display', 'none');
    	$j("#close2").css('display', 'flex');
    	
    	  var value = e.target.value;
    	  var hashList = arr.filter(function(item) {
    	    return item.indexOf(value) > -1;
    	  }); 
    	  
    	var list = $j("#keywords");
    	var html = '';
    	
    	
    	
    	hashList.forEach(function(item) {
    		 
    		if(item.charAt(0) == "#" || item.charAt(0) === "#" ){

    			
    		  html += '<div  class="hash_result" name="result" style=" height: 60px; position: relative;  value="' + item + '">' +
    		  '<img src="resources/image/hash.png" style="height: 50px;  border-radius: 50%; position: absolute; top: 15%; width: 40px; left:4%">' + " " +
    		  "<div style='float: right; left: 13%; top: 18%; position: absolute;'>" +
    		  "<input type='hidden' id='hash_tag' value='" + item + "'>" +
    		  "<div style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px; font-weight: bold; text-align: left; padding: 0 0 0 10px; '>" + item + '</div>' + "\n" +
    		  "<div style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px;  text-align: left; padding: 0 0 0 10px;'>" + "게시물 수" + '</div>' +
    		  '</div>' + '</div>';
	 
    		  $j('#tag_tag').click();
    		  
    		} else if (item.charAt(0) != "#" && item.length > 1){

    			
    			html += '<div class="mem_result" name="result" style=" height: 60px; position: relative; value="' + item + '">' +
    		  '<img src="resources/image/icon_p.jpg" style="height: 40px; border-radius: 50%; position: absolute; top: 15%; width: 40px; left:4%">' + " " +
    		  "<div style='float: right; left: 13%; top: 10%; position: absolute;'>" +
    		  "<input type='hidden' id='hash_tag' value='" + item + "'>" +
    		  "<div id = 'test' style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px; font-weight: bold; text-align: left; padding: 0 0 0 10px; '>" + item + '</div>' + "\n" +
    		  "<div style='height: 20px; width: 400px; vertical-align: middle; font-size: 14px;  text-align: left; padding: 0 0 0 10px;  color: #8e8e8e;'>" + "게시물 수" + '</div>' + '</div>' + '</div>';
    		  
    			$j('#tag_id').click();
    			
    		} 
    	  
    	  });
    	

    	  keyword.innerHTML = html;
    	  
    	   console.log(search.value);
    	  
    	  if(search.value.charAt(0) != "#") {
    		  $j('#tag_id').click();
    		  $j('.mem_result').css('display', 'block');
    		  $j('.hash_result').css('display', 'none');
    		  
    	  } else {
    		  $j('#tag_tag').click();
    		  $j('.mem_result').css('display', 'none');
    		  $j('.hash_result').css('display', 'block');
    		  
    	  }
    	  
    	  
    	  //document.body.appendChild(html);
    	   $j("div[name=result]").hover(function(){
		  $j(this).css("background-color","#f5f5f5");
		
	       }, function(){
		  
		  $j(this).css("background-color","#ffffff");
		  });

    });
    
    
	
	
	//3.검색창 클릭했을 때 모달창 띄우기.
   <!---->
	$j("#searchBox").on("focus",
			function(){
		
				$j("#close1").css('display', 'flex');

			});
	
	
	

		
}); 

</script>	

<script>
	function closes() {
	  //모달창 꺼지기
      $j(".modal_overlay").css({display:"none"});
	}
</script>

<script type="text/javascript">



$j(document).on("click", function(e){
	 if($j("#close1").is(e.target)){
	 $j("#close1").css({display:"none"});
	 }
	 
	 if($j("#close2").is(e.target)){
		 $j("#close2").css({display:"none"});
		 }
	 });


</script>
	
	
	<script>
	
	var tag_mem = document.getElementById("tag_id");
	var tag_hash = document.getElementById("tag_tag");
    var tag_place = document.getElementById("tag_place");
	
    
    
    
    tag_mem.addEventListener('click', function() {
		  
    	//alert("tlfgoddhgks");
	
	$j('.mem_result').css('display', 'block');
    $j('.hash_result').css('display', 'none');
    
    
    // 클래스 이름이 'a'인 div들을 선택합니다.
    const divs = document.querySelectorAll('.mem_result');

    // 각 div를 클릭했을 때 처리할 함수입니다.
    function handleClick(event) {
      // 이벤트가 발생한 div 안에 있는 input을 선택합니다.
      const input = event.currentTarget.querySelector('input');
      // input의 값(value)을 가져와서 출력합니다.
      console.log(input.value);
      
      var data = input.value;
      
      
      $j.ajax({
	        url : "/roomie/searchResult.ya" 
	        ,data : { keyword: data }
	        ,success: function(data){	        	
	        		alert("보내기 성공");
	
	        },error : function(request,error,data){
	        	alert("실패");
	            console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
	        }
	    });//ajax
	    
	    
	    //모달창 꺼지기
      $j("#close1").css({display:"none"});
      $j("#close2").css({display:"none"});
   
    }

    // 각 div에 클릭 이벤트를 등록합니다.
    divs.forEach(div => {
      div.addEventListener('click', handleClick);
    });
 


    $j("#searchBox").on("focus",
			function(){
		
				$j("#close1").css('display', 'flex');
  				$j('#searchlist').load(location.href + ' #searchlist', function() {
  				    
	  				//document.body.appendChild(html);
	  		    	   $j("div[name=result]").hover(function(){
	  				  $j(this).css("background-color","#f5f5f5");
	  				
	  			       }, function(){
	  				  
	  				  $j(this).css("background-color","#ffffff");
	  				  });	
	  					
	  		    	   
	  		    	   
	  		    	 //최근검색목록 삭제
	  		 	    var x = document.querySelectorAll("#x");
	  		 	  	var data = document.querySelectorAll("#hash_tag");
	  		 	  	let result = document.querySelectorAll('.searchResult');
	  		 	  	 
	  		 	
	  		 	  	 
	  		 	  	 for(let y=0; y < x.length ; y++){
	  		 	  		 
	  		 	  		 x[y].addEventListener('click', function(){
	  		 	  			 
	  		 	  			 var val = data[y].value;
	  		 	  			 
	  		 	  			$j.ajax({
	  		 		 	        url : "/roomie/searchDelete.ya" 
	  		 		 	        ,data : { keyword: val }
	  		 		 	        ,success: function(slist){	
	  		 		 	        	
	  		 		 	        	
	  		 		 	        	result[y].remove();
	  		 		 	        	
	  		 		 	        // 검색결과 개수 확인 후 "최근검색어가 없습니다" 문구 출력
	  		 		                let searchCount = document.querySelectorAll('.searchResult').length;
	  		 		                if (searchCount === 0) {
	  		 		                   
	  		 	
	  		 		                    $j('#searchlist').remove();
	  		 		                    $j('#list1').remove();
	  		 		              
	  		 		                    // div 엘리먼트 생성
	  		 		                	const divElement = document.createElement('div');

	  		 		                    // id 속성 추가
	  		 		                    divElement.setAttribute('id', 'list2');
	  		 		                 
	  		 		                	// 스타일 속성 추가
	  		 		                	divElement.style.textAlign = 'left';
	  		 		                	divElement.style.fontWeight = 'bold';
	  		 		                	divElement.style.fontSize = '20px';

	  		 		                	// p 요소 생성
	  		 		                	const pElement = document.createElement('p');
	  		 		                	pElement.textContent = '최근검색어가 없습니다';

	  		 		                	// 내용 추가
	  		 		                	divElement.innerHTML = '&nbsp;&nbsp;검색목록';
	  		 		                	divElement.appendChild(pElement);

	  		 		                	// body 요소에 추가
	  		 		                	document.querySelector("#modal1").appendChild(divElement); 

	  		 		                    
	  		 		                    
	  		 		                }
	  		 		 	       
	  		 		 	        },error : function(request,error,data){
	  		 		 	        	alert("실패");
	  		 		 	            console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
	  		 		 	        }
	  		 		 	    });//ajax
	  		 	  			 
	  		 	  		 }); //click
	  		 	  		 
	  		 	  	 } //for 
	  					
	  					
	  				  });
  				
				
			});


    
    });
    
    tag_hash.addEventListener('click', function() {
		  
    	
    	$j('.mem_result').css('display', 'none');
	    $j('.hash_result').css('display', 'block');
	      

	 // 클래스 이름이 'a'인 div들을 선택합니다.
	    const divs = document.querySelectorAll('.hash_result');

	    // 각 div를 클릭했을 때 처리할 함수입니다.
	    function handleClick(event) {
	      // 이벤트가 발생한 div 안에 있는 input을 선택합니다.
	      const input = event.currentTarget.querySelector('input');
	      // input의 값(value)을 가져와서 출력합니다.
	      console.log(input.value);
	      
	      var data = input.value;
	      
	      
	      $j.ajax({
		        url : "/roomie/searchResult.ya" 
		        ,data : { keyword: data }
		        ,success: function(data){	        	
		        		alert("보내기 성공");
		
		        },error : function(request,error,data){
		        	alert("실패");
		            console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
		        }
		    });//ajax
		    
		    
		    //모달창 꺼지기
	      $j("#close1").css({display:"none"});
	      $j("#close2").css({display:"none"});
 
	      
	    }

	    // 각 div에 클릭 이벤트를 등록합니다.
	    divs.forEach(div => {
	      div.addEventListener('click', handleClick);
	    });
	    
	    
	    
	      $j("#searchBox").on("focus",
		  			function(){
		  		
		  				$j("#close1").css('display', 'flex');
		  				$j('#searchlist').load(location.href + ' #searchlist', function() {
		  				    
		  				//document.body.appendChild(html);
		  		    	   $j("div[name=result]").hover(function(){
		  				  $j(this).css("background-color","#f5f5f5");
		  				
		  			       }, function(){
		  				  
		  				  $j(this).css("background-color","#ffffff");
		  				  });	
		  					
		  		    	   
		  		    	   
		  		    	 //최근검색목록 삭제
		  		 	    var x = document.querySelectorAll("#x");
		  		 	  	var data = document.querySelectorAll("#hash_tag");
		  		 	  	let result = document.querySelectorAll('.searchResult');
		  		 	  	 
		  		 	
		  		 	  	 
		  		 	  	 for(let y=0; y < x.length ; y++){
		  		 	  		 
		  		 	  		 x[y].addEventListener('click', function(){
		  		 	  			 
		  		 	  			 var val = data[y].value;
		  		 	  			 
		  		 	  			$j.ajax({
		  		 		 	        url : "/roomie/searchDelete.ya" 
		  		 		 	        ,data : { keyword: val }
		  		 		 	        ,success: function(slist){	
		  		 		 	        	
		  		 		 	        	
		  		 		 	        	result[y].remove();
		  		 		 	        	
		  		 		 	        // 검색결과 개수 확인 후 "최근검색어가 없습니다" 문구 출력
		  		 		                let searchCount = document.querySelectorAll('.searchResult').length;
		  		 		                if (searchCount === 0) {
		  		 		                   
		  		 	
		  		 		                    $j('#searchlist').remove();
		  		 		                    $j('#list1').remove();
		  		 		              
		  		 		                    // div 엘리먼트 생성
		  		 		                	const divElement = document.createElement('div');

		  		 		                    // id 속성 추가
		  		 		                    divElement.setAttribute('id', 'list2');
		  		 		                 
		  		 		                	// 스타일 속성 추가
		  		 		                	divElement.style.textAlign = 'left';
		  		 		                	divElement.style.fontWeight = 'bold';
		  		 		                	divElement.style.fontSize = '20px';

		  		 		                	// p 요소 생성
		  		 		                	const pElement = document.createElement('p');
		  		 		                	pElement.textContent = '최근검색어가 없습니다';

		  		 		                	// 내용 추가
		  		 		                	divElement.innerHTML = '&nbsp;&nbsp;검색목록';
		  		 		                	divElement.appendChild(pElement);

		  		 		                	// body 요소에 추가
		  		 		                	document.querySelector("#modal1").appendChild(divElement); 

		  		 		                    
		  		 		                    
		  		 		                }
		  		 		 	       
		  		 		 	        },error : function(request,error,data){
		  		 		 	        	alert("실패");
		  		 		 	            console.log("data:"+data+"\n"+"code:" + request.status+"\n" + "message:"+request.responseText+"\n"+"error:"+error);
		  		 		 	        }
		  		 		 	    });//ajax
		  		 	  			 
		  		 	  		 }); //click
		  		 	  		 
		  		 	  	 } //for 
		  					
		  					
		  				  });
		  				
		  				

		  			});
	    
		
	});
    
    tag_place.addEventListener('click', function() {
		  
    	
    	
	});  
    
    
    

    
	</script>
	

	
</body>
</html>
