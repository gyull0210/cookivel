<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키블</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css"/>
<link rel="stylesheet" href="../resources/css/common.css">
</head>
<body>
<header>
<jsp:include page="nav.inc.jsp" />
</header>
<main style="margin-top:60px">
<div class="container">
<div class="swiper" style="margin-top:60px">
  <!-- Additional required wrapper -->
  <div class="swiper-wrapper">
    <!-- Slides -->
    <div class="swiper-slide">
    	<img src="http://www.placehold.it/120X150">
    </div>
    <div class="swiper-slide">
    	<img src="http://www.placehold.it/120X150">
    </div>
    <div class="swiper-slide">
    	<img src="http://www.placehold.it/120X150">
    </div>
    <div class="swiper-slide">
    	<img src="http://www.placehold.it/120X150">
    </div>
    <div class="swiper-slide">
    	<img src="http://www.placehold.it/120X150">
    </div>
    <div class="swiper-slide">
    	<img src="http://www.placehold.it/120X150">
    </div>
  </div>

  <!-- If we need navigation buttons -->
  <div class="swiper-button-prev"></div>
  <div class="swiper-button-next"></div>

  <!-- If we need scrollbar -->
  <div class="swiper-scrollbar"></div>
</div>
</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script>
const swiper = new Swiper('.swiper', {
	  // Optional parameters
	  direction: 'horizontal',
	  loop: false,
	  preloadImages: true,
	  slidesPerView: 6,

	  // Navigation arrows
	  navigation: {
	    nextEl: '.swiper-button-next',
	    prevEl: '.swiper-button-prev',
	  },

	  // And if we need scrollbar
	  scrollbar: {
	    el: '.swiper-scrollbar',
	  },
	  
/* 	  breakpoints: { 
		  320: { slidesPerView: 'auto'},
		  568: { slidesPerView: 3} 
	  }, */
	});
</script>
</body>
</html>