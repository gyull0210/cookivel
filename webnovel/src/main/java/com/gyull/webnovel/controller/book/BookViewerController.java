package com.gyull.webnovel.controller.book;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.service.book.BookService;
import com.gyull.webnovel.service.book.viewer.BookViewerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class BookViewerController {
	
	private BookService bookService;
	private BookViewerService service;
	
	@RequestMapping(value="/book/view", method = RequestMethod.GET)
	public String view(Model model, Integer book_idx, Integer chapter_idx) {
		BookChapterVO chapter = new BookChapterVO();
		
		chapter.setBook_idx(book_idx);
		chapter.setChapter_idx(chapter_idx);
		service.readChapter(chapter);
		model.addAttribute("chapter", service.readChapter(chapter));
		model.addAttribute("book", bookService.bookInfo(book_idx));
		model.addAttribute("list", service.chapterList(chapter));
		return "/book/view";
	}
}
