/**
 * 
 */
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