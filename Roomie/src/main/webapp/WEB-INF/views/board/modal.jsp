<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">

      <!-- jquery -->
      <script
         src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.3.1.min.js"
         integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
         crossorigin="anonymous"></script>

<body>


   <div id="modal_overlay1" class="modal_overlay1" style="position: fixed;">
        <div class="report1" style="width: 400px; height: 200px; text-align: center; padding: 0 0 0 0;" >
            <div class="block1" style="display: flex; display: table-cell; height: 50px; margin: 0 0 0 0; vertical-align: middle;">
            <p style="width: 400px; font-size: 15px; height: 15px; margin: 0 0 0 0; display: inline-block; color: #ed4956;">신고</p>
        </div>
        <hr style="margin: 0 0 0 0;">
            <div class="block2" style="display: flex; display: table-cell; height: 50px; margin: 0 0 0 0; vertical-align: middle;">
            <p style="width: 400px; font-size: 15px; height: 15px; margin: 0 0 0 0; display: inline-block; color: #ed4956;">차단</p>
        </div>
        <hr style="margin: 0 0 0 0;">
            <div class="block3" style="display: flex; display: table-cell; height: 50px; margin: 0 0 0 0; vertical-align: middle;">
            <p style="width: 400px; font-size: 15px; height: 15px; margin: 0 0 0 0; display: inline-block; color: #ed4956;">팔로우 취소</p>
        </div>
        <hr style="margin: 0 0 0 0;">
            <div class="block4" style="display: flex; display: table-cell; height: 50px; margin: 0 0 0 0; vertical-align: middle;">
            <p style="width: 400px; font-size: 15px; height: 15px; margin: 0 0 0 0; display: inline-block;">취소</p>
        </div>
        
    </div>
    </div>





    <div id="modal_overlay2" class="modal_overlay2" style="position: fixed;">
        <div class="report1" style="width: 400px; height: 200px; padding: 0 0 0 0; text-align: center;" >
            <div style="display: flex; width: 400px; display: table-cell; height: 50px; margin: 0 0 0 0; text-align: center; vertical-align: middle;">
            <p style="width: 360px; margin: 0 0 0 0; font-weight: bold; display: inline-block; ">신고</p>
            <button onclick="delete1()" style="border: none; background-color: white; padding: 0 0 0 0;">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                  </svg></button>
        </div>
        <hr style="margin: 0 0 0 0;">
         <div style="display: flex; width: 400px; display: table-cell; height: 50px; margin: 0 0 0 0; vertical-align: middle;">
         <p style="margin: 0 0 0 0;">이 계정을 신고하려는 이유가 무엇인가요?</p>
         </div>
         <hr style="margin: 0 0 0 0;">
         <div id="rep_board" style="display: flex; vertical-align: middle; text-align: justify;">
         <p style="font-size: 14px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">게시물, 메시지 또는 댓글 신고</p>
         <span style="margin: 10px 0px; text-align: right;">
         <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
          </svg></span>
        </div>
        <hr style="margin: 0 0 0 0;">
        <div id="rep_member" style="display: flex; vertical-align: middle; text-align: justify;">
            <p style="font-size: 14px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">
                계정 신고</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
        </div>
    </div>


    <div id="modal_overlay3" class="modal_overlay3" style="position: fixed;">
        <div class="report1" style="width: 400px; height: 515px; text-align: center; padding: 0 0 0 0" >
            <div style="display: flex; width: 400px; display: table-cell; height: 50px; margin: 0 0 0 0; text-align: center; vertical-align: middle;">
            <p style="width: 360px; margin: 0 0 0 0; font-weight: bold; display: inline-block; ">신고</p>
            <button onclick="delete2()" style="border: none; background-color: white; padding: 0 0 0 0;">
                <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-x" viewBox="0 0 16 16">
                    <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                  </svg></button>
        </div>
        <hr style="margin: 0 0 0 0;">
         <div style="display: flex; width: 400px; display: table-cell; height: 50px; margin: 0 0 0 0; vertical-align: middle;">
         <p style="margin: 0 0 0 0; font-weight: bold; font-size: 15px;">이 계정을 신고하려는 이유가 무엇인가요?</p>
         </div>
         <hr style="margin: 0 0 0 0;">
         
         <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">스팸</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
           <hr style="margin: 0 0 0 0;">
            
           <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">나체 이미지 또는 성적 행위</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
            <hr style="margin: 0 0 0 0;">
           
           <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">혐오 발언 또는 상징</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
            <hr style="margin: 0 0 0 0;">
           
           <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">폭력 또는 위험한 단체</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
            <hr style="margin: 0 0 0 0;">
            
            <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">불법 또는 규제 상품 판매</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
            <hr style="margin: 0 0 0 0;">
            
            <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">자살 또는 자해</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
            <hr style="margin: 0 0 0 0;">
            
            <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">거짓 정보</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
            <hr style="margin: 0 0 0 0;">
            
            <div class="reason" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #808080; display: inline-block; margin: 10px 10px; width: 370px;">마음에 들지 않습니다</p>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
           
            
        </div>
    </div>


    <div id="modal_overlay4" class="modal_overlay4" style="position: fixed;">
        <div class="report1" style="width: 400px; height: 420px; text-align: center;" >
            
        <div id="image" style="margin: 10px">
            <svg aria-label="체크 표시" class="_ab6-" color="#58c322" fill="#58c322" height="48" role="img" viewBox="0 0 24 24" width="48">
            <path d="M12.001.504a11.5 11.5 0 1 0 11.5 11.5 11.513 11.513 0 0 0-11.5-11.5Zm0 21a9.5 9.5 0 1 1 9.5-9.5 9.51 9.51 0 0 1-9.5 9.5ZM16.293 8.3l-5.792 5.788-2.794-2.796a1 1 0 1 0-1.414 1.414l3.5 3.503a1 1 0 0 0 1.414.001l6.5-6.495A1 1 0 0 0 16.293 8.3Z"></path></svg>
        </div>

        <h4>알려주셔서 고맙습니다</h4>

        <p>회원님의 소중한 의견은 roomie 커뮤니티를 안전하게 유지하는 데 도움이 됩니다.</p>
        <br>
        <hr style="margin: 0 0 0 0;">
        <div class="reason1" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <div id="b_div1" style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; color: #ed4956; display: inline-block; margin: 10px 10px; width: 370px;">
               </div>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
           <hr style="margin: 0 0 0 0;">

           <div class="reason1" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <div id="f_div1" style="margin: 0 0 0 0; font-size: 14px; line-height: 30px; text-align: left; display: inline-block; margin: 10px 10px; width: 370px;">
                </div>
            <span style="margin: 10px 0px; text-align: right;">
            <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" fill="#808080" class="bi bi-chevron-right" viewBox="0 0 16 16">
               <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z"/>
             </svg></span>
           </div>
           <hr style="margin: 0 0 0 0;">
          <br><br>
           
           <button onclick="delete3()" style="width: 270px; height: 40px; border-radius: 6px; background-color: #0095ff; border: none; color: #FFFFFF;">닫기</button>
        </div>
    </div>
    
    
   
    <div id="modal_overlay5" class="modal_overlay5" style="position: fixed;">
        <div class="report1" style="width: 400px; height: 350px; text-align: center;" >

        
        <br>
        <div id="b_div" style="font-size: 20px;">
        </div><br>

        <p style="font-size: 15px; color: #808080;">상대방의 프로필에서 직접 차단할 수 있습니다. 차단하면 상대방은 더 이상 회원님의 프로필, 게시물 또는 스토리를 찾거나 roomie에서 회원님에게 메시지를 보낼 수 없게
        됩니다. roomie는 회원님의 차단한 사실을 상대방에게 알리지 않습니다.</p>
        <br>
        <hr style="margin: 0 0 0 0;">
        <div id="block" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-weight: bold; font-size: 14px; line-height: 30px; text-align: center; color: #0095f6; display: inline-block; margin: 10px 10px; width: 370px;">
                차단</p>
           </div>
           <hr style="margin: 0 0 0 0;">

           <div onclick="delete4()" style="display: flex; height: 50px; vertical-align: middle; text-align: justify;">
            <p style="margin: 0 0 0 0; font-weight: bold; font-size: 14px; line-height: 30px; text-align: center; display: inline-block; margin: 10px 10px; width: 370px;">
                취소</p>
           </div>
          
          
        </div>
    </div>
  

