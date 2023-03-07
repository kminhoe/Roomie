<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<!-- kakao 지도 스타일 시작 -->
<style>
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 500px;
}

#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 250px;
	margin: 10px 0 30px 10px;
	padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 12px;
	border-radius: 10px;
}

.bg_white {
	background: #fff;
}

#menu_wrap hr {
	display: block;
	height: 1px;
	border: 0;
	border-top: 2px solid #5F5F5F;
	margin: 3px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	margin-left: 5px;
}

#placesList {
	flex-direction: column;
}

#placesList li {
	list-style: none;
}

#placesList .item {
	position: static;
	border-bottom: 1px solid #888;
	overflow: hidden;
	cursor: pointer;
	min-height: 65px;
}

#placesList .item span {
	display: block;
	margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

#placesList .item .info {
	padding: 10px 0 10px 55px;
}

#placesList .info .gray {
	color: #8a8a8a;
}

#placesList .info .jibun {
	padding-left: 26px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
		no-repeat;
}

#placesList .info .tel {
	color: #009900;
}

#placesList .item .markerbg {
	float: left;
	position: absolute;
	width: 36px;
	height: 37px;
	margin: 10px 0 0 10px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
		no-repeat;
}

#placesList .item .marker_1 {
	background-position: 0 -10px;
}

#placesList .item .marker_2 {
	background-position: 0 -56px;
}

#placesList .item .marker_3 {
	background-position: 0 -102px
}

#placesList .item .marker_4 {
	background-position: 0 -148px;
}

#placesList .item .marker_5 {
	background-position: 0 -194px;
}

#placesList .item .marker_6 {
	background-position: 0 -240px;
}

#placesList .item .marker_7 {
	background-position: 0 -286px;
}

#placesList .item .marker_8 {
	background-position: 0 -332px;
}

#placesList .item .marker_9 {
	background-position: 0 -378px;
}

#placesList .item .marker_10 {
	background-position: 0 -423px;
}

#placesList .item .marker_11 {
	background-position: 0 -470px;
}

#placesList .item .marker_12 {
	background-position: 0 -516px;
}

#placesList .item .marker_13 {
	background-position: 0 -562px;
}

#placesList .item .marker_14 {
	background-position: 0 -608px;
}

#placesList .item .marker_15 {
	background-position: 0 -654px;
}

#pagination {
	margin: 10px auto;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin-right: 10px;
}

#pagination .on {
	font-weight: bold;
	cursor: default;
	color: #777;
}

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

<!-- style css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/modal_style.css">

