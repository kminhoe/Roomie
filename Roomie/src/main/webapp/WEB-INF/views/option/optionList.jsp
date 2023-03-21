<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- kakao 지도 스타일끝 -->
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">

<!-- Bootstrap CSS -->
<!-- 내비게이션 바 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- 내비게이션 바 구글 아이콘 이미지 -->
<!-- <link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet"> -->

<!-- style css -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/kakaomap_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/modal_style.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/option_style.css">

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
				<li style="padding: 16px 16px 16px calc(32px - 2px);"><a href="/roomie/optionList.ya" class="current-page-link">비밀번호 변경</a></li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">차단 계정</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">비공개 설정</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">로그아웃</li>
				<li style="padding: 16px 16px 16px calc(32px - 2px);">탈퇴</li>
				<div class="optionline"></div>
				<div style="padding: 16px 16px 16px calc(32px - 2px); border-top: 1px solid #dee2e6;">
					<img class="navbar-brand"
						style="height: 44px; object-fit: contain;"
						src="resources/image/Roomie5.png"><span>불편한 사항이
						있으시면 roomie와 대화해보세요</span>
				</div>
			</ul>
			<div style="padding: 16px 42px 16px 16px; border-left: 1px solid #dee2e6; width: 90%;">
				<div>
					<div class="feed_name" style="margin: 5px 0 0 100px;">
						<div class="profile_box">
							<img class="profile_img" src="resources/image/profile_06.jpg">
						</div>
						<span class="feed_name_txt"><%= session.getAttribute("MEM_NAME") %> </span>
					</div>
					<div class="_acyg" id="passwordForm">
						<input type="hidden" name="MEM_IDX" id="MEM_IDX" value='<%= session.getAttribute("MEM_IDX")%>'>
						<div class="_ab3p">
							<aside class="_ad6_">
								<label class="_ab3q">이전 비밀번호</label>
							</aside>
							<div class="_ab3t">
								<input type="password" id="originalpass" name="originalpass" autocomplete="off">
							</div>
						</div>
						<div class="_ab3p">
							<aside class="_ad6_">
								<label class="_ab3q">새 비밀번호</label>
							</aside>
							<div class="_ab3t">
								<input type="password" id="newpass" name="newpass" autocomplete="off">
								
							</div>
						</div>
						<div class="_ab3p">
							<aside class="_ad6_">
								<label class="_ab3q">새 비밀번호 확인</label>
							</aside>
							<div class="_ab3t">
								<input type="password" id="newpasscheck" name="newpasscheck" autocomplete="off">
							</div>
						</div>
						<div class="_ab3p" style="justify-content: center;">
							<aside class="_ad6_" style="text-align: left; padding-left: 0px;">
								<label class="_ab3q"><button onclick="passwordChange()" value="비밀번호 변경">비밀번호 변경</button></label>
							</aside>
						</div>
						<div class="_ab3p" style="justify-content: center;">
							<aside class="_ad6_"
								style="text-align: left; padding-left: 0px; flex: none;">
								<label class="_ab3q"><a href="/roomie/passwordcheck.ya">비밀번호를
										잊으셨나요?</a></label>
							</aside>
						</div>
					</div>
				</div>
			</div>

		</div>
		﻿<%@ include file="upload_modal.jsp" %>



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
<!-- 	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="./resources/js/jquery.validate.min.js"></script>
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
      location.reload();

    });
    // 모달 글쓰기 닫기
    const buttonCloseModal_add_feed_content = document.getElementById("close_modal_add_feed_content");
    buttonCloseModal_add_feed_content.addEventListener("click", e => {
      modal_add_feed_content.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      location.reload();
    });
    
 	// 모달 위치 닫기
    const buttonCloseModal_add_feed_place = document.getElementById("close_modal_add_feed_place");
    buttonCloseModal_add_feed_place.addEventListener("click", e => {
	  modal_place_add.style.display = "none";
      document.body.style.overflowY = "visible";
      upload_moveSlide(0);
      location.reload();
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
              /* $('#modal_add_feed_content').css({
                    display: 'none'   
                 }); */
              location.reload();
           }
            
         });
         
         
         
      });
    
  </script>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj"
          crossorigin="anonymous">
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
<script src="./resources/js/jquery.validate.min.js"></script>
  
  <script>
    $(function(){
    	
    	var html = '<div style="position: relative; z-index: 1; margin-left: -30px; margin-top: 5px;"><img style="object-fit: contain; position: absolute; right: 5px; transform: translateY(-136%);" src="./resources/image/icon_23.png"></div>';

    	// 유효성 검사
        $("._acyg").validate({
        //규칙
        rules:{
        	newpass: {
            required : true, // 필수 입력 여부
            minlength : 8	// 최소 입력 글자수
          },
         	newpasscheck: {
            required : true,
            minlength : 8,
            equalTo : newpass
          }
          
        },
          //메시지
        messages: {
          
          newpass: {
            required : html, // 비밀번호는 필수 입력입니다.
            minlength : html // 최소 8글자 이상 입력해주세요.
          },
          newpasscheck: {
            required : html, // 비밀번호 확인은 필수 입력입니다.
            minlength : html, // 최소 8글자 이상 입력해주세요.
            equalTo : html // 비밀번호가 일치하지 않습니다.
          }
        },
        //메시지 태그
        errorElement : 'span', 	// 태그
        errorClass : 'error',	// 클레스 이름
        validClass :'vaild' 
      });
    });

  	function passwordChange(){
  		
  		var originpw = document.getElementById("originalpass").value;
  		var newpw = document.getElementById("newpass").value;
  		var newpwch = document.getElementById("newpasscheck").value;
  		var idx = $('input[name=MEM_IDX]').val();
  		let data = new FormData();
  		console.log(idx);
  		if(newpw != newpwch){
  			alert("비밀번호가 일치하지 않습니다");
  			location.reload();
  			return false;
  		}
  		if(originpw == newpw){
  			alert("같은 비밀번호로는 변경할수 없습니다.");
  			location.reload();
  			return false;
  		}
  		  		
  		data.append('MEM_IDX', idx);
  		data.append('oripw' , originpw);
  		data.append('MEM_PWD', newpw);
  		  		
  		$.ajax({
  			url : "/roomie/checkpass.ya",
  			type : "POST",
  			processData: false,
  		  	contentType: false,
  			data : data,
  			dataType : "json",
  			success : function(result){
  				console.log(result);
  				if(result > 0){
  					alert("비밀번호를 확인해주세요");
  					location.reload();
  				}else{
  					alert("비밀번호가 변경되었습니다");
  					location.reload();  					
  				}	
  				
  				 
  			}
  		}) 
  	}
  </script>
</body>
</html>