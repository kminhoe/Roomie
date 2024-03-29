<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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

    /* input type date */
input[type="date"]::-webkit-clear-button {
	display: none;
}

input[type="date"]::-webkit-inner-spin-button {
	display: none;
}

input[type="date"]::-webkit-calendar-picker-indicator {
	color: #2c3e50;
}

input[type="date"] {
	appearance: none;
	-webkit-appearance: none;
	color: #95a5a6;
	font-family: "Helvetica", arial, sans-serif;
	font-size: 18px;
	border: 1px solid #ffffff;
	background: #999286;
	padding: 5px;
	display: inline-block !important;
	visibility: visible !important;
	text-align: center;
	width: 200px;
	margin: 10px;
	margin-top: 15px;
}

input[type="date"], focus {
	color: #ffffff;
	box-shadow: none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
}
  </style>
  <body>

    <header class="navbar navbar-muted sticky-top flex-md-nowrap p-0 shadow" style="background-color: #d3d3d3; height: 50px;">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">Company name</a>
  <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <input class="form-control form-control-muted w-100 rounded-0 border-0" type="text" placeholder="Search" aria-label="Search">
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
        <h1 class="h2">게시물 관리</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
          <div class="btn-group me-2">
          </div>

        </div>
      </div>


       <!--begin::Row-->
       <div class="row gy-5 g-xl-8">
        <div class="card-title fw-bold text-dark d-flex justify-content-between">
            <h3 class="ps-4">게시물정보</h3>
            <a href="" class="btn btn-light border border-gray-300 bg-white py-2 px-10">목록</a>
        </div>
        <div class="py-0 mt-0 align-items-center">
            <table class="table table-row-bordered border border-sliver-400 table-row-sliver-300 gy-2">
                <tr class="fw-bolder fs-6 text-sliver-800 border-sliver-400">
                    <th class=" ps-5 w-150px" style="background-color: #EDE9DA;">회원이름</th>
                    <td class="w-350px">${BOARD.BO_USER}</td>
                    <th class="ps-5 w-150px" style="background-color: #EDE9DA;">이메일</th>
                    <td class="id_info w-350px">${BOARD.BO_ID}</td>
                </tr>
                <tr class="fw-bolder fs-6 text-sliver-800 border-sliver-400">
                    <th class=" ps-5 w-150px" style="background-color: #EDE9DA;">이미지</th>
                    <td class="w-350px">
                    <img class="feed_img" style="height: 478px;" src="resources/files/board/${BOARD.BO_MEDIA}" />
                    </td>
                </tr>
                <tr class="fw-bolder fs-6 text-sliver-800 border-sliver-400">
                    <th class=" ps-5 w-150px" style="background-color: #EDE9DA;">내용</th>
                    <td class="w-350px">${BOARD.BO_CONT }</td>
                </tr>

                <tr>
                    <th class=" ps-5 w-150px" style="background-color: #EDE9DA;">좋아요</th>
                    <td class="w-350px">${LIKE.COUNT}</td>
                    <th class=" ps-5 w-150px" style="background-color: #EDE9DA;">신고건수</th>
                    <td class="w-350px">${COUNT}</td>
                </tr>
            </table>
            <div style="text-align: right;" >
        </div>
        </div>
    </div>
    <!--end::Row-->
    <BR>
     

        <!--begin::Row-->
    <div class="row gy-5 g-xl-8 mt-10">
        <div class="card-title fw-bold text-dark">
            <h3 class="ps-4">신고 내역</h3>
        </div>
        <div class="d-flex justify-content-between mt-0 mb-4">
            <div>
                <a id="warn_btn" class="btn btn-light border border-gray-300 bg-white py-2 px-10 me-3">경고 처리</a>
                <a id="nothing" class="btn btn-light border border-gray-300 bg-white py-2 px-10">해당없음</a>
            </div>
        
        </div>
        <div id="rep" class="py-0 mt-0 align-items-center">
            <table class="table table-row-bordered border border-gray-400 gy-2 gs-7">
                <thead>
                    <tr class="border border-gray-400 text-center text-gray-800 fs-6 fw-bolder" style="background-color: #EDE9DA;">
                        <th class="ps-3">
                        </th>
                        <th>번호</th>
                        <th>처리 상태</th>
                        <th>신고일시</th>
                        <th>신고타입</th>
                        <th>신고사유</th>
  
                    </tr>
                    
                   
                    <c:forEach var="REPORT" items="${REPORT}">

                    <tr style="text-align: center;">
                 
                        <th class="ps-3">
                            <div class="form-check form-check-custom form-check-solid justify-content-center">
                                <!-- <input class="form-check-input" type="checkbox" value="1"> -->
                                <input class="form-check-input" type="checkbox" value="1" data-kt-check="true" data-kt-check-target=".widget-9-check">
                            </div>
                        </th>
                        <input type="hidden" id="rep_idx" value="${REPORT.REP_IDX}"/>
                        <th>${REPORT.RN}</th>
                        <th>${REPORT.REP_STATUS}</th>
                        <th><fmt:formatDate value="${REPORT.REP_DATE}" pattern="yyyy-MM-dd" /></th>
                        <th>${REPORT.REP_TYPE}</th>
                        <th>${REPORT.REP_CONT}</th>
                          
                    </tr>
                    </c:forEach>
                  
                    
                </thead>
                <tbody id="id_report_body">
                    
                </tbody>
            </table>
            <ul class="pagination">
                
                <li class="page-item previous disabled"><a href="#" class="page-link"><i class="previous"></i></a></li>
                

                

                
                <li class="page-item next disabled"><a href="#" class="page-link"><i class="next"></i></a></li>
                
            </ul>
        </div>
    </div>
    <!--end::Row-->
           
           
 
    </main>
  </div>
</div>

    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
  
  <script>
$(document).ready(function() {
    
    var rep_idx = [];
    
    $('input[type="checkbox"]').click(function() {
        if($(this).prop("checked") == true){
            var currentRepIdx = $(this).closest("tr").find("#rep_idx").val();
            rep_idx.push(currentRepIdx);
           
        } else {
            var currentRepIdx = $(this).closest("tr").find("#rep_idx").val();
            rep_idx = $.grep(rep_idx, function(value) {
                return value != currentRepIdx;
            });
            
        }
        
        //체크박스를 클릭 하고 버튼 클릭 시
        $("#warn_btn").click(function() {
            console.log(rep_idx);
            
            $.ajax({
			    url: "/roomie/warning.ya",
			    type: "POST",
			    data: { rep_idx: rep_idx },
			    success: function(data) {
			        
			    	location.reload();
                   
			        
			    },
			    error: function(xhr, status, error) {
			        console.error("전송 실패: " + error);
			    }
			});
            
            
        });
        
        $("#nothing").click(function() {
            console.log(rep_idx);
            
            $.ajax({
			    url: "/roomie/nothing.ya",
			    type: "POST",
			    data: { rep_idx: rep_idx },
			    success: function(data) {
			        
			    	location.reload();
			        
			    },
			    error: function(xhr, status, error) {
			        console.error("전송 실패: " + error);
			    }
			});
            
            
        });
        
        
    });
    
    
    
});

</script>
  
  </body>
</html>