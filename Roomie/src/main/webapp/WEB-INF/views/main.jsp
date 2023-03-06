<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
  <!-- Bootstrap CSS -->
  <!-- 내비게이션 바 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!-- 내비게이션 바 구글 아이콘 이미지 -->
  <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">

  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="./resources/css/main_style.css">
  <link rel="stylesheet" type="text/css" href="./resources/css/modal_style.css">

  <!-- 타이틀 -->
  <title>ROOMIE</title>
</head>
<body>
  <!-- 상단 내비게이션 바 시작 -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%; position: fixed; z-index: 2;" >
    <div class="container">
      <img class="navbar-brand" style="height: 44px; object-fit: contain;" src="./resources/image/Roomie5.png">

      <!-- 검색창 -->
      <!-- <input class="form-control" style="width: 200px" type="search" placeholder="Search" aria-label="Search"> -->

      <div>
        <!-- 홈 버튼 -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_09.png"> &nbsp;&nbsp;
        <!-- 검색 버튼 -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_07.png"> &nbsp;&nbsp;
        <!-- 탑색 탭 버튼 -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_22.png"> &nbsp;&nbsp;
        <!-- 채팅 버튼 -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_04.png"> &nbsp;&nbsp;
        <!-- 알림 버튼 -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_01.png"> &nbsp;&nbsp;
        <!-- 게시글 업로드 버튼 -->
        <img class="menu_img" id="add_feed" style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_08.png"> &nbsp;&nbsp;
        <!-- 모달 게시글 이미지 업로드 시작 -->
        <div class="modal_overlay" id="modal_add_feed" style="position: fixed;">
          <div class="modal_window" id="modal_window" style="width: 800px; height: 600px;">
            <div class="modal_title">
                <div class="modal_title_side">
                  <!-- 이미지 추가 버튼 -->
                  <div style="margin-top: -10px;"><img style="cursor:pointer;" src="./resources/image/icon_34.png"></div>
                  <input id="input_file" name="input_file" type="file" onchange="addFile(this);" multiple />
                </div>
                <!-- 모달 타이틀 -->
                <div style="font-size: 16px;"> 새 게시물 </div>
                <div class="modal_title_side">
                  <!-- 다음 페이지(글작성) 버튼 -->
                  <div style="margin-top: -8px; margin-right: 15px;"><img style="cursor:pointer;" onclick="modal_add_feed_Next();" src="./resources/image/icon_38.png"></div>
                  <!-- 모달 닫기 버튼 -->
                  <div style="margin-top: -8px;"><img id="close_modal_add_feed" style="cursor:pointer;" src="./resources/image/icon_40.png"></div>
                </div>
            </div>
            <div class="modal_image_upload" style="position: fixed;">
              <!-- 업로드 공간 -->
              <div class="upload">
                <ul class="upload_list">
                </ul>
              </div>
            </div>
            <div class="image_upload" style="width: 800px; margin-top: 150px; display: inline-block; text-align: center;">
              <div><img style="width: 150px; height: 150px;" src="./resources/image/icon_31.png"></div>
              <div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>
              <div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>
            </div>
            <!-- 이미지 왼쪽 버튼 -->
            <img class="upload_prev" id="upload_prev" style="cursor:pointer; left:0px; top:-136px; position: relative; z-index: 1;" src="./resources/image/icon_35.png">
            <!-- 이미지 오른쪽 버튼 -->
            <img class="upload_next" id="upload_next" style="cursor:pointer; left:726px; top:-136px; position: relative; z-index: 1;" src="./resources/image/icon_36.png">
          </div>
        </div>
        <!-- 모달 게시글 이미지 업로드 끝 -->
        <!-- 모달 게시글 글쓰기 시작 -->
      <div class="modal modal_overlay" id="modal_add_feed_content" style="position: fixed;">
        <div class="modal_window" style="width: 800px; height: 600px;">
          <div class="modal_title">
              <div class="modal_title_side">
                <!-- 이전 버튼 -->
                <div style="margin-top: -10px; margin-right: 15px;"><img style="cursor:pointer;" onclick="modal_add_feed_Prev();" src="./resources/image/icon_39.png"></div>
              </div>
              <!-- 모달 타이틀 -->
              <div style="font-size: 16px;"> 새 게시물 </div>
              <div class="modal_title_side">
                <!-- 모달 닫기 버튼 -->
                <div style="margin-top: -8px; margin-left: 20px;"><img id="close_modal_add_feed_content" style="cursor:pointer;" src="./resources/image/icon_40.png"></div>
              </div>
          </div>
          <div class="modal_image_content">
              <div id="input_image" class="modal_image_upload_content">

              </div>
              <div class="modal_content_write">
                  <div class="feed_name">
                      <div class="profile_box">
                          <img id="input_profile_image" class="profile_img" src="./resources/image/profile_05.jpg">
                      </div>
                      <span id="input_user_id" class="feed_name_txt"> jshong_ </span>
                  </div>
                  <div style="height: 440px">
                      <textarea id="input_content" class="feed_content_textarea form-control col-sm-5" style="height: 95%;" rows="10" placeholder="설명을 입력하세요..."></textarea>
                  </div>
                  <div style="width: 100%; text-align: center">
                    <button class="button" type="submit" style="cursor:pointer">글쓰기</button>
                  </div>
              </div>
          </div>
        </div>
      </div>
        <!-- 모달 게시글 글쓰기 끝 -->
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
        <div class="story_prev" style="top:50px; cursor:pointer; position: relative; z-index: 1;"><img src="./resources/image/icon_29.png"></div>
        <ul class="story_list">
          <li class="sub_story">
            <div class="text">
              <a onclick="href='#'"><img src="./resources/image/profile_01.jpg" alt="프로필"></a>
              <span style="font-size: 12px; margin-left: 3px;">yeongjun</span>
            </div>
          </li>
          <li>
            <div class="sub_story">
              <div class="text">
                <img src="./resources/image/profile_02.jpg" alt="프로필">
                <span  style="font-size: 12px; margin-left: 3px;">junseok</span>
              </div>
            </div>
          </li>
          <li>
            <div class="sub_story">
              <div class="text">
                <img src="./resources/image/profile_03.jpg" alt="프로필">
                <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
              </div>
            </div>
          </li>
          <li>
            <div class="sub_story">
              <div class="text">
                <img src="./resources/image/profile_04.jpg" alt="프로필">
                <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
              </div>
            </div>
          </li>
          <li>
            <div class="sub_story">
              <div class="text">
                <img src="./resources/image/profile_05.jpg" alt="프로필">
                <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
              </div>
            </div>
          </li>
          <li>
            <div class="sub_story">
              <div class="text">
                <img src="./resources/image/profile_06.jpg" alt="프로필">
                <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
              </div>
            </div>
          </li>
          <li>
            <div class="sub_story">
              <div class="text">
                <img src="./resources/image/profile_06.jpg" alt="프로필">
                <span style="font-size: 12px; margin-left: 3px;">taeyeong</span>
              </div>
            </div>
          </li>
        </ul>
        <!-- 오른쪽 버튼 -->
        <div class="story_next" style="top:-68px; left:436px; cursor:pointer; position: relative; z-index: 1;"><img src="./resources/image/icon_30.png"></div>
      </div>
      <!-- 스토리 끝 -->
      <!-- 게시글 시작 -->
      <c:forEach></c:forEach>
      
      
      <div class="border feed_box">
        <div class="feed_name">
          <div class="profile_box">
            <img class="profile_img" src="./resources/image/profile_06.jpg">
          </div>
          <span class="feed_name_txt"> daemyeong </span>
          <!-- 더보기 버튼 -->
          <img class="more_details" src="./resources/image/icon_28.png" alt="더보기">
        </div>
        <img class="feed_img" src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
  
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
          <p class="feed_txt"> <b>좋아요 10개</b></p>
        </div>
        <div class="feed_content">
          <!-- 이름, 게시글 내용 -->
          <p class="feed_txt"> <b> daemyeong </b> 코로나라서 해외여행을 못가니 최근 제주도 가는사람이 늘고있습니다~ 제주도도 조심해야되는건 마찬가지~!</p>
        </div>
        <!-- 댓글 목록 -->
        <div class="feed_reply">
          <span class="feed_txt"> <b> taeyeong </b> 제주도 가고 싶어요 ㅠㅠ</span>
          <span class="feed_txt"> <b> junseok </b> 제주도  ㄱ ㄱ </span>
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
      <!-- 게시글 끝 -->



    <!-- 왼쪽 바디 영역 끝 -->
    <!-- 오른쪽 바디 영역 시작 -->
    <div class="right_body">
      <!-- 계정 전환 시작 -->
      <div class="feed_name" style="justify-content: space-between">
        <div style="display: flex; align-items: center; ">
          <div class="big_profile_box">
            <!-- 계정 프로필 이미지 -->
            <img class="profile_img" src="./resources/image/profile_06.jpg">
          </div>
          <div class="name_content">
            <!-- 사용자 이름 -->
            <span class="feed_name_txt"> daemyeong </span>
            <!-- 이름 -->
            <span class="name_content_txt"> Yoon Daemyeong </span>
          </div>
        </div>
  
        <!-- 계정 전환 -->
        <a class="link_txt" > 전환 </a>
      </div>
      <!-- 계정 전환 끝 -->
      <!-- 회원님을 위한 추천 -->
      <div class="recommend_box">
        <span style="color: gray"> 회원님을 위한 추천</span>
        <span style="font-size: 12px"> 모두 보기 </span>
      </div>
      <!-- 회원 목록 시작 -->
      <div>
        <!-- 회원 시작 -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <!-- 회원 프로필 이미지 -->
            <img class="profile_img" src="./resources/image/profile_01.jpg">
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
            <img class="profile_img"
                 src="./resources/image/profile_02.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> junseok </span>
            <span class="name_content_txt"> yeongjun 외 5명이 팔로우</span>
          </div>
          <a class="link_txt">
            팔로우
          </a>
        </div>
        <!-- 첫번째 회원 끝 -->
        <!-- 두번째 회원 시작 -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="./resources/image/profile_03.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> taeyeong </span>
            <span class="name_content_txt"> yeongjun 외 5명이 팔로우</span>
          </div>
          <a class="link_txt">
            팔로우
          </a>
        </div>
        <!-- 두번째 회원 끝 -->
        <!-- 세번째 회원 시작 -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="./resources/image/profile_04.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> minhoe </span>
            <span class="name_content_txt"> 회원님을 위한 추천 </span>
          </div>
          <a class="link_txt">
            팔로우
          </a>
        </div>
        <!-- 세번째 회원 끝 -->
        <!-- 네번째 회원 시작 -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="./resources/image/profile_05.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> jeongsu </span>
            <span class="name_content_txt"> 회원님을 위한 추천 </span>
          </div>
          <a class="link_txt">
            팔로우
          </a>
        </div>
        <!-- 네번째 회원 끝 -->
      </div>
      <!-- 회원 추천 목록 끝 -->

      <!-- ROOMIE -->
      <div class="comment_box">
        <span> 소개 · 도움말 · 홍보 센터 · API · 채용 정보 </span>
        <span> 개인정보처리방침 · 약관 · 위치 · 인기 계정 · 해시태그 · 언어 </span>
        <br>
        <span> ⓒ 2023 ROOMIE </span>
      </div>
    </div>
    <!-- 오른쪽 바디 영역 끝 -->
  </div>
  <!-- 메인 바디 영역 끝 -->
  <!-- 푸터 시작 -->
  <footer>
    <div>
      <!-- 홈 버튼 -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_09.png"> &nbsp;&nbsp;
      <!-- 검색 탭 버튼 -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_07.png"> &nbsp;&nbsp;
      <!-- 탑색 탭 버튼 -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_22.png"> &nbsp;&nbsp;
      <!-- 채팅 버튼 -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_04.png"> &nbsp;&nbsp;
      <!-- 알림 버튼 -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="./resources/image/icon_01.png"> &nbsp;&nbsp;
      <!-- 스토리 버튼 -->
      <img style="width: 25px; height: 25px; object-fit: contain" onclick="document.getElementById('add_feed').click();" src="./resources/image/icon_08.png"> &nbsp;&nbsp;
   </div>
  </footer>

  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- 모달 스크립트 -->

  <script>
    $(document).ready(function()
      // input file 파일 첨부시 fileCheck 함수 실행
      {
        $("#input_file").on("change", uploadFiles);
      });
  </script>
  
  <script>
    const modal_add_feed = document.getElementById("modal_add_feed");
    const modal_add_feed_content = document.getElementById("modal_add_feed_content");
    const buttonAddFeed = document.getElementById("add_feed");

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
          '<div><img style="width: 150px; height: 150px;" src="./resources/image/icon_32.png"></div>' +
          '<div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>' +
          '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>'
        );
      } else {
        $('.image_upload').html(
          '<div><img style="width: 150px; height: 150px;" src="./resources/image/icon_31.png"></div>' +
          '<div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>' +
          '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>'
        );
      }
    }

    function uploadFiles(e){

      alert("file");

      e.stopPropagation();
      e.preventDefault();
      
      e.dataTransfer = e.originalEvent.dataTransfer; 
      var files =  e.dataTransfer.files;

      for (i=0; i<files.length; i++) {
        if (files[i].type.match(/image.*|video.*/)) {
          $('.modal_image_upload').css({
            "outline": "none",
            "background-size": "100% 100%",
            'background-color' : 'transparent'
          });

          // 파일 타입이 이미지 일 경우
          if (files[i].type.match(/image.*/)) {
            var html = "";
            html += '<li class="sub_upload"><img style="width: 780px; height: 556px; background:#e2e2e2;" src="' + window.URL.createObjectURL(files[i]) + '"></li>';
            $('.upload_list').append(html)
            document.getElementById('upload_next').click();
          } else {
            // 파일 타입이 동영상 일 경우
            var html = "";
            html += '<li class="sub_upload"><video controls width="780px" height="556px" style="background:#e2e2e2;" src="' + window.URL.createObjectURL(files[i]) + '"></li>';
            $('.upload_list').append(html)
            document.getElementById('upload_next').click();
          }
          $('.image_upload').html(
            '<div><img style="width: 150px; height: 150px;" src="./resources/image/icon_31.png"></div>' +
            '<div style="margin-top: 30px; font-size: 20px;"><a>사진과 동영상을 여기에 끌어다 놓으세요</a></div>' +
            '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>최대 업로드 파일 크기 : 10MB</a></div>'
          );
        } else {
          // 파일을 업로드하지 못했습니다. 
          $('.modal_image_upload').css({
            'background-color' : '#transparent'
          });
          
          $('.image_upload').html(
            '<div><img style="width: 150px; height: 150px;" src="./resources/image/icon_33.png"></div>' +
            '<div style="margin-top: 30px; font-size: 20px;"><a>지원되지 않는 파일입니다</a></div>' +
            '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a style="font-weight: bold;">' + files[i].name + '</a><a> 파일을 업로드하지 못했습니다.</a></div>'
          );
          return;
        }
      }
    }
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

  </script>
</body>
</html>