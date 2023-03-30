<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<!-- webSocket 세션 js -->
<link rel="js" type="text/css"
   href="resources/js/web.js">

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
                                 <c:if test="${empty MEMBER.MEM_MEDIA}">
									<img id="input_profile_image" class="profile_img" src="resources/image/icon_p.jpg" > 
								 </c:if>
								 	<img id="input_profile_image" class="profile_img"
                                 src="resources/image/${MEMBER.MEM_MEDIA }">								 
                           </div>
                           <span id="input_user_id" class="feed_name_txt">${MEMBER.MEM_NAME}</span>
                           <input type="hidden" id="mem_id" value="${MEMBER.MEM_ID}">
                           <input type="hidden" id="mem_user" value="${MEMBER.MEM_NAME}">
                           
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
                              <img id="close_modal_add_feed_place"
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