<!-- 타이틀 -->
<title>ROOMIE</title>
</head>
<body>
	<!-- 상단 내비게이션 바 시작 -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light"
		style="width: 100%; position: fixed; z-index: 2;">
		<div class="container">
			<img class="navbar-brand" style="height: 44px; object-fit: contain;"
				src="resources/image/Roomie5.png">

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
				<!-- 게시글 업로드 버튼 -->
				<img class="menu_img" id="add_feed"
					style="width: 25px; height: 25px; object-fit: contain"
					src="resources/image/icon_08.png"> &nbsp;&nbsp;
				<!-- 모달 게시글 이미지 업로드 시작 -->

			</div>
		</div>
	</nav>
	<!-- 상단 내비게이션 바 끝 -->

	<!-- 메인 바디 영역 시작 -->
	<div class="main_body" style="padding-top: 100px;">
		<div class="border left_body"
			style="width: 850px; height: 750px; flex-direction: row;">
			<ul style="width: 250px; flex-direction: column;">
				<li style="padding: 16px 16px 16px calc(32px - 2px);">비밀번호 변경</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">차단 계정</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">비공개 설정</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">로그아웃</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">탈퇴</li>
				<div class="optionline"></div>
				<div
					style="padding: 16px 16px 16px calc(32px - 2px); border-top: 1px solid #dee2e6;">
					<img class="navbar-brand"
						style="height: 44px; object-fit: contain;"
						src="resources/image/Roomie5.png"> </br> <span>불편한 사항이
						있으시면 roomie와 대화해보세요</span>
				</div>
			</ul>
			<div style="padding: 16px 42px 16px 16px; border-left: 1px solid #dee2e6; width: 90%;">
				<div>
					<div class="feed_name" style="margin: 5px 0 0 100px;">
						<div class="profile_box">
							<img class="profile_img" src="resources/image/profile_06.jpg">
						</div>
						<span class="feed_name_txt"> daemyeong </span>
					</div>
					<form class="_acyg" name="passwordForm">
						<input type="hidden" name="MEM_IDX" value="1">
						<div class="_ab3p">
							<aside class="_ad6_">
								<label class="_ab3q">이전 비밀번호</label>
							</aside>
							<div class="_ab3t">
								<input type="password" name="originalpass" autocomplete="off">
							</div>
						</div>
						<div class="_ab3p">
							<aside class="_ad6_">
								<label class="_ab3q">새 비밀번호</label>
							</aside>
							<div class="_ab3t">
								<input type="password" name="newpass" autocomplete="off">
							</div>
						</div>
						<div class="_ab3p">
							<aside class="_ad6_">
								<label class="_ab3q">새 비밀번호 확인</label>
							</aside>
							<div class="_ab3t">
								<input type="password" name="newpasscheck" autocomplete="off">
							</div>
						</div>
						<div class="_ab3p" style="justify-content: center;">
							<aside class="_ad6_" style="text-align: left; padding-left: 0px;">
								<label class="_ab3q"><button onclick="passwordChange()">비밀번호 변경</button></label>
							</aside>
						</div>
						<div class="_ab3p" style="justify-content: center;">
							<aside class="_ad6_"
								style="text-align: left; padding-left: 0px; flex: none;">
								<label class="_ab3q"><a href="/roomie/passwordcheck.ya">비밀번호를
										잊으셨나요?</a></label>
							</aside>
						</div>
					</form>
				</div>
			</div>

		</div>
		<!-- 모달 게시글 이미지 업로드 시작 -->
		<div class="modal_overlay" id="modal_add_feed"
			style="position: fixed;">
			<div class="modal_window" id="modal_window"
				style="width: 800px; height: 600px;">
				<div class="modal_title">
					<div class="modal_title_side">
						<!-- 이미지 추가 버튼 -->
						<div style="margin-top: -10px;">
							<img class="uploadpage" id="target_img" style="cursor: pointer;"
								src="resources/image/icon_34.png">
						</div>
					</div>
					<input type="file" class="real_upload" id="file" name="uploadFile"
						style="display: none;" multiple>
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
									src="resources/image/profile_05.jpg">
							</div>
							<span id="input_user_id" class="feed_name_txt"> jshong_</span>
						</div>
						<br />
						<div>
							<textarea id="input_hash"
								class="feed_content_textarea form-control col-sm-5"
								style="height: 30px; width: 100%;" rows="1" placeholder="해시태그"></textarea>
						</div>
						<br />
						<div>
							<input type="text" id="input_place"
								class="feed_content_textarea form-control col-sm-5"
								style="height: 30px; width: 100%; min-height: calc(1.5em + 0.75rem + 2px)"
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
								<img id="close_modal_add_feed_place" style="cursor: pointer;"
									src="resources/image/icon_40.png">
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


	</div>
	<!-- 메인 바디 영역 끝 -->
	<!-- 푸터 시작 -->
	<footer>
		<div>
			<!-- 홈 버튼 -->
			<img style="width: 25px; height: 25px; object-fit: contain"
				src="resources/image/icon_09.png"> &nbsp;&nbsp;
			<!-- 검색 탭 버튼 -->
			<img style="width: 25px; height: 25px; object-fit: contain"
				src="resources/image/icon_07.png"> &nbsp;&nbsp;
			<!-- 탑색 탭 버튼 -->
			<img style="width: 25px; height: 25px; object-fit: contain"
				src="resources/image/icon_22.png"> &nbsp;&nbsp;
			<!-- 채팅 버튼 -->
			<img style="width: 25px; height: 25px; object-fit: contain"
				src="resources/image/icon_04.png"> &nbsp;&nbsp;
			<!-- 알림 버튼 -->
			<img style="width: 25px; height: 25px; object-fit: contain"
				src="resources/image/icon_01.png"> &nbsp;&nbsp;
			<!-- 스토리 버튼 -->
			<img style="width: 25px; height: 25px; object-fit: contain"
				onclick="document.getElementById('add_feed').click();"
				src="resources/image/icon_08.png"> &nbsp;&nbsp;
		</div>
	</footer>

	<!-- jquery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>
	<!-- 모달 스크립트 -->
	<script>
 
  	const realUpload = document.querySelector('.real_upload');
  	const upload = document.querySelector('.uploadpage');
  	
  	upload.addEventListener('click', () => realUpload.click());

    const modal_add_feed = document.getElementById("modal_add_feed");
    const modal_add_feed_content = document.getElementById("modal_add_feed_content");
    const buttonAddFeed = document.getElementById("add_feed");
    const modal_place_add = document.getElementById("modal_place_add");

    // 모달 글쓰기 이미지 업로드 띄우기
    buttonAddFeed.addEventListener("click", e => {
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
    
 	// 모달 위치 닫기
    const buttonCloseModal_add_feed_place = document.getElementById("close_modal_add_feed_place");
    buttonCloseModal_add_feed_place.addEventListener("click", e => {
	  modal_place_add.style.display = "none";
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
   	 
  	 
   	 var BO_MEM = $("#input_user_id").text();
   	 var BO_HASH = $("#input_hash").val();
   	 var BO_PLACE = $("#input_place").val();
   	 var BO_CONT = $("#input_content").val();
   	 //let files = $("input[name=uploadFile]")[0].files;
   	 //var file = $("#input_fileimage").val();
   	 var file = $("#qwer").val();
   	 
   	 
   	 
   	 
   	 
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

	<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
          crossorigin="anonymous">
  </script> -->



	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6e089b04e0ca2a1fd1287cb6610d9d01&libraries=services"></script>
	<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
//searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
    	
    	console.log(data);

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
            kakao.maps.event.addListener(marker, 'click', function(){
            	alert("값전달하자!!"+ title);
            	
            	document.getElementById('input_place').value = title;
            	$('#modal_place_add').css({
            		display : 'none'
            	});
            	map.relayout();
            	$('#modal_add_feed_content').css({
            		display: 'flex'	
            	});
            });
            itemEl.onclick = function () {
            	alert("값전달해볼까?"+ title);
            	document.getElementById('input_place').value = title;
      
            	$('#modal_place_add').css({
            		display : 'none'
            	});
            	map.relayout();
            	$('#modal_add_feed_content').css({
            		display: 'flex'	
            	});
            };
            
        })(marker, places[i].place_name);
        

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info" id="srname"' +(index+1)+'>' +
                '   <h5>' + places.place_name + '</h5>';
                

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';
                
    var resultword = $('#srname'+(index+1)+' h').val();

    el.innerHTML = itemStr;
    el.className = 'item';
    el.onclick = searchresult(resultword)
    
    console.log(resultword);

    return el;
}

function searchresult(rw){
	console.log(rw);
	
	
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
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
  <script>
  	function passwordChange(){
  		var data = $('form[name=passwordForm]').serializeArray();
  		
  		
  		$.ajax({
  			url : "/roomie/checkpass.ya",
  			type : "POST",
  			data : data,
  			dataType : "json",
  			success : function(result){
  				alert("데이터 전송 성공")
  				
  			}
  		})
  	}
  </script>
</body>
</html>