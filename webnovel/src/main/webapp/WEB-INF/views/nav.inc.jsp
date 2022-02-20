<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
<nav class="navbar navbar-light primary-nav d-none d-lg-flex">
  <div class="container navbar-expand">   
    <a class="navbar-brand me-2" href="/">
    <img class="logo mb-1" src="${pageContext.request.contextPath}/resources/img/cookivel.png">
    </a>
    <ul class="navbar-nav me-auto mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="/freeSeries/list">자유연재</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">작가연재</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">이벤트</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">리뷰게시판</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/bookshelf/subscribe">내 서재</a>
        </li>
    </ul>
    <%-- <c:if test="${member == null}"> --%>
    <sec:authorize access="isAnonymous()">
    <div class="justify-content-end gap-2">
    	<button class="btn btn-outline-secondary" type="button" onclick="location.href='/login'">로그인</button>
    	<button class="btn btn-primary" type="button">회원가입</button>
    </div>
    </sec:authorize>
    <%-- </c:if> --%>
    <%-- <c:if test="${member != null}"> --%>
    <sec:authorize access="isAuthenticated()">
    <div class="d-flex justify-content-end align-items-center">
 	    <button class="btn fs-4" type="button">
 	    	<i class="bi bi-search"></i>
 	    </button>	    	
      	<div class="dropdown">
  			<a class="btn dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    			<img class="rounded-circle" src="http://www.placehold.it/48X48" alt="프로필사진">${member.mem_nickName}    			
  			</a>
  			<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuLink">
  				<li><a class="dropdown-item" href="#">
  				<sec:authentication property="principal.member.mem_nickName"/>
  				</a></li>
  				<li><a class="dropdown-item" href="/">홈</a></li>
  				<li><a class="dropdown-item" href="/bookshelf/subscribe">내 서재</a></li>
    			<li><a class="dropdown-item" href="/storyRoom/storyList">내 작품 관리</a></li>
    			<li><hr class="dropdown-divider"></li>
    			<li>
    			<a class="dropdown-item" href="/">
    			알림
    			<span class="badge rounded-pill bg-danger">1</span>
    			</a>   			
    			</li>
    			<li><a class="dropdown-item" href="/qna/qna_list">포인트</a></li>
    			<li><a class="dropdown-item" href="/qna/qna_list">1대1고객센터</a></li>
    			<li><a class="dropdown-item" href="/setting">설정</a></li>
				<li><hr class="dropdown-divider"></li>
				<li><a class="dropdown-item" href="/">공지사항</a></li>
				<li><a class="dropdown-item" href="/admin/dashboard">관리자페이지</a></li>

				<li><a class="dropdown-item" href="/logout">로그아웃</a></li>							
  			</ul>
		</div>		
      </div>
      </sec:authorize> 
      <%-- </c:if> --%>
    </div>
</nav>
<nav class="navbar navbar-light mobile-nav d-none">
	<div class="container">
    	<button class="btn list-toggle" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvas" aria-controls="offcanvas">
        <span class="navbar-toggler-icon"></span>
    	</button>
    	<div class="mobile-logo-header">
			<a class="navbar-brand" href="/">
    			<img class="mobile-logo mb-1" src="${pageContext.request.contextPath}/resources/img/cookivel.png">
    		</a>
    	</div>
	</div>
	<div class="container">
		<ul class="navbar-nav navbar-expand flex-row me-auto px-3">
        	<li class="nav-item">
         	 	<a class="nav-link" href="/freeSeries/list">자유</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="/premium/list">작가</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="/event">이벤트</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="/review">리뷰</a>
        	</li>
        	<li class="nav-item">
          		<a class="nav-link" href="/bookshelf/subscribe">내 서재</a>
        	</li>
    	</ul>
	</div>
</nav>
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvas" aria-labelledby="offcanvas">
  <div class="offcanvas-header">
    <div class="offcanvas-title" id="offcanvas">
    <c:if test="${member == null }">
    	<div>
    	<img class="rounded-circle" src="http://placehold.it/48X48">
    	<span>로그인 후 이용해주세요</span>
    	</div>
    </c:if>
    <c:if test="${member != null }">
    	<div>
    	<img class="rounded-circle" src="http://placehold.it/48X48">
    	<span>${member.mem_nickName}님 안녕하세요</span>
    	</div>
    </c:if>	   		
    </div>    
    <button type="button" class="btn-close text-reset me-2" data-bs-dismiss="offcanvas" aria-label="Close"></button>    	
  </div>
  <div class="offcanvas-body">
    <div class="list-group list-group-flush">
      	<div class="list-group-item">
			<a class="nav-link" href="#">작품 관리</a>
		</div>
		<div class="list-group-item">
			<a class="nav-link" href="#">내 서재</a>
		</div>
		<div class="list-group-item">
			<a class="nav-link" href="#">포인트</a>
		</div>
		<div class="list-group-item">
			<a class="nav-link" href="#">설정</a>
		</div>
		<div class="list-group-item">
			<a class="nav-link" href="#">공지사항</a>
		</div>
		<div class="list-group-item">
			<a class="nav-link" href="#">고객센터</a>
		</div>
    </div>
  </div>
</div>