</body>

 <!-- JQuery -->
 <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>

//첫번째 모달
$(".block1").click( function() {
	$("#modal_overlay2").css("display", "flex");
	$("#modal_overlay1").css("display", "none");

});

$(".block2").click( function() {
	
	$("#modal_overlay5").css("display", "flex");
	$("#modal_overlay1").css("display", "none");
	
	console.log("세션확인하는방법 : " + sessionStorage.getItem("BO_IDX"));
	
	var data = sessionStorage.getItem("BO_NAME") + "님을 차단하시겠어요?";
	
	$("#b_div").html(data);
	
	});
	
$(".block3").click( function() {
	   console.log("block3클릭");

	});
	
$(".block4").click( function() {
	$("#modal_overlay1").css("display", "none");
	});


//두번째 모달 : 신고 - 게시물
$("#rep_board").click( function() {
	$("#modal_overlay3").css("display", "flex");
	$("#modal_overlay2").css("display", "none");
	
	sessionStorage.setItem("rep", "board");

});

//두번째 모달 : 신고 - 회원
$("#rep_member").click( function() {
	$("#modal_overlay3").css("display", "flex");
	$("#modal_overlay2").css("display", "none");
	
	sessionStorage.setItem("rep", "member");

});

function delete1(){
	
	$("#modal_overlay2").css("display", "none");	
	
}

