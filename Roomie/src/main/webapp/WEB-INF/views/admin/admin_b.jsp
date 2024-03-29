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
        <h1 class="h2">게시판 관리</h1>
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
            <div class="fs-6 fw-bolder mt-2 mb-3">작성일</div>
        </div>
        <!--end::Col-->
        <!--begin::Col-->
        <div class="col-xl-9 fv-row fv-plugins-icon-container mw-425px">
            <div class="position-relative d-flex align-items-center">
                <!--begin::Svg Icon | path: icons/duotune/general/gen014.svg-->
                <span class="svg-icon position-absolute ms-4 mb-1 svg-icon-2">
                    
                        <path opacity="0.3" d="M21 22H3C2.4 22 2 21.6 2 21V5C2 4.4 2.4 4 3 4H21C21.6 4 22 4.4 22 5V21C22 21.6 21.6 22 21 22Z" fill="black"></path>
                        <path
                            d="M6 6C5.4 6 5 5.6 5 5V3C5 2.4 5.4 2 6 2C6.6 2 7 2.4 7 3V5C7 5.6 6.6 6 6 6ZM11 5V3C11 2.4 10.6 2 10 2C9.4 2 9 2.4 9 3V5C9 5.6 9.4 6 10 6C10.6 6 11 5.6 11 5ZM15 5V3C15 2.4 14.6 2 14 2C13.4 2 13 2.4 13 3V5C13 5.6 13.4 6 14 6C14.6 6 15 5.6 15 5ZM19 5V3C19 2.4 18.6 2 18 2C17.4 2 17 2.4 17 3V5C17 5.6 17.4 6 18 6C18.6 6 19 5.6 19 5Z"
                            fill="black"></path>
                        <path
                            d="M8.8 13.1C9.2 13.1 9.5 13 9.7 12.8C9.9 12.6 10.1 12.3 10.1 11.9C10.1 11.6 10 11.3 9.8 11.1C9.6 10.9 9.3 10.8 9 10.8C8.8 10.8 8.59999 10.8 8.39999 10.9C8.19999 11 8.1 11.1 8 11.2C7.9 11.3 7.8 11.4 7.7 11.6C7.6 11.8 7.5 11.9 7.5 12.1C7.5 12.2 7.4 12.2 7.3 12.3C7.2 12.4 7.09999 12.4 6.89999 12.4C6.69999 12.4 6.6 12.3 6.5 12.2C6.4 12.1 6.3 11.9 6.3 11.7C6.3 11.5 6.4 11.3 6.5 11.1C6.6 10.9 6.8 10.7 7 10.5C7.2 10.3 7.49999 10.1 7.89999 10C8.29999 9.90003 8.60001 9.80003 9.10001 9.80003C9.50001 9.80003 9.80001 9.90003 10.1 10C10.4 10.1 10.7 10.3 10.9 10.4C11.1 10.5 11.3 10.8 11.4 11.1C11.5 11.4 11.6 11.6 11.6 11.9C11.6 12.3 11.5 12.6 11.3 12.9C11.1 13.2 10.9 13.5 10.6 13.7C10.9 13.9 11.2 14.1 11.4 14.3C11.6 14.5 11.8 14.7 11.9 15C12 15.3 12.1 15.5 12.1 15.8C12.1 16.2 12 16.5 11.9 16.8C11.8 17.1 11.5 17.4 11.3 17.7C11.1 18 10.7 18.2 10.3 18.3C9.9 18.4 9.5 18.5 9 18.5C8.5 18.5 8.1 18.4 7.7 18.2C7.3 18 7 17.8 6.8 17.6C6.6 17.4 6.4 17.1 6.3 16.8C6.2 16.5 6.10001 16.3 6.10001 16.1C6.10001 15.9 6.2 15.7 6.3 15.6C6.4 15.5 6.6 15.4 6.8 15.4C6.9 15.4 7.00001 15.4 7.10001 15.5C7.20001 15.6 7.3 15.6 7.3 15.7C7.5 16.2 7.7 16.6 8 16.9C8.3 17.2 8.6 17.3 9 17.3C9.2 17.3 9.5 17.2 9.7 17.1C9.9 17 10.1 16.8 10.3 16.6C10.5 16.4 10.5 16.1 10.5 15.8C10.5 15.3 10.4 15 10.1 14.7C9.80001 14.4 9.50001 14.3 9.10001 14.3C9.00001 14.3 8.9 14.3 8.7 14.3C8.5 14.3 8.39999 14.3 8.39999 14.3C8.19999 14.3 7.99999 14.2 7.89999 14.1C7.79999 14 7.7 13.8 7.7 13.7C7.7 13.5 7.79999 13.4 7.89999 13.2C7.99999 13 8.2 13 8.5 13H8.8V13.1ZM15.3 17.5V12.2C14.3 13 13.6 13.3 13.3 13.3C13.1 13.3 13 13.2 12.9 13.1C12.8 13 12.7 12.8 12.7 12.6C12.7 12.4 12.8 12.3 12.9 12.2C13 12.1 13.2 12 13.6 11.8C14.1 11.6 14.5 11.3 14.7 11.1C14.9 10.9 15.2 10.6 15.5 10.3C15.8 10 15.9 9.80003 15.9 9.70003C15.9 9.60003 16.1 9.60004 16.3 9.60004C16.5 9.60004 16.7 9.70003 16.8 9.80003C16.9 9.90003 17 10.2 17 10.5V17.2C17 18 16.7 18.4 16.2 18.4C16 18.4 15.8 18.3 15.6 18.2C15.4 18.1 15.3 17.8 15.3 17.5Z"
                            fill="black"></path>
                    </svg>
                </span>
                <!--end::Svg Icon-->
                <input class="form-control form-control-solid ps-12 flatpickr-input" name="date" placeholder="Pick a date" id="kt_datepicker_7" type="text" readonly="readonly"  value="2022-02-06 to 2023-02-06" >
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
    <button id="id_reset_btn" type="reset" class="btn btn-light btn-active-light-primary me-8">검색조건 초기화</button>
    <button class="btn btn-primary" onclick="buyerListMgr.fn_search_btn();">검색</button>
