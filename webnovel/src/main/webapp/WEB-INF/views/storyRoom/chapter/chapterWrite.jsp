<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회차관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://kit.fontawesome.com/f31fa860a2.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="../../resources/css/common.css">
</head>
<body>
<header class="has-subNav">
<jsp:include page="../../nav.inc.jsp"/>
<nav class="navbar navbar-expand navbar-light">
  <div class="container">
      <a class="navbar-brand fw-bold" href="#">회차등록</a>
      <div class="navbar-nav">
        <div class="nav-item">
          <button class="btn nav-link" type="button" onclick="history.go(-1)">취소</button>
        </div>
        <div class="nav-item" style="margin-left:28px;">
          <button id="publish" class="btn nav-link" type="submit">발행</button>
        </div>
      </div>
    </div>
</nav>
</header>
<main>
	<div class="container">
		<div>
			<input type="hidden" name="book_title" value="${book_title}">
			<input type="hidden" name="chapter_title">
			<input type="hidden" name="chapter_content">
			<div class="card-body" style="margin-bottom:10px;">
				<div class="row mb-3">
  					<label for="title" class="col-form-label col-sm-2 pt-0">작품 이름</label>
    					<div class="col-sm-10">
      						<h5 id="title">${book_title}</h5>
    					</div>
  				</div>
				<div class="row mb-3">
  					<label for="category" class="col-form-label col-sm-2 pt-0">카테고리</label>
    					<div class="col-sm-10">
      						<select id="category" class="form-select" name="chapter_category">
								<option value="공지">공지사항</option>
								<option value="연재" selected>연재</option>
							</select>
    					</div>
  				</div>
  				<div class="row mb-3">
  					<label for="isHidden" class="col-form-label col-sm-2 pt-0">공개여부</label>
    					<div class="col-sm-10">
      						<div class="form-check">
        						<input class="form-check-input" type="checkbox" id="isHidden" name="chapter_isHidden" value="N">
        						<label class="form-check-label" for="isHidden">
          							비밀글
        						</label>
      					</div>
    				</div>
  				</div>
			</div>
			<div class="card-body">
				<!-- <input id="title" class="form-control form-control-lg" type="text" maxlength="30" placeholder="제목을 입력하세요"> -->
				<h3 id="chapterTitle" contenteditable="true" maxlength="30" placeholder="제목을 입력하세요"></h3>
				<div id="editor"></div>
				<p style="color: #aaa;" id="counter">공백포함 0 / 최대 25000자</p>
				<p style="color: #aaa;" id="counter-blank">공백미포함 0 / 최대 25000자</p>
			</div>
		</div>
	</div>
</main>
<footer>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/32.0.0/balloon/ckeditor.js"></script>
<script>
$(function () {
$(window).resize(function() {
let primaryNav = $(".primary-nav");
let mobileNav = $(".mobile-nav");
	if(window.innerWidth < 992){
		primaryNav.css("display","none");
		mobileNav.removeClass("d-none");
		}else{
			primaryNav.css("display","flex");
			mobileNav.addClass("d-none");
		}
	})
})
</script>
<script>
	let editor;
	BalloonEditor
    .create( document.querySelector( '#editor' ),{
    	language:'ko',
    	removePlugins: [ 'outdent', 'indent'],
    	toolbar: [ 'bold', 'italic','BlockQuote', 'undo', 'redo' ],
    	placeholder: '내용을 입력하세요'
    } )
    .then( editor => {
    	const content = editor;
    	console.log()
    	$('.ck-content').keyup(
    			function(e) {
    				$( "input[name='chapter_content']" ).val(content.getData());
    				console.log("[chapter_content "+"val] : "+ $("input[name='chapter_content']").val());
    			});
    } )
    .catch( error => {
        console.error( error );
    } );
</script>
<script>	
		$("[contenteditable='true'][maxlength]").on(
				'keyup paste',
				function(event) {
					var cntMaxLength = parseInt($(this).attr('maxlength'));

					if ($(this).text().length >= cntMaxLength
							&& event.keyCode != 8 && event.keyCode != 37
							&& event.keyCode != 38 && event.keyCode != 39
							&& event.keyCode != 40) {

						event.preventDefault();

						$(this).html(function(i, currentHtml) {
							return currentHtml.substring(0, cntMaxLength - 1);
						});
					}
				});

		$('.ck-content').keyup(
				function(e) {
					var content = $(this).text();
					var redex = /\s/ig;
					var extrablank = $(this).text().replace(redex, "");

					$('#counter').html(
							"공백포함 " + content.length + " / 최대 25000자");
					$('#counter-blank').html(
							"공백미포함 " + extrablank.length + " / 최대 25000자");

					if (content.length > 25000) {
						$(this).text(content.substring(0, 25000));
						$('#counter').html("공백포함 25000 / 25000 자");

						if (extrablank.length > 25000) {
							$(this).text(extrablank.substring(0, 25000));
							$('#counter-blank').html("공백미포함 25000 / 25000 자");
							alert("최대 25000자까지 입력 가능합니다.");
						}
					}
				});
	</script>
	<script>
	$('#chapterTitle').keyup(
			function(e) {
				var title = $(this).text();
				  $("input[name=chapter_title]").val(title);
				  console.log(title);
				  console.log("[chapter "+"val] : "+ $("input[name='chapter_title']").val());
			});
	
	</script>
	<script>
	
	//비공개여부 체크 값 변경
    $('#isHidden').on("click", function(){
    	if($('#isHidden').is(':checked') == true){
        	$('#isHidden').val("Y");
        } else if($('#isHidden').is(':checked') != true){
        	$('#isHidden').val("N");
        }
    	
    })
    
    $("#publish").on("click", function(){   	
		let formData = new FormData();		
		
		let bookIdx = '<c:out value="${book_idx}"/>';
		let bookTitle = '<c:out value="${book_title}"/>';
		let chapterTitle = $("input[name='chapter_title']");
		let chapterCategory = $("#category");
		let chapterIsHidden = $("input[name='chapter_isHidden']");
		let chapterContent = $("input[name='chapter_content']");

		formData.append("book_idx", bookIdx);
		formData.append("book_title", bookTitle);
		formData.append("chapter_title", chapterTitle.val());
		formData.append("chapter_category", chapterCategory.val());
		formData.append("chapter_isHidden", chapterIsHidden.val());
		formData.append("chapter_content", chapterContent.val());

 		$.ajax('/storyRoom/chapter/chapterWrite', {
 			
       		method: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function () {
            	alert('업로드 성공');
            	location.href="/storyRoom/chapter/list?book_idx=<c:out value='${book_idx}'/>";
            },
            error: function () {
            	alert('업로드 실패');
            },
		}); 
	
});
	</script>
</body>
</html>