<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ROOMIE ADMIN</title>

  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  </head>
  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }

    .b-example-divider {
      height: 3rem;
      background-color: rgba(0, 0, 0, .1);
      border: solid rgba(0, 0, 0, .15);
      border-width: 1px 0;
      box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
    }

    .b-example-vr {
      flex-shrink: 0;
      width: 1.5rem;
      height: 100vh;
    }

    .bi {
      vertical-align: -.125em;
      fill: currentColor;
    }

    .nav-scroller {
      position: relative;
      z-index: 2;
      height: 2.75rem;
      overflow-y: hidden;
    }

    .nav-scroller .nav {
      display: flex;
      flex-wrap: nowrap;
      padding-bottom: 1rem;
      margin-top: -1px;
      overflow-x: auto;
      text-align: center;
      white-space: nowrap;
      -webkit-overflow-scrolling: touch;
    }
  </style>
  <body>

      <header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">Company name</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-dark w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search">
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="#">Sign out</a>
    </div>
  </div>
</header>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/roomie/adminMember.ya">
              <span data-feather="home" class="align-text-bottom"></span>
              회원관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/roomie/adminBoard.ya">
              <span data-feather="file" class="align-text-bottom"></span>
              게시판관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/roomie/adminComment.ya">
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              댓글관리
            </a>
          </li>
          </ul>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">회원 관리</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          </div>

        </div>
      </div>

 <!--begin::Card body-->
 <div class="card-body p-9">
    <!--begin::Row-->
    <div class="row mb-4">
        <!--begin::Col-->
        <div class="col-xl-2">
            <div class="fs-6 fw-bolder mt-2 mb-3">검색어</div>
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-9 fv-row fv-plugins-icon-container d-flex mw-425px">
            <div class="min-w-100px me-4">
                <select id="id_search_select" class="form-select" data-control="select2" data-placeholder="Select an option" data-hide-search="true">
                    <option value="1"  selected >전체</option>
                    <option value="2" >회원명</option>
                    <option value="3" >이메일</option>
                </select>
            </div>
            <input id="id_search_word" type="text" class="form-control form-control-solid" name="name"  value="" >
        </div>
    </div>
    <!--end::Row-->
    <!--begin::Row-->
    <div class="row mb-4">
        <!--begin::Col-->
        <div class="col-xl-2">
            <div class="fs-6 fw-bolder mt-2 mb-3">가입일</div>
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-9 fv-row fv-plugins-icon-container mw-425px">
            <div class="position-relative d-flex align-items-center">
                <input class="form-control form-control-solid ps-12 flatpickr-input" id="date" name="date" placeholder="Pick a date" id="kt_datepicker_7" type="text" readonly="readonly" >
            </div>
        </div>
    </div>
    <!--end::Row-->
    
    <!--begin::Row-->
    <div class="row">
        <!--begin::Col-->
        <div class="col-xl-2">
            <div class="fs-6 fw-bolder mt-2 mb-3">처리 안된 피신고</div>
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-9">
            <div id="id_report_type_div" class="d-flex fw-bold h-100">
                <div class="form-check form-check-custom form-check-solid me-9">
                    <input class="form-check-input" name="radio_input3" type="radio" value="-1"  checked="checked" >
                    <label class="form-check-label">전체</label>
                </div>
                <div class="form-check form-check-custom form-check-solid me-9">
                    <input class="form-check-input" name="radio_input3" type="radio" value="0" >
                    <label class="form-check-label">있음</label>
                </div>
                <div class="form-check form-check-custom form-check-solid">
                    <input class="form-check-input" name="radio_input3" type="radio" value="1" >
                    <label class="form-check-label">없음</label>
                </div>
            </div>
        </div>
        <!--end::Col-->
    </div>
    <!--end::Row-->
</div>
<!--end::Card body-->
<!--begin::Card footer-->
<div class="card-footer d-flex justify-content-center py-6 px-9">
    <button id="reset_btn" type="reset" class="btn btn-light btn-active-light-primary me-8"
    style="margin-right: 30px;">검색조건 초기화</button>
   
    <button class="btn btn-primary" id="btn_p">검색</button>
</div>
<!--end::Card footer-->

<!--테이블 시작-->
<div class="mb-16">
    <div class="d-flex justify-content-between mb-5">

      
    </div>
    <table class="table table-rounded table-striped border gy-4 gs-6 shadow-sm">
        <thead>
            <tr class="fw-bold fs-6 text-gray-800 border-bottom border-gray-200 fw-bolder">
                <th>회원명</th>
                <th>이메일</th>
                <th class="text-center" colspan="4">처리 안된 피신고</th>
                <th>가입일</th>
            </tr>
        </thead>
        <tbody>
            
            <c:forEach var="member" items="${member}">
            
            <tr>
                <td><a class="loc">${member.MEM_NAME}</a></td>
                <input type="hidden" id="mem_idx" value="${member.MEM_IDX}"/>
                
                <td class="text-truncate">${member.MEM_ID}</td>

                <c:choose>
                <c:when test="${member.COUNT != null}">
                <td class="text-center"colspan="4">                                
                ${member.COUNT}
                </td>
                </c:when>
                <c:otherwise>
                <td class="text-center"colspan="4">                                
                0
                </td>
                </c:otherwise>
                </c:choose>
                
                <td name="na_memo_td" data-member_uuid='aXeyNPyMZnAE3mCTXAgbSe' data-memo=''>
                    <div class="popover-markup">
                        <fmt:formatDate value="${member.MEM_RDATE}" pattern="yyyy-MM-dd" />
                        
                    </div>
                </td>
            </tr>
            
            </c:forEach>
            

        </tbody>
    </table>
<!--테이블 끝-->

    </main>
  </div>
</div>

    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>


<script>

	
	let loc = document.querySelectorAll('.loc'); 
	let idx = document.querySelectorAll('#mem_idx'); 
	
	for(let i=0; i < loc.length; i++){
		
		loc[i].addEventListener('click',function(){
			
			let mem_idx = idx[i].value;
			
			console.log(mem_idx);
			
			$.ajax({
			    url: "/roomie/adminMemberC.ya",
			    type: "GET",
			    data: { mem_idx: mem_idx },
			    success: function(data) {
			        
			    	console.log("확인" + mem_idx);
			        window.location.href = "/roomie/adminMemberD.ya?mem_idx=" + mem_idx;
			        
			    },
			    error: function(xhr, status, error) {
			        console.error("전송 실패: " + error);
			    }
			});
			
			
		});
		
	}
	


</script>

<script>


$(function(){
   $('#date').datepicker();
})


</script>

<!-- 검색 -->
<script>

$("#btn_p").click(function() {
	
	
	var radio = $('input[name=radio_input3]:checked').val();
	
	console.log("라디오 버튼 : " + radio);
	
	var select = document.getElementById("id_search_select");
	
	console.log("검색어 어떤 검색 : " + select.value);
	
	var word = document.getElementById("id_search_word");
	
	console.log("검색어 : " + word.value);
	
	var date = $('#date').val();
	
	console.log("날짜 : " + date);
	
	$.ajax({
		
		url: "/roomie/adminMemberS.ya",
	    type: "GET",
	    data: { radio: radio,
	    	select: select.value, word: word.value, date: date  },
	    success: function(data) {
	        
	    	console.log("확인");
	      
	        
	    },
	    error: function(xhr, status, error) {
	        console.error("전송 실패: " + error);
	    }
		
	});
	
	
	
});


</script>
  </body>
</html>