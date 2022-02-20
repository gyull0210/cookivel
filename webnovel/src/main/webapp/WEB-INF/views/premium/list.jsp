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
border:2px solid MediumBlue;
color:MediumBlue;
font-size:0.8rem;
font-family:'Noto Sans KR' , 'sans-serif';
}

.bg-gray {
background-color:#F2F3F4;
}

.fs-sm14 {
font-size:0.9rem;
}

.fs-lg18 {
font-size:1.1rem;
}

.container-subNav {
max-width:1000px;
}

.subNav-center {
justify-content:center;
margin:0 auto;
}

.bookmark {
color:MediumSeaGreen;
}

.bi-bookmark:hover:before {
color:MediumSeaGreen;
content:'\f199';
}

.bi-bookmark:focus:before {
color:SeaGreen;
content:'\f199';
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
  <div class="container container-subNav">
    <a class="navbar-brand fw-bold" href="#">작가연재</a>
      <ul class="navbar-nav subNav-center me-auto">
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
				<div class="list-group-item d-flex justify-content-between align-items-start pt-2">
						<div class="d-flex ms-2 me-auto">
								<div class="me-4">
									<div style="width:120px; height:150px;">
										<img class="mx-auto d-block img-fluid rounded" src="http://www.placehold.it/120X150">
									</div>					
								</div>
								<div class="flex-column">
								<div>
									<span class="fs-lg18 fw-bold">작품 제목</span>
									<span>작가명</span>
								</div>
									<div class="fs-sm14 mb-2">장르 | 자유연재 | 총 1화</div>
									<div class="text-truncate">작품 소개하는 말</div>
									<div>
									<span>
										<small>조회수</small> ${10}															
										<small>추천수</small> ${10}
									</span>
									</div>
									<div class="d-none d-md-flex gap-2">
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
									</div>
									<small>최근 업데이트: 2022. 01. 24.</small>																										
								</div>
						</div> 					
  				</div>
  				<div class="list-group-item d-flex justify-content-between align-items-start pt-2">
						<div class="d-flex ms-2 me-auto">
								<div class="me-4">
									<div style="max-width:120px; max-height:150px;">
										<a style="width:100%; height:100%;">																
										<img class="mx-auto d-block img-fluid rounded" src="http://www.placehold.it/120X150">
										</a>
									</div>					
								</div>
								<div class="flex-column">
								<div>
									<span class="fs-lg18 fw-bold">작품 제목</span>
									<span>작가명</span>
								</div>
									<div class="fs-sm14 mb-2">장르 | 자유연재 | 총 1화</div>
									<div class="text-truncate">작품 소개하는 말</div>
									<div class="d-none d-md-flex gap-2">
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
										<span class="badge bg-gray rounded text-dark">키워드</span>
									</div>
									<div>
									<span>
										<small>조회수</small> ${10}															
										<small>추천수</small> ${10}
										<small>최근 업데이트: 2022. 01. 24.</small>	
									</span>
									</div>																																		
								</div>
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