//세번째 모달 - reson 클릭 시 바로 신고
var reason = document.querySelectorAll(".reason");

for(var let=0 ; let < reason.length; let++){
	
reason[let].addEventListener('click',function(){
	
	$("#modal_overlay3").css("display", "none");
	
	const pTag = this.querySelector('p'); // 클릭된 div 요소 내부의 p 요소 선택
    //console.log(pTag.innerText); // p 요소의 내용 콘솔에 출력
    
    $("#modal_overlay4").css("display", "flex");
    
    console.log("세션확인하는방법 : " + sessionStorage.getItem("BO_IDX"));
    console.log("rep세션 확인 : " + sessionStorage.getItem("rep"));
	
	var b_div1 = sessionStorage.getItem("BO_NAME") + "님 차단";
	var f_div1 = sessionStorage.getItem("BO_NAME") + "님 팔로우취소";
	$("#b_div1").html(b_div1);
	$("#f_div1").html(f_div1);
	
	/* var rep = sessionStorage.getItem("rep");
	var reson = pTag.textContent;
    
	var data = { "rep" : rep, "reson" :  reson, 
			"bo_idx": bo_idx } */
	
	
	var form = new FormData();
	form.append("rep", sessionStorage.getItem("rep"));
	form.append("reason", pTag.textContent);
	form.append("bo_idx", sessionStorage.getItem("BO_IDX"));
	form.append("bo_mem", sessionStorage.getItem("BO_MEM"));
	
	
	$.ajax({
	    url: "report.ya",
	    type: "POST",
	    data: form,
	    processData: false,
	    contentType: false,
	    success: function(data) {
	        console.log("전송 성공");
	        console.log(bo_idx);
	        

	    },
	    error: function(xhr, status, error) {
	        console.error("전송 실패: " + error);
	    }
	});
	

	
});
	
}

function delete2(){
	
	$("#modal_overlay3").css("display", "none");	
	
}


//네번째 모달
function delete3(){
	
	$("#modal_overlay4").css("display", "none");	
	
}

//차단
function delete4(){
	
	$("#modal_overlay5").css("display", "none");	
	
}



$("#b_div1").click( function() {
	
	$("#modal_overlay5").css("display", "flex"); //차단
	$("#modal_overlay4").css("display", "none"); //알려주셔서 감사합니다
	
	
	console.log("세션확인하는방법 : " + sessionStorage.getItem("BO_IDX"));
	
	var data = sessionStorage.getItem("BO_NAME") + "님을 차단하시겠어요?";
	
	$("#b_div").html(data);
	
});

//실제 차단
$("#block").click( function() {
	
	
	console.log("세션확인하는방법 : " + sessionStorage.getItem("BO_IDX"));
	
	var data = sessionStorage.getItem("BO_NAME") + "님을 차단하시겠어요?";
	
	$("#b_div").html(data);
	
	
	var form = new FormData();
	form.append("bo_mem", sessionStorage.getItem("BO_MEM"));
	
	
	$.ajax({
	    url: "block.ya",
	    type: "POST",
	    data: form,
	    processData: false,
	    contentType: false,
	    success: function(data) {
	        console.log("전송 성공");
	        $("#modal_overlay5").css("display", "none"); //차단

	    },
	    error: function(xhr, status, error) {
	        console.error("전송 실패: " + error);
	    }
	});
	

});

//차단 모달

</script>

<script>



</script>

</html>