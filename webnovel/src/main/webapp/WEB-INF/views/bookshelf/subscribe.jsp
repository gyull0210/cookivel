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
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&Nanum+Gothic&family=Secular+One&display=swap');

body {
font-family: 'Nanum Gothic', sans-serif;
}

.container {
max-width:1052px;
}

.nav-link {
font-family: 'Noto Sans KR', sans-serif;
font-size:1.2rem;
}

.dropdown > a {
padding:0;
}

.dropdown-toggle:after {
content:none;
}

.bg-hashtag {
border:2px solid #42298f;
color:#42298f;
font-size:1rem;
font-family:'Noto Sans KR' , 'sans-serif';
}

.subNav-center {
justify-content:center;
margin:0 auto;
}

.bookmark {
color:MediumSeaGreen;
}

.bi-bookmark-fill {

}

.bi-bookmark-fill:hover {
color:darkgreen;
}
</style>
</head>
<body>
<header class="has-subNav">
<jsp:include page="../nav.inc.jsp" />
<nav class="navbar navbar-expand navbar-light">
  <div class="container">
    <a class="navbar-brand fw-bold" href="#">내 서재</a>
      <ul class="navbar-nav subNav-center me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">선호작</a>
        </li>
        <li class="nav-item" style="margin-left:28px;">
          <a class="nav-link" href="#">최근 본 작품</a>
        </li>
      </ul>
    </div>
</nav>
</header>
<main>
<div class="container mt-4">
	<div class="list-group list-group-flush">
			<div class="list-group-item"></div>			    									    				
  				<div class="list-group-item d-flex justify-content-between align-items-start pt-2">
						<div class="d-flex ms-2 me-auto">
								<div class="cover d-flex me-4">
									<a style="width:100%; height:auto;">																
										<img class="mx-auto d-block position-relative rounded" src="http://www.placehold.it/120X150">
									</a>					
								</div>
								<div class="detail flex-column">
									<div class="book-header">
										<span class="fs-lg18 fw-bold">작품 제목</span>
										<span>작가명</span>
									</div>
									<div class="fs-sm14 mb-2">장르 | 자유연재 | 총 1화</div>
									<div class="text-truncate">작품 소개하는 말</div>
									<p class="text-truncate">이어보기:회차 제목	</p>
									<small>최근 업데이트: 2022. 01. 24.</small>																										
								</div>
						</div>
						<div class="d-flex bookmark">
							<i class="d-none bi bi-bookmark fs-2"></i>
							<i class="bi bi-bookmark-fill fs-2"></i>
   						</div>  					
  				</div>
  				<div class="list-group-item pt-4">
  						<nav aria-label="Page navigation">
							<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item previous"><a class="page-link" href="${pageMaker.startPage-1}" tabindex="-1" aria-disabled="true">Previous</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}" end = "${pageMaker.endPage}">
								<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a class="page-link" href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="page-item next"><a class="page-link" href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
							</ul>
							<form id="actionForm" action="/book/series_list" method="get">
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
</body>
</html>