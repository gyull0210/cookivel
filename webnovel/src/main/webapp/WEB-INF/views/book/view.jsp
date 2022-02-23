<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${book.book_title}</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../resources/css/common.css">
<style>
.star {
    position: relative;
    color: #ddd;
    white-space:nowrap;
  }
  
.star input {
    width: 100%;
    height: 100%;
    position: absolute;
    left: 0;
    opacity: 0;
    cursor: pointer;
}
  
.star-fill {
    width: 0;
    position: absolute; 
    left: 0;
    color:gold;
    overflow: hidden;
    pointer-events: none;
    white-space:nowrap;

}
</style>
</head>
<body>
<header class="has-subNav bg-white fixed-top">
<nav id="viewerTop" class="navbar navbar-expand navbar-light" style="padding:0.2rem">
  <div class="container container-subNav">
        <div class="nav-item">
          <a class="view-link" href="/book/list?book_idx=${chapter.book_idx}">
          	<i class="bi bi-chevron-left fs-4"></i>
          </a>
        </div>
        <div class="nav-item">
          <div class="d-flex">
             <a id="prevBtn" class="view-link" href="/book/view?book_idx=${chapter.book_idx}&chapter_idx=<c:out value='${chapter.prev}'/>" style="padding:0.7rem 1rem">
               <i class="bi bi-caret-left-fill"></i>
             </a>
             <div class="text-center">
               <div>
                 <span class="fw-bold" style="font-size:18px">${chapter.book_title}</span>
               </div>
               <div>
                 <span style="font-size:0.9rem">${chapter.chapter_title}</span>
               </div>
             </div>
             <a id="nextBtn" class="view-link" href="/book/view?book_idx=${chapter.book_idx}&chapter_idx=<c:out value='${chapter.next}'/>" style="padding:0.7rem 1rem">
             	<i class="bi bi-caret-right-fill"></i>
             </a>
          </div>

        </div>
        <div class="nav-item">
          <a class="view-link" href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasRight" aria-controls="offcanvasRight">
          	<i class="fa-solid fa-bars fa-lg"></i>
          </a>
        </div>
    </div>
</nav>
</header>
<main>
<div class="container mt-4" style="padding-top:50px; padding-bottom:50px; max-width:1000px">
	<div class="list-group list-group-flush">
			<div class="viewerMenu"></div>
			<div class="list-group-item" style="margin:1rem 2rem">
				<div class="mb-4">
				<b>${chapter.chapter_title}</b>
				</div>
				<div>${chapter.chapter_content}</div>
			</div> 									  
	</div>	
</div>
</main>
<footer class="has-Nav bg-white fixed-bottom">
	<nav id="viewerBtm" class="navbar navbar-light">
		<div class="container justify-content-start">
			<button id="rating" class="btn" data-bs-toggle="modal" data-bs-target="#bookRating">
				<i class="far fa-star fa-lg"></i> 별점
			</button>
			<button id="comment" class="btn" data-bs-toggle="modal" data-bs-target="#bookComment">
				<i class="far fa-comment fa-lg"></i> 댓글
			</button>
		</div>
	</nav>
</footer>
<!-- 별점 등록 -->
<div class="modal fade" id="bookRating" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookCommentLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookCommentLabel">별점 주기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    	<div>
    	평점 7.5/10점 (154명 참여)
    	</div>
    	<div class="d-flex justify-content-center align-items-center">
    	<span class="star">
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    	<span class="star-fill">	
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    		<i class="fa-solid fa-star fa-2x"></i>
    	</span>
    	<input id="rate" type="range" value="1" step="1" min="0" max="10">    		
    	</span>   	
    	</div>
	  </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
<!-- 댓글 목록 -->
<div class="modal fade" id="bookComment" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="bookCommentLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookCommentLabel">댓글 목록</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="list-group list-group-flush">
  			<div class="list-group-item d-flex">
  				<div class="me-2" style="flex-basis:64px;">
    				<img class="rounded-circle" src="https://www.place-hold.it/64X64">
  				</div>
  				<div class="d-flex flex-column" style="width:100%">
    				<textarea class="form-control mb-3" placeholder="댓글을 입력하세요"></textarea>
    				<div class="d-flex justify-content-end mb-2">
    					<button class="btn btn-primary" type="submit">댓글 등록</button>
    				</div>    				
  				</div>
			</div>
			<div class="list-group-item">
				<div class="d-flex justify-content-end">
					<a href="">공감순</a>
					<a href="">최신순</a>
				</div>
			</div>
			<div class="list-group-item">
    			<div class="d-flex justify-content-between align-items-start">
    				<div class="me-2">
    					<img class="rounded-circle" src="https://www.place-hold.it/48X48">
    				</div>
    				<div class="ms-2 me-auto">
    					<div class="d-flex justify-content-between">
      						<div class="fw-bold">아무개닉네임</div>
    						<span>
    						<a href="#"><i class="bi bi-x-lg"></i></a>
    						</span>      					
      					</div>
      						<div>
      							잘 읽었습니다!      						
      						</div>
      						<div>
      							<button class="btn btn-outline-secondary btn-sm">댓글</button>
      						</div>
    					</div>
    				<div>
    				    <i class="bi bi-hand-thumbs-up fs-5"></i>
    				</div>
    			</div>
  			</div>
  			<div class="list-group-item">
  			</div>  			
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- 회차 목록 -->
<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-header">
    <div id="offcanvasRightLabel">
    	<h5>${chapter.book_title}</h5>
    	<span>총 ${book.book_chapters}화</span>
    </div>
    <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div class="list-group list-group-flush">
    <c:set value="${list}" var="len" />
    <c:forEach items="${list}" var="list" varStatus="status">
    	<div class="list-group-item list-group-item-action">
    		<c:out value="${fn:length(len) - status.index}화"/>
    		<a href="/book/views?book_idx=${list.book_idx}&chapter_idx=${list.chapter_idx}">${list.chapter_title}</a>
		</div>
	</c:forEach>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../resources/js/common.js"></script>
<script>
$(document).ready(function () {
	
	$(".viewerMenu").on("click", function(){
		let stateTop = $("#viewerTop").css("display");
		let stateBtm = $("#viewerBottom").css("display");
		
		if(stateTop != "none" && stateBtm != "none"){
			$("#viewerTop").css("display","none");
			$("#viewerBtm").css("display", "none");
		} else {				
			$("#viewerTop").css("display", "flex");
			$("#viewerBtm").css("display", "flex");
		}

	})
})	
</script>
<script>
$(document).ready(function () {
	$("input[type=range]").change(function (e){
		const drawStar = 
		    $('.star-fill').css("width", $("input[type=range]").val() * 10+"%");	
		})
	}) 
	
$(document).ready(function () {
		let prev = '<c:out value="${chapter.prev}" />'
		let next = '<c:out value="${chapter.next}" />'
		
		if(prev == 0){
			$("#prevBtn").removeAttr("href");
		}
		
		if(next == 0){
			$("#nextBtn").removeAttr("href");
		}
	})
</script>
</body>
</html>