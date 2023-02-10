<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="utf-8">
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <!-- ë´ë¹ê²ì´ì ë° -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
  <!-- ë´ë¹ê²ì´ì ë° êµ¬ê¸ ìì´ì½ ì´ë¯¸ì§ -->
  <link href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
        rel="stylesheet">

  <!-- style css -->
  <link rel="stylesheet" type="text/css" href="resources/css/main_style.css">
  <link rel="stylesheet" type="text/css" href="resources/css/modal_style.css">

  <!-- íì´í -->
  <title>ROOMIE</title>
</head>
<body>
  <!-- ìë¨ ë´ë¹ê²ì´ì ë° ìì -->
  <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width: 100%; position: fixed; z-index: 2;" >
    <div class="container">
      <img class="navbar-brand" style="height: 44px; object-fit: contain;" src="resources/image/Roomie5.png">

      <!-- ê²ìì°½ -->
      <!-- <input class="form-control" style="width: 200px" type="search" placeholder="Search" aria-label="Search"> -->

      <div>
        <!-- í ë²í¼ -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_09.png"> &nbsp;&nbsp;
        <!-- ê²ì ë²í¼ -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_07.png"> &nbsp;&nbsp;
        <!-- íì í­ ë²í¼ -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_22.png"> &nbsp;&nbsp;
        <!-- ì±í ë²í¼ -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_04.png"> &nbsp;&nbsp;
        <!-- ìë¦¼ ë²í¼ -->
        <img class="menu_img" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_01.png"> &nbsp;&nbsp;
        <!-- ê²ìê¸ ìë¡ë ë²í¼ -->
        <img class="menu_img" id="add_feed" style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_08.png"> &nbsp;&nbsp;
        <!-- ëª¨ë¬ ê²ìê¸ ì´ë¯¸ì§ ìë¡ë ìì -->
        <div class="modal_overlay" id="modal_add_feed" style="position: fixed;">
          <div class="modal_window" id="modal_window" style="width: 800px; height: 600px;">
            <div class="modal_title">
                <div class="modal_title_side">
                  <!-- ì´ë¯¸ì§ ì¶ê° ë²í¼ -->
                  <div style="margin-top: -10px;"><img style="cursor:pointer;" src="resources/image/icon_34.png"></div>
                </div>
                <!-- ëª¨ë¬ íì´í -->
                <div style="font-size: 16px;"> ì ê²ìë¬¼ </div>
                <div class="modal_title_side">
                  <!-- ë¤ì íì´ì§(ê¸ìì±) ë²í¼ -->
                  <div style="margin-top: -8px; margin-right: 15px;"><img style="cursor:pointer;" onclick="modal_add_feed_Next();" src="resources/image/icon_38.png"></div>
                  <!-- ëª¨ë¬ ë«ê¸° ë²í¼ -->
                  <div style="margin-top: -8px;"><img id="close_modal_add_feed" style="cursor:pointer;" src="resources/image/icon_40.png"></div>
                </div>
            </div>
            <div class="modal_image_upload" style="position: fixed;">
              <!-- ìë¡ë ê³µê° -->
              <div class="upload" id="uploadmedia">
                <ul class="upload_list">
                
                </ul>
              </div>
            </div>
            <div class="image_upload" style="width: 800px; margin-top: 150px; display: inline-block; text-align: center;">
              <div><img style="width: 150px; height: 150px;" src="resources/image/icon_31.png"></div>
              <div style="margin-top: 30px; font-size: 20px;"><a>ì¬ì§ê³¼ ëììì ì¬ê¸°ì ëì´ë¤ ëì¼ì¸ì</a></div>
              <div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>ìµë ìë¡ë íì¼ í¬ê¸° : 10MB</a></div>
            </div>
            <!-- ì´ë¯¸ì§ ì¼ìª½ ë²í¼ -->
            <img class="upload_prev" id="upload_prev" style="cursor:pointer; left:0px; top:-136px; position: relative; z-index: 1;" src="resources/image/icon_35.png">
            <!-- ì´ë¯¸ì§ ì¤ë¥¸ìª½ ë²í¼ -->
            <img class="upload_next" id="upload_next" style="cursor:pointer; left:726px; top:-136px; position: relative; z-index: 1;" src="resources/image/icon_36.png">
          </div>
        </div>
        <!-- ëª¨ë¬ ê²ìê¸ ì´ë¯¸ì§ ìë¡ë ë -->
        <!-- ëª¨ë¬ ê²ìê¸ ê¸ì°ê¸° ìì -->
      <div class="modal modal_overlay" id="modal_add_feed_content" style="position: fixed;">
        <div class="modal_window" style="width: 800px; height: 600px;">
          <div class="modal_title">
              <div class="modal_title_side">
                <!-- ì´ì  ë²í¼ -->
                <div style="margin-top: -10px; margin-right: 15px;"><img style="cursor:pointer;" onclick="modal_add_feed_Prev();" src="resources/image/icon_39.png"></div>
              </div>
              <!-- ëª¨ë¬ íì´í -->
              <div style="font-size: 16px;"> ì ê²ìë¬¼ </div>
              <div class="modal_title_side">
                <!-- ëª¨ë¬ ë«ê¸° ë²í¼ -->
                <div style="margin-top: -8px; margin-left: 20px;"><img id="close_modal_add_feed_content" style="cursor:pointer;" src="resources/image/icon_40.png"></div>
              </div>
          </div>
          <div class="modal_image_content">
              <div id="input_image" class="modal_image_upload_content">

              </div>
              <div class="modal_content_write">
                  <div class="feed_name">
                      <div class="profile_box">
                          <img id="input_profile_image" class="profile_img" src="resources/image/profile_05.jpg">
                      </div>
                      <span id="input_user_id" class="feed_name_txt" value="${MEM_IDX}"> jshong_ </span>
                  </div>
                  <div style="height: 440px">
                      <textarea id="input_content" class="feed_content_textarea form-control col-sm-5" style="height: 95%;" rows="10" placeholder="ì¤ëªì ìë ¥íì¸ìresources."></textarea>
                  </div>
                  <div style="width: 100%; text-align: center">
                    <button id="insert" name="insert" class="button" type="submit" style="cursor:pointer">ê¸ì°ê¸°</button>
                  </div>
              </div>
          </div>
        </div>
      </div>
        <!-- ëª¨ë¬ ê²ìê¸ ê¸ì°ê¸° ë -->
      </div>
    </div>
  </nav>
  <!-- ìë¨ ë´ë¹ê²ì´ì ë° ë -->

  <!-- ë©ì¸ ë°ë ìì­ ìì -->
  <div class="main_body">
    <!-- ì¼ìª½ ë°ë ìì­ ìì -->
    <div class="left_body">
      <!-- ì¤í ë¦¬ ìì -->
      <div class="story">
        <!-- ì¼ìª½ ë²í¼ -->
        <div class="story_prev" style="top:50px; cursor:pointer; position: relative; z-index: 1;"><img src="resources/image/icon_29.png"></div>
        <ul class="story_list">
          <li class="sub_story">
            <div class="text">
              <a onclick="href='#'"><img src="resources/image/profile_01.jpg" alt="íë¡í"></a>
              <span style="font-size: 12px; margin-left: 3px;">yeongjun</span>
            </div>
          </li>          
        </ul>
        <!-- ì¤ë¥¸ìª½ ë²í¼ -->
        <div class="story_next" style="top:-68px; left:436px; cursor:pointer; position: relative; z-index: 1;"><img src="resources/image/icon_30.png"></div>
      </div>
      <!-- ì¤í ë¦¬ ë -->
      <!-- ê²ìê¸ ìì -->
      <div class="border feed_box">
        <div class="feed_name">
          <div class="profile_box">
            <img class="profile_img" src="resources/image/profile_06.jpg">
          </div>
          <span class="feed_name_txt"> daemyeong </span>
          <!-- ëë³´ê¸° ë²í¼ -->
          <img class="more_details" src="resources/image/icon_28.png" alt="ëë³´ê¸°">
        </div>
        <img class="feed_img" src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
  
        <div class="feed_icon">
          <div>
            <!-- ì¢ìì ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_01.png">
            <!-- ëê¸ ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_03.png">
            <!-- ê³µì  ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_04.png">
          </div>
          <div>
            <!-- ê²ìê¸ ì ì¥ ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_05.png">
          </div>
        </div>
        <div class="feed_like">
          <!-- ì¢ìì íì -->
          <p class="feed_txt"> <b>ì¢ìì 10ê°</b></p>
        </div>
        <div class="feed_content">
          <!-- ì´ë¦, ê²ìê¸ ë´ì© -->
          <p class="feed_txt"> <b> daemyeong </b> ì½ë¡ëë¼ì í´ì¸ì¬íì ëª»ê°ë ìµê·¼ ì ì£¼ë ê°ëì¬ëì´ ëê³ ììµëë¤~ ì ì£¼ëë ì¡°ì¬í´ì¼ëëê±´ ë§ì°¬ê°ì§~!</p>
        </div>
        <!-- ëê¸ ëª©ë¡ -->
        <div class="feed_reply">
          <span class="feed_txt"> <b> taeyeong </b> ì ì£¼ë ê°ê³  ì¶ì´ì ã ã </span>
          <span class="feed_txt"> <b> junseok </b> ì ì£¼ë  ã± ã± </span>
        </div>
        <!-- ëê¸ ë¬ê¸° -->
        <div class="inputContainer">
          <div class="type_comment">
            <input class="inputBox" type="text" placeholder="ëê¸ ë¬ê¸°resources.">
          </div>
          <span>
            <button class="buttonBox" type="summit">ê²ì</button>
          </span>
        </div>
      </div>
      <!-- ê²ìê¸ ë -->
      <!-- ëë²ì§¸ ê²ìê¸ ìì -->
      <div class="border feed_box">
        <div class="feed_name">
          <div class="profile_box">
            <img class="profile_img" src="resources/image/profile_06.jpg">
          </div>
          <span class="feed_name_txt"> daemyeong </span>
        </div>
        <img class="feed_img" src="https://mblogthumb-phinf.pstatic.net/MjAxNzA2MTFfMjc1/MDAxNDk3MTcyMDgyNzEw.ID5RyHWKvsVEW2NS9EQGyRYX7vUaXr7znQeuTrRRmdIg.gK7MD7VhNJPkV4_dueiWer2y-oH7NAAmEklF-6bbYyQg.JPEG.jejubyeol/%EC%97%AC%EB%A6%84%EC%97%90_%EC%A0%9C%EC%A3%BC%EB%8F%84_%EC%82%AC%EC%A7%84%EC%B0%8D%EA%B8%B0_%EC%A2%8B%EC%9D%80%EA%B3%B3.jpg?type=w800">
  
        <div class="feed_icon">
          <div>
            <!-- ì¢ìì ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_01.png">
            <!-- ëê¸ ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_03.png">
            <!-- ê³µì  ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_04.png">
          </div>
          <div>
            <!-- ê²ìê¸ ì ì¥ ë²í¼ -->
            <img class="material-icons-outlined" style="width: 20px; height: 20px; object-fit: contain" src="resources/image/icon_05.png">
          </div>
        </div>
        <div class="feed_like">
          <!-- ì¢ìì íì -->
          <p class="feed_txt"> <b>ì¢ìì 10ê°</b></p>
        </div>
        <div class="feed_content">
          <!-- ì´ë¦, ê²ìê¸ ë´ì© -->
          <p class="feed_txt"> <b> daemyeong </b> ì½ë¡ëë¼ì í´ì¸ì¬íì ëª»ê°ë ìµê·¼ ì ì£¼ë ê°ëì¬ëì´ ëê³ ììµëë¤~ ì ì£¼ëë ì¡°ì¬í´ì¼ëëê±´ ë§ì°¬ê°ì§~!</p>
        </div>
        <!-- ëê¸ ëª©ë¡ -->
        <div class="feed_reply">
          <span class="feed_txt"> <b> taeyeong </b> ì ì£¼ë ê°ê³  ì¶ì´ì ã ã </span>
          <span class="feed_txt"> <b> junseok </b> ì ì£¼ë  ã± ã± </span>
        </div>
      </div>
      <!-- ëë²ì§¸ ê²ìê¸ ë -->
    <!-- ì¼ìª½ ë°ë ìì­ ë -->
    <!-- ì¤ë¥¸ìª½ ë°ë ìì­ ìì -->
    <div class="right_body">
      <!-- ê³ì  ì í ìì -->
      <div class="feed_name" style="justify-content: space-between">
        <div style="display: flex; align-items: center; ">
          <div class="big_profile_box">
            <!-- ê³ì  íë¡í ì´ë¯¸ì§ -->
            <img class="profile_img" src="resources/image/profile_06.jpg">
          </div>
          <div class="name_content">
            <!-- ì¬ì©ì ì´ë¦ -->
            <span class="feed_name_txt"> daemyeong </span>
            <!-- ì´ë¦ -->
            <span class="name_content_txt"> Yoon Daemyeong </span>
          </div>
        </div>
  
        <!-- ê³ì  ì í -->
        <a class="link_txt" > ì í </a>
      </div>
      <!-- ê³ì  ì í ë -->
      <!-- íìëì ìí ì¶ì² -->
      <div class="recommend_box">
        <span style="color: gray"> íìëì ìí ì¶ì²</span>
        <span style="font-size: 12px"> ëª¨ë ë³´ê¸° </span>
      </div>
      <!-- íì ëª©ë¡ ìì -->
      <div>
        <!-- íì ìì -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <!-- íì íë¡í ì´ë¯¸ì§ -->
            <img class="profile_img" src="resources/image/profile_01.jpg">
          </div>
          <div class="name_content">
            <!-- íì ì¬ì©ì ì´ë¦ -->
            <span class="feed_name_txt"> yeongjun </span>
            <!-- íì ìí -->
            <span class="name_content_txt"> EZEN ì ê·ê°ì</span>
          </div>
          <!-- íë¡ì° ë²í¼ -->
          <a class="link_txt"> íë¡ì° </a>
        </div>
        <!-- íì ë -->
        <!-- ì²«ë²ì§¸ íì ìì -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="resources/image/profile_02.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> junseok </span>
            <span class="name_content_txt"> yeongjun ì¸ 5ëªì´ íë¡ì°</span>
          </div>
          <a class="link_txt">
            íë¡ì°
          </a>
        </div>
        <!-- ì²«ë²ì§¸ íì ë -->
        <!-- ëë²ì§¸ íì ìì -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="resources/image/profile_03.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> taeyeong </span>
            <span class="name_content_txt"> yeongjun ì¸ 5ëªì´ íë¡ì°</span>
          </div>
          <a class="link_txt">
            íë¡ì°
          </a>
        </div>
        <!-- ëë²ì§¸ íì ë -->
        <!-- ì¸ë²ì§¸ íì ìì -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="resources/image/profile_04.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> minhoe </span>
            <span class="name_content_txt"> íìëì ìí ì¶ì² </span>
          </div>
          <a class="link_txt">
            íë¡ì°
          </a>
        </div>
        <!-- ì¸ë²ì§¸ íì ë -->
        <!-- ë¤ë²ì§¸ íì ìì -->
        <div class="feed_name" style="justify-content: space-between">
          <div class="profile_box">
            <img class="profile_img"
                 src="resources/image/profile_05.jpg">
          </div>
          <div class="name_content">
            <span class="feed_name_txt"> jeongsu </span>
            <span class="name_content_txt"> íìëì ìí ì¶ì² </span>
          </div>
          <a class="link_txt">
            íë¡ì°
          </a>
        </div>
        <!-- ë¤ë²ì§¸ íì ë -->
      </div>
      <!-- íì ì¶ì² ëª©ë¡ ë -->

      <!-- ROOMIE -->
      <div class="comment_box">
        <span> ìê° Â· ëìë§ Â· íë³´ ì¼í° Â· API Â· ì±ì© ì ë³´ </span>
        <span> ê°ì¸ì ë³´ì²ë¦¬ë°©ì¹¨ Â· ì½ê´ Â· ìì¹ Â· ì¸ê¸° ê³ì  Â· í´ìíê·¸ Â· ì¸ì´ </span>
        <br>
        <span> â 2023 ROOMIE </span>
      </div>
    </div>
    <!-- ì¤ë¥¸ìª½ ë°ë ìì­ ë -->
  </div>
  <!-- ë©ì¸ ë°ë ìì­ ë -->
  <!-- í¸í° ìì -->
  <footer>
    <div>
      <!-- í ë²í¼ -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_09.png"> &nbsp;&nbsp;
      <!-- ê²ì í­ ë²í¼ -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_07.png"> &nbsp;&nbsp;
      <!-- íì í­ ë²í¼ -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_22.png"> &nbsp;&nbsp;
      <!-- ì±í ë²í¼ -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_04.png"> &nbsp;&nbsp;
      <!-- ìë¦¼ ë²í¼ -->
      <img style="width: 25px; height: 25px; object-fit: contain" src="resources/image/icon_01.png"> &nbsp;&nbsp;
      <!-- ì¤í ë¦¬ ë²í¼ -->
      <img style="width: 25px; height: 25px; object-fit: contain" onclick="document.getElementById('add_feed').click();" src="resources/image/icon_08.png"> &nbsp;&nbsp;
   </div>
  </footer>

  <!-- jquery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <!-- ëª¨ë¬ ì¤í¬ë¦½í¸ -->
  <script>
    const modal_add_feed = document.getElementById("modal_add_feed");
    const modal_add_feed_content = document.getElementById("modal_add_feed_content");
    const buttonAddFeed = document.getElementById("add_feed");

    // ëª¨ë¬ ê¸ì°ê¸° ì´ë¯¸ì§ ìë¡ë ëì°ê¸°
    buttonAddFeed.addEventListener("click", e => {
      modal_add_feed.style.display = "flex";
      document.body.style.overflowY = "hidden";
    });

    // ëª¨ë¬ ê¸ì°ê¸° ì´ë¯¸ì§ ìë¡ë ë«ê¸°
    const buttonCloseModal_add_feed = document.getElementById("close_modal_add_feed");
    buttonCloseModal_add_feed.addEventListener("click", e => {
      modal_add_feed.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      $('.upload_list').html('');
      $('#input_content').val('');

    });
    // ëª¨ë¬ ê¸ì°ê¸° ë«ê¸°
    const buttonCloseModal_add_feed_content = document.getElementById("close_modal_add_feed_content");
    buttonCloseModal_add_feed_content.addEventListener("click", e => {
      modal_add_feed_content.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      $('.upload_list').html('');
      $('#input_content').val('');
    });

    // ìë¡ë jquery
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
          '<div style="margin-top: 30px; font-size: 20px;"><a>ì¬ì§ê³¼ ëììì ì¬ê¸°ì ëì´ë¤ ëì¼ì¸ì</a></div>' +
          '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>ìµë ìë¡ë íì¼ í¬ê¸° : 10MB</a></div>'
        );
      } else {
        $('.image_upload').html(
          '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_31.png"></div>' +
          '<div style="margin-top: 30px; font-size: 20px;"><a>ì¬ì§ê³¼ ëììì ì¬ê¸°ì ëì´ë¤ ëì¼ì¸ì</a></div>' +
          '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>ìµë ìë¡ë íì¼ í¬ê¸° : 10MB</a></div>'
        );
      }
    }

    function uploadFiles(e){
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

          // íì¼ íìì´ ì´ë¯¸ì§ ì¼ ê²½ì°
          if (files[i].type.match(/image.*/)) {
            var html = "";
            html += '<li class="sub_upload"><img style="width: 780px; height: 556px; background:#e2e2e2;" src="' + window.URL.createObjectURL(files[i]) + '"></li>';
            $('.upload_list').append(html)
            document.getElementById('upload_next').click();
          } else {
            // íì¼ íìì´ ëìì ì¼ ê²½ì°
            var html = "";
            html += '<li class="sub_upload"><video controls width="780px" height="556px" style="background:#e2e2e2;" src="' + window.URL.createObjectURL(files[i]) + '"></li>';
            $('.upload_list').append(html)
            document.getElementById('upload_next').click();
          }
          $('.image_upload').html(
            '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_31.png"></div>' +
            '<div style="margin-top: 30px; font-size: 20px;"><a>ì¬ì§ê³¼ ëììì ì¬ê¸°ì ëì´ë¤ ëì¼ì¸ì</a></div>' +
            '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a>ìµë ìë¡ë íì¼ í¬ê¸° : 10MB</a></div>'
          );
        } else {
          // íì¼ì ìë¡ëíì§ ëª»íìµëë¤. 
          $('.modal_image_upload').css({
            'background-color' : '#transparent'
          });
          
          $('.image_upload').html(
            '<div><img style="width: 150px; height: 150px;" src="resources/image/icon_33.png"></div>' +
            '<div style="margin-top: 30px; font-size: 20px;"><a>ì§ìëì§ ìë íì¼ìëë¤</a></div>' +
            '<div style="margin-top: 10px; font-size: 14px; color: #8e8e8e;"><a style="font-weight: bold;">' + files[i].name + '</a><a> íì¼ì ìë¡ëíì§ ëª»íìµëë¤.</a></div>'
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

  <!-- íë¡í ì¬ë¼ì´ë -->
  <script>
    const story_list = document.querySelector('.story_list'); //ì ì²´ ì¬ë¼ì´ë ì»¨íì´ë
    const story_slideImg = document.querySelectorAll('.story_list li'); //ëª¨ë  ì¬ë¼ì´ëë¤
    let story_currentIdx = 0; //íì¬ ì¬ë¼ì´ë index
    const story_slideCount = story_slideImg.length; // ì¬ë¼ì´ë ê°ì
    const story_prev = document.querySelector('.story_prev'); //ì´ì  ë²í¼
    const story_next = document.querySelector('.story_next'); //ë¤ì ë²í¼
    const story_slideWidth = 485; //íê°ì ì¬ë¼ì´ë ëì´
    const story_slideMargin = 0; //ì¬ë¼ì´ëê°ì margin ê°

    //ì ì²´ ì¬ë¼ì´ë ì»¨íì´ë ëì´ ì¤ì 
    story_list.style.width = (story_slideWidth + story_slideMargin) * story_slideCount + 'px';

    function story_moveSlide(num) {
      story_list.style.left = -num * 485 + 'px';
      story_currentIdx = num;
    }

    story_prev.addEventListener('click', function () {
      /*ì²« ë²ì§¸ ì¬ë¼ì´ëë¡ íì ëìëë 
      ì´ì  ë²í¼ ëë¬ë ìë¬´ë° ë°ì ìê² íê¸° ìí´ 
      currentIdx !==0ì¼ëë§ moveSlide í¨ì ë¶ë¬ì´ */
      if (story_currentIdx !== 0) story_moveSlide(story_currentIdx - 1);
    });

    story_next.addEventListener('click', function () {
      /* ë§ì§ë§ ì¬ë¼ì´ëë¡ íì ëìëë 
      ë¤ì ë²í¼ ëë¬ë ìë¬´ë° ë°ì ìê² íê¸° ìí´
      currentIdx !==slideCount - 1 ì¼ëë§ 
      moveSlide í¨ì ë¶ë¬ì´ */
      if (story_currentIdx !== story_slideCount - 1) {
        story_moveSlide(story_currentIdx + 1);
      }
    });
  </script>
 <!--  ê²ìë¬¼ ë±ë¡ Ajax -->
  <script>
  $(document).ready(fucntion(){
	  $('#insert').click(function(){
		$.ajax({
			type: "POST",
			url: "/register.ya",
			data:{ "BO_MEDIA": $('#uploadmedia').val(),
				"BO_MEM": $('#input_user_id').val(),
				"BO_CONT": $('#input_content').val(),
				},
			success: function(){
				alert('ê²ìê¸ ë±ë¡');
				/* location.reload(); */
			},
			error: function(){
				alert('ê²ìê¸ ì¤í¨');
			}
		});  
	  });
  });
  </script>

  <script>
    const upload_list = document.querySelector('.upload_list'); //ì ì²´ ì¬ë¼ì´ë ì»¨íì´ë
    const upload_slideImg = document.querySelectorAll('.upload_list li'); //ëª¨ë  ì¬ë¼ì´ëë¤
    let upload_currentIdx = 0; //íì¬ ì¬ë¼ì´ë index
    const upload_slideCount = upload_slideImg.length; // ì¬ë¼ì´ë ê°ì
    const upload_prev = document.querySelector('.upload_prev'); //ì´ì  ë²í¼
    const upload_next = document.querySelector('.upload_next'); //ë¤ì ë²í¼
    var upload_slideWidth = 795; //íê°ì ì¬ë¼ì´ë ëì´
    const upload_slideMargin = 0; //ì¬ë¼ì´ëê°ì margin ê°
  
    // ì°½í¬ê¸° ë³í ê°ì§
    $( window ).resize(function() {
      var windowWidth = $(window).width();
      if(windowWidth > 1100) {
        // ì°½ ê°ë¡ í¬ê¸°ê° 1100ë³´ë¤ í´ ê²½ì° 
        upload_slideWidth = 795;
      } else {
        // ì°½ ê°ë¡ í¬ê¸°ê° 1100ë³´ë¤ ìì ê²½ì°
        upload_slideWidth = 325;
      }
      upload_moveSlide(upload_currentIdx);
    });

    var windowWidth = $(window).width();
    if(windowWidth > 1100) {
      // ì°½ ê°ë¡ í¬ê¸°ê° 1100ë³´ë¤ í´ ê²½ì° 
      upload_slideWidth = 795;
    } else {
      // ì°½ ê°ë¡ í¬ê¸°ê° 1100ë³´ë¤ ìì ê²½ì°
      upload_slideWidth = 325;
    }

    //ì ì²´ ì¬ë¼ì´ë ì»¨íì´ë ëì´ ì¤ì 
    upload_list.style.width = (upload_slideWidth + upload_slideMargin) * upload_slideCount + 'px';

    function upload_moveSlide(num) {
      upload_list.style.left = -num * upload_slideWidth + 'px';
      upload_currentIdx = num;
    }

    upload_prev.addEventListener('click', function () {
      /*ì²« ë²ì§¸ ì¬ë¼ì´ëë¡ íì ëìëë 
      ì´ì  ë²í¼ ëë¬ë ìë¬´ë° ë°ì ìê² íê¸° ìí´ 
      upload_currentIdx !==0ì¼ëë§ upload_moveSlide í¨ì ë¶ë¬ì´ */
      if (upload_currentIdx !== 0) upload_moveSlide(upload_currentIdx - 1);
    });

    upload_next.addEventListener('click', function () {
      /* ë§ì§ë§ ì¬ë¼ì´ëë¡ íì ëìëë 
      ë¤ì ë²í¼ ëë¬ë ìë¬´ë° ë°ì ìê² íê¸° ìí´
      currentIdx !==slideCount - 1 ì¼ëë§ 
      moveSlide í¨ì ë¶ë¬ì´ */
      if (upload_currentIdx !== upload_slideCount - 1) {
        upload_moveSlide(upload_currentIdx + 1);
      }
    });

    // ê¸ì°ê¸° ë¤ì íì´ì§
    function modal_add_feed_Next() {
      $('#modal_add_feed_content').css({
        display : 'flex'
      });

      $('#modal_add_feed').css({
       display: 'none'
      })
    }

    // ì´ì  íì´ì§
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