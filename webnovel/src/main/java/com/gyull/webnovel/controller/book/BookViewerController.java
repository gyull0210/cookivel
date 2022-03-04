package com.gyull.webnovel.controller.book;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookRatingDTO;
import com.gyull.webnovel.domain.book.BookRecentVO;
import com.gyull.webnovel.security.domain.CustomUser;
import com.gyull.webnovel.service.book.BookService;
import com.gyull.webnovel.service.book.viewer.BookViewerRatingService;
import com.gyull.webnovel.service.book.viewer.BookViewerService;
import com.gyull.webnovel.service.bookshelf.BookshelfService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class BookViewerController {
	
	private BookService bookService;
	private BookViewerService service;
	private BookViewerRatingService bookRatingService;
	private BookshelfService bookShelfService;
	
	@RequestMapping(value="/book/view", method = RequestMethod.GET)
	public String view(Model model, Integer book_idx, Authentication authentication, Integer chapter_idx) {
		BookChapterVO chapter = new BookChapterVO();
		
		chapter.setBook_idx(book_idx);
		chapter.setChapter_idx(chapter_idx);
		BookChapterVO readChapter = service.readChapter(chapter);
		service.views(chapter_idx);
		
		//로그인한 상태면 읽은 내역에 내역확인 후 없으면 추가 있으면 업데이트
		try {
			BookRatingDTO rating = new BookRatingDTO();
			BookRecentVO recent = new BookRecentVO();
			
			CustomUser user = (CustomUser)authentication.getPrincipal();
			Integer member_idx = user.getMember().getMember_idx();
			
			rating.setMember_idx(member_idx);
			rating.setBook_idx(book_idx);
			rating.setChapter_idx(chapter_idx);
			
			BookRatingDTO myRate = bookRatingService.readRating(rating);
			log.info(myRate);
			if(myRate == null) {
				model.addAttribute("rating", myRate);
			} else {
				model.addAttribute("rating", myRate);
			}
			
			recent.setMember_idx(member_idx);
			recent.setBook_idx(book_idx);
			
			log.info(recent);
			int historyCount = bookShelfService.readHistoryOfReading(recent);
			log.info("historyCount:"+historyCount);
			if(historyCount == 0) {
				recent.setChapter_idx(chapter_idx);
				recent.setChapter_title(readChapter.getChapter_title());
				bookShelfService.createHistoryOfReading(recent);
			} else {
				recent.setChapter_idx(chapter_idx);
				recent.setChapter_title(readChapter.getChapter_title());
				bookShelfService.updateHistoryOfReading(recent);
			}
		
		} catch(Exception e) {
			e.printStackTrace(); log.error(e);
		}
		
		model.addAttribute("chapter", readChapter);
		model.addAttribute("book", bookService.bookInfo(book_idx));
		model.addAttribute("list", service.chapterList(chapter));
		
		return "/book/view";
	}
	
	@RequestMapping(value="/book/view/rating", method = RequestMethod.POST)
	public void rating(Model model, Authentication authentication, BookRatingDTO rating) {
		
		CustomUser user = (CustomUser)authentication.getPrincipal();
		Integer member_idx = user.getMember().getMember_idx();
		
		rating.setMember_idx(member_idx);
		
		BookRatingDTO myRate = bookRatingService.readRating(rating);
		
		if(myRate == null) {
			bookRatingService.rating(rating);
		} else {
			bookRatingService.modifyRating(rating);
		}
	}
}
