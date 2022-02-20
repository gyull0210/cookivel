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
<link rel="stylesheet" href="../../resources/css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container container-subNav">
    <a class="navbar-brand fw-bold" href="#">자유연재</a>
      <ul class="navbar-nav subNav-center me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item" style="margin-left:28px;">
          <a class="nav-link" href="#"></a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item">
				<div class="d-flex justify-content-between ms-2 me-auto">
					<div class="d-flex">
								<div class="cover d-flex flex-column me-4">
									<c:set var="bookCoverPath" value="/book_cover?book_imgName=${fn:replace(book.book_imgUrl, '\\\\', '/')}/${book.book_imgName}" />
									<c:if test="${book.book_imgUrl == null}">
										<div class="book-cover rounded mb-2">
											<img class="mx-auto d-block img-fluid position-relative" src="http://www.placehold.it/180X270">
										</div>																					
									</c:if>
									<c:if test="${book.book_imgUrl != null}">
										<div class="book-cover rounded mb-2">																
											<img class="mx-auto d-block img-fluid position-relative" src="${bookCoverPath}">
										</div>
									</c:if>
									<button class="btn btn-dark">첫 회차 읽기</button>					
								</div>
								<div class="detail flex-column">
									<div class="book-header">
										<span class="h4 fw-bold">${book.book_title}</span>
										<span>${book.book_writer}</span>
									</div>
									<div class="fs-sm14 mb-2">
										${book.book_genre} | ${book.book_writeType eq "free"?"자유연재":"작가연재"} | 총 ${book.book_chapters}화
									</div>
									<div class="text-truncate">작품 소개하는 말</div>
									<div>
										<span>
										<i class="fas fa-user fs-3" alt="조회수"></i> ${book.book_views}													
										</span>
										<span>
										<i class="far fa-star fs-3" alt="추천수"></i> ${book.book_rating}
										</span>
										<span>
										<i class="bi bi-chat fs-3" alt="댓글수"></i> ${book.book_comments}
										</span>						
									</div>																								
								</div>
						</div>
								<div class="d-flex bookmark">
									<i class="bi bi-bookmark fs-1"></i>
									<i class="d-none bi bi-bookmark-fill fs-1"></i>
   								</div>
						</div> 
			</div>
			<div class="list-group-item">
				<div>해시태그</div>
				<div class="gap-2">
					<a href="#"><span class="badge bg-light rounded text-dark shadow-sm">키워드</span></a>
					<a href="#"><span class="badge bg-light rounded text-dark shadow-sm">키워드</span></a>
					<a href="#"><span class="badge bg-light rounded text-dark shadow-sm">키워드</span></a>
				</div>
			</div>   									  
			<div class="list-group-item d-flex row">
				<div class="list-group list-group-flush col-md-8">
					<div class=" list-group-item chapter-notice-list">
						<div class="d-flex justify-content-between">
							<span class="fs-5">공지사항</span>
							<div>
								<a class="sort-link" href="#">더보기</a>
							</div>
						</div>						
					</div>
					<div class="list-group-item">
						22/02/12 공지사항 
					</div>
                    <div class="chapter-list-header">
						<span class="fs-5">회차목록</span>
					</div>
  				<div class="sort-header">
  					<div class="d-grid gap-2 d-flex justify-content-end">
  						<a class="sort-link" href="/book/list?book_idx=${book.book_idx}&chapter_sort=desc">최신순</a>
  						<div class="vr"></div>
  						<a class="sort-link" href="/book/list?book_idx=${book.book_idx}&chapter_sort=asc">회차순</a>
					</div>
  				</div>
  			   	<c:forEach items="${list}" var="chapter" varStatus="status">
  			   		<div class="list-group-item list-group-item-action justify-content-around">
  						<div>
  							<a class="chapter-link" href="#">
  								<c:out value="${(pageMaker.total - status.index) - ( (pageMaker.bcri.pageNum - 1) * 10)}화"/>
  								${chapter.chapter_title}
  							</a>  							
  							<div>
  								<span>
  								<fmt:parseDate value="${chapter.chapter_regDate}" var="parsedDateTime" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
								<fmt:formatDate value="${parsedDateTime}" pattern="yy. MM. dd."/>
  								</span>
  								<span><i class="fas fa-user"></i>${chapter.chapter_views}</span>
  								<span><i class="far fa-star"></i>${chapter.chapter_rating}</span>
  								<span><i class="far fa-comment"></i>${chapter.chapter_comments}</span>
  							</div>
  						</div>
  					</div>
				</c:forEach>
				<c:if test="${empty list}">
				<div class="list-group-item mb-4">
					<div class="text-center" style="color:gray">
  						<i class="fas fa-exclamation-circle fa-lg"></i><span> 게시글이 존재하지 않습니다.</span>
  					</div>
  				</div>
				</c:if>
  				<div class="list-group-item pt-4">
  					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item previous">
								<a class="page-link" href="${pageMaker.startPage-1}" tabindex="-1" aria-disabled="true">
									<i class="fa-solid fa-chevron-left"></i>
								</a>
							</li>
						</c:if>
						<c:forEach var="num" begin="${pageMaker.startPage}" end = "${pageMaker.endPage}">
								<li class="page-item ${pageMaker.bcri.pageNum == num ? "active":"" }">
									<a class="page-link" href="${num}">${num}</a>
								</li>
						</c:forEach>
						<c:if test="${pageMaker.next}">
							<li class="page-item next">
								<a class="page-link" href="${pageMaker.endPage +1 }">
									<i class="fa-solid fa-chevron-right"></i>
								</a>
							</li>
						</c:if>
						</ul>
						<form id="actionForm" action="/book/list" method="get">
							<input type="hidden" name="book_idx" value="${book_idx}">
							<input type="hidden" name="pageNum" value="${pageMaker.bcri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.bcri.amount}">
						</form>
					</nav>	
  				</div>				
				</div>
				<div class="list-group list-group-flush d-none d-md-flex col-md-4">
					<div class="card">
						<div class="card-body">
							<img class="rounded" src="http://www.placehold.it/100X100">
							<div>
							<p>자기소개</p>
							</div>
						</div>						
					</div>
					<div class="card">
						<div class="card-body">
							<img class="rounded" src="http://www.placehold.it/100X100">
							<div>
							<p>작가 작품</p>
							</div>
						</div>						
					</div>
				</div>
			</div>
	</div>	
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="../../resources/js/common.js"></script>
<script>
$(function () {

	var actionForm = $("#actionForm");
	$(".page-item a").on("click", function(e){
		e.preventDefault();
		console.log('click');
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});	
});
</script>
</body>
</html>