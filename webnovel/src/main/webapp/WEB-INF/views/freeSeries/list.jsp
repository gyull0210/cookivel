<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <a class="navbar-brand fw-bold" href="#">자유연재</a>
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">최근 등록된 작품</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">완결작</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item d-flex justify-content-between">
			<form>
				<select class="form-select">
					<option>장르</option>
					<option>판타지</option>
					<option>현대판타지</option>
					<option>무협</option>
					<option>로맨스</option>
					<option>로맨스판타지</option>
					<option>BL</option>
					<option>GL</option>
				</select>
			</form>
				<div>
					<a>최신순</a>
					<a>조회순</a>
					<a>추천순</a>
				</div>
			</div>
			<c:forEach items="${list}" var="book">			    									   				
				<div class="list-group-item d-flex justify-content-between align-items-start pt-2">
						<div class="d-flex ms-2 me-auto">
								<div class="cover d-flex me-4">
									<a style="width:100%; height:auto;">
									<c:set var="bookCoverPath" value="/book_cover?book_imgName=${fn:replace(book.book_imgUrl, '\\\\', '/')}/${book.book_imgName}" />
									<c:if test="${book.book_imgUrl == null}">
									<div class="rounded">
										<img class="mx-auto d-block position-relative" src="http://www.placehold.it/120X180">
									</div>																					
									</c:if>
									<c:if test="${book.book_imgUrl != null}">
									<div class="rounded" style="width:120px;height:180px">																
										<img class="mx-auto d-block img-fluid position-relative" src="${bookCoverPath}">
									</div>
									</c:if>
									</a>					
								</div>
								<div class="detail flex-column">
									<div class="book-header">
										<a class="book-title-link move" href="${book.book_idx}">
											<span class="fs-lg18 fw-bold">${book.book_title}</span>
										</a>
										<span>${book.book_writer}</span>
									</div>
									<div class="fs-sm14 mb-2">${book.book_genre} | ${book.book_state} | 총 ${book.book_chapters}화</div>
									<div class="text-truncate">${book.book_intro}</div>
									<div class="gap-2">
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
									</div>
									<div>
										<span>
										<i class="fas fa-user" alt="조회수"></i> ${book.book_views}													
										</span>
										<span>
										<i class="far fa-star" alt="추천수"></i> ${book.book_rating}	
										</span>						
									</div>																								
								</div>
						</div> 					
  				</div>
  				</c:forEach>
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
								<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item next">
									<a class="page-link" href="${pageMaker.endPage +1 }">
										<i class="fa-solid fa-chevron-right"></i>
									</a>
								</li>
							</c:if>
							</ul>
							<form id="actionForm" action="/freeSeries/list" method="get">
								<input type="hidden" name="sort" value="${pageMaker.cri.sort}">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
								<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
							</form>
						</nav>	
  				</div>
	</div>	
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function () {

	var actionForm = $("#actionForm");
	$(".page-item a").on("click",function(e) {
	e.preventDefault();
	console.log('click');
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
});

$(".move").on("click",function(e) {
e.preventDefault();

$("#book_idx").remove();
actionForm.append("<input type='hidden' id='book_idx' name='book_idx' value='"+ $(this).attr("href")+ "'>");
actionForm.attr("action","/book/list");
$("input[name='pageNum']").val($(this).attr("href")).remove();
$("input[name='amount']").val($(this).attr("href")).remove();
actionForm.submit();
$("#book_idx").remove();
actionForm.prop("action","/freeSeries/list");
})

});
</script>
</body>
</html>