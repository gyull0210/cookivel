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
</head>
<body>
<header class="has-subNav">
<jsp:include page="../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container container-subNav">
    <a class="navbar-brand fw-bold" href="/freeSeries/list">자유연재</a>
  </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item">
				<div class="d-flex justify-content-between align-items-start ms-2 me-auto">
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
									<button class="btn btn-dark" type="button">첫 회차 읽기</button>					
								</div>
								<div class="d-flex detail flex-column">
									<div class="d-flex justify-content-between">
										<div class="d-flex flex-column">
											<div class="book-header">
												<span class="h2 fw-bold">${book.book_title}</span>
												<span class="h5">${book.book_writer}</span>
											</div>
											<div class="mb-2">
											${book.book_genre} | ${book.book_writeType eq "free"?"자유연재":"작가연재"}
											</div>
											<div class="mb-2">
												총 ${book.book_chapters}화
											</div>
										</div>
										<div class="d-flex flex-column">
											<span class="bookmark">
												<i class="bi bi-bookmark fs-1"></i>
												<i class="d-none bi bi-bookmark-fill fs-1"></i>
											</span>																
										</div>							
									</div>
									<div class="d-flex flex-column justify-content-between">
										<div class="book-intro-text">
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										작품 소개하는 말
										</div>
										<div class="d-flex justify-content-end align-items-end pt-2">
											<span class="me-2">
												<i class="fas fa-user fs-2" alt="조회수"></i> ${book.book_views}													
											</span>
											<span class="me-2">
												<i class="far fa-star fs-2" alt="추천수"></i> ${book.book_rating}
											</span>
										</div>
									</div>																																		
								</div>
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
			<div class="list-group-item chapter-notice-list">
				<div class="d-flex justify-content-between">
						<span class="fs-5">공지사항</span>
						<div>
							<a class="sort-link" href="#">더보기</a>
						</div>
					</div>						
				</div>
				<c:forEach items="${notice}" var="notice">
				<div class="list-group-item position-relative">
					<span class="me-2">
					<fmt:parseDate value="${notice.chapter_regDate}" var="parsedNoticeDateTime" pattern="yyyy-MM-dd'T'HH:mm" type="both"/>
					<fmt:formatDate value="${parsedNoticeDateTime}" pattern="yy. MM. dd."/> 
					</span>
					<a class="stretched-link" href="#">${notice.chapter_title}</a>
				</div>				
				</c:forEach>
				<c:if test="${empty notice}">
				<div class="list-group-item mb-4">
					<div class="text-center" style="color:gray">
  						<i class="fas fa-exclamation-circle fa-lg"></i><span> 공지사항이 아직 없습니다.</span>
  					</div>
  				</div>
				</c:if>  									  
			<div class="chapter-list-header">
				<span class="fs-5">회차목록</span>
			</div>
  			<div class="sort-header">
  			<div class="d-grid gap-2 d-flex justify-content-end">
  				<a class="sort-link" href="<c:url value='/book/list?book_idx=${book.book_idx}&chapter_sort=desc'/>">최신순</a>
  				<div class="vr"></div>
  				<a class="sort-link" href="<c:url value='/book/list?book_idx=${book.book_idx}&chapter_sort=asc'/>">회차순</a>
			</div>
  			</div>
  			   	<c:forEach items="${list}" var="chapter" varStatus="status">
  			   		<div class="list-group-item list-group-item-action justify-content-around position-relative">
  						<div>
  							<a class="chapter-link stretched-link" href="/book/view?book_idx=${chapter.book_idx}&chapter_idx=${chapter.chapter_idx}">
  							<c:choose>
  								<c:when test="${chapter_sort eq 'desc'}">
  								<c:out value="${(pageMaker.total - status.index) - ( (pageMaker.bcri.pageNum - 1) * 10)}화"/>
  								</c:when>
  								<c:when test="${chapter_sort eq 'asc'}">
  								<c:out value="${(status.index+1) + ( (pageMaker.bcri.pageNum - 1) * 10)}"/>화
  								</c:when>
  								<c:when test="${chapter_sort == '' or chapter_sort == null}">
  								<c:out value="${(pageMaker.total - status.index) - ( (pageMaker.bcri.pageNum - 1) * 10)}화"/>
  								</c:when>
  							</c:choose>
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
  			<div class="list-group-item pt-4" style="border-bottom:none;">
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
						<form id="actionForm" action="/book/list?" method="get">
							<input type="hidden" name="book_idx" value="${book_idx}">
							<input type="hidden" name="chapter_sort" value="${pageMaker.bcri.chapter_sort}">
							<input type="hidden" name="pageNum" value="${pageMaker.bcri.pageNum}">
							<input type="hidden" name="amount" value="${pageMaker.bcri.amount}">
						</form>
					</nav>	
  			</div>
  			<div class="chapter-list-header">
				<span class="fs-5">댓글목록</span>				
			</div>
  			<div class="sort-header">
  			<div class="d-grid gap-2 d-flex justify-content-end">
  				<a class="sort-link" href="<c:url value='/book/list?book_idx=${book.book_idx}&chapter_sort=desc'/>">추천순</a>
  				<div class="vr"></div>
  				<a class="sort-link" href="<c:url value='/book/list?book_idx=${book.book_idx}&chapter_sort=asc'/>">최신순</a>
			</div>
			</div>			
			<div class="list-group-item">
				<div class="list-group list-group-flush">
					<div class="list-group-item">
						댓글					
					</div>
					<div class="list-group-item">
					댓글
					</div>
				</div>
			</div>  			
  			</div>
  			<div class="list-group list-group-flush d-none d-md-flex col-md-4">
				<div class="card">
				  <div class="card-header">
				  작가의 다른 작품
				  </div>
                  <div class="card-body d-flex align-items-start">                      
                      <div class="ms-2 me-2">
                         <a href="#">
                          	<img src="https://via.placeholder.com/80X100">                          
                         </a>
                      </div>
                      <div>
                         <div>
                           작품제목<br>
                           장르 연재 회차
                         </div>
                         <div>
                            작품내용
                         </div>
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
<script src="../resources/js/common.js"></script>
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
<script>
$(".bookmark").on("click", function(){
	alert("구독기능은 로그인 후 이용해주세요");
})
</script>
</body>
</html>