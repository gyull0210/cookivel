package com.gyull.webnovel.controller.book;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.gyull.webnovel.domain.book.BookCommentVO;
import com.gyull.webnovel.domain.pagination.BookCommentCriteria;
import com.gyull.webnovel.domain.pagination.BookCriteria;
import com.gyull.webnovel.service.book.comment.BookCommentService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/comment/")
@RestController
@Log4j
@AllArgsConstructor
public class BookCommentController {
	
	private BookCommentService service;	
	
	@PostMapping(value="/create",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody BookCommentVO comment){
		
		int insertCount = service.insert(comment);
		
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{book_idx}/{page}",
			produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
	public ResponseEntity<List<BookCommentVO>> commentList(@PathVariable("book_idx")Integer book_idx, @PathVariable("page")Integer page){
		
		BookCommentCriteria bccri = new BookCommentCriteria(page, 10, book_idx, null);
		
		return new ResponseEntity<>(service.commentList(bccri, book_idx), HttpStatus.OK);
	}

//	@GetMapping(value="/pages/{book_idx}/{page}",
//			produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE })
//	public ResponseEntity<BookCommentVO> comment(@PathVariable("bookComment_idx") bookComment_idx){
//		
//		return new ResponseEntity<>(service.comment(bookComment_idx), HttpStatus.OK);
//	}
	
	@PutMapping(value = "/{bookComment_idx}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(@RequestBody BookCommentVO vo, @PathVariable("bookComment_idx") Integer bookComment_idx){
		vo.setBookComment_idx(bookComment_idx);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value="/{bookComment_idx}", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("bookComment_idx") Integer bookComment_idx){
		
		return service.remove(bookComment_idx) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
