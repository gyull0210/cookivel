package com.gyull.webnovel.controller.book;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.pagination.BookCriteria;
import com.gyull.webnovel.domain.pagination.BookPagingDTO;
import com.gyull.webnovel.service.book.BookService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class BookController {
	
	private BookService service;
	
	@RequestMapping(value = "/book/list", method = RequestMethod.GET)
	public String book(Model model, BookCriteria bcri, Integer book_idx, String chapter_sort) {

		if(chapter_sort != null) {
			model.addAttribute("chapter_sort",chapter_sort);
		} else {
			
		}
		model.addAttribute("book_idx", bcri.getBook_idx());
		model.addAttribute("book", service.bookInfo(book_idx));
		model.addAttribute("notice", service.chapterNotice(book_idx));
		model.addAttribute("list", service.pagination(bcri));
		Integer total = service.totalCount(bcri);
		model.addAttribute("pageMaker", new BookPagingDTO(bcri, total));
		
		return "/book/list";
	}

	//이미지 경로를 만들어서 불러올 수 있는 컨트롤러
	@RequestMapping(value="/book_cover", method=RequestMethod.GET)
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String book_imgName){
		File file = new File("c:\\upload\\"+book_imgName);
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

			log.info(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