</div>
<!--end::Card footer-->

<!--테이블 시작-->
<div class="mb-16">
    <div class="d-flex justify-content-between mb-5">
        <div class="min-w-125px mw-125px">
            <select class="form-select fs-7" data-control="select2" data-placeholder="Select an option" data-hide-search="true" id="id_select_per_page">
                <option value="20" selected>20명씩 보기</option>
                <option value="30" >30명씩 보기</option>
                <option value="50" >50명씩 보기</option>
            </select>
        </div>
        <div class="min-w-125px mw-125px">
            <select class="form-select fs-7" data-control="select2" data-placeholder="Select an option" data-hide-search="true" id="id_select_order_by">
                <option value="1" selected>최근 가입순</option>
                <option value="2" >법인명</option>
                <!-- <option value="3" >국가</option> -->
                <option value="4" >누적 주문수</option>
            </select>
        </div>
    </div>
    <table class="table table-rounded table-striped border gy-4 gs-6 shadow-sm">
        <thead>
            <tr class="fw-bold fs-6 text-gray-800 border-bottom border-gray-200 fw-bolder">
                <th>회원명</th>
                <th>내용</th>
                <th class="text-center" colspan="4">신고건수</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            
            <c:forEach var="BOARD" items="${BOARD}">
            <input type="hidden" id="bo_mem" value="${BOARD.BO_MEM}">
            <input type="hidden" id="bo_idx" value="${BOARD.BO_IDX}">
            
            <tr>
                <td><a class="user">${BOARD.BO_USER}</a></td>
                <td class="text-truncate">${BOARD.BO_CONT}</td>
                
                 <c:choose>
                <c:when test="${BOARD.COUNT != null}">
                <td class="text-center"colspan="4">                                
                ${BOARD.COUNT}
                </td>
                </c:when>
                <c:otherwise>
                <td class="text-center"colspan="4">                                
                0
                </td>
                </c:otherwise>
                </c:choose>
                
                <td>
                <fmt:formatDate value="${BOARD.BO_DATE}" pattern="yyyy-MM-dd" />
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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>

	
	let loc = document.querySelectorAll('.user'); 
	let idx = document.querySelectorAll('#bo_idx'); 
	
	for(let i=0; i < loc.length; i++){
		
		loc[i].addEventListener('click',function(){
			
			let bo_idx = idx[i].value;
			
			console.log(bo_idx);
			
			$.ajax({
			    url: "/roomie/adminBoardC.ya",
			    type: "GET",
			    
			    data: { bo_idx: bo_idx },
			    success: function(data) {
			        
			    	console.log("확인" + bo_idx);
			        window.location.href = "/roomie/adminBoardD.ya?bo_idx=" + bo_idx;
			        
			    },
			    error: function(xhr, status, error) {
			        console.error("전송 실패: " + error);
			    }
			});
			
			
		});
		
	}
	


</script>

  </body>
</html>