package com.gyull.webnovel.service.book;

import java.util.List;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.BookCriteria;

public interface BookService {
	
	public BookVO bookInfo(Integer book_idx);
	
	public List<BookChapterVO> chapterNotice(Integer book_idx);
	
	public List<BookChapterVO> pagination(BookCriteria bcri);
	
	public int totalCount(BookCriteria bcri);
	
	public BookChapterVO chapterRead(BookChapterVO chapter);

}
