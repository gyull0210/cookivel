package com.gyull.webnovel.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.BookCriteria;
import com.gyull.webnovel.mapper.book.BookMapper;

import lombok.Setter;

@Service
public class BookServiceImpl implements BookService {

	@Setter(onMethod_ = {@Autowired})
	private BookMapper mapper;
	
	@Override
	public BookVO bookInfo(Integer book_idx) {
		return mapper.bookInfo(book_idx);
	}
	
	@Override
	public List<BookChapterVO> chapterNotice(Integer book_idx) {
		return mapper.chapterNotice(book_idx);
	}
	
	@Override
	public List<BookChapterVO> pagination(BookCriteria bcri) {
		return mapper.pagination(bcri);
	}

	@Override
	public int totalCount(BookCriteria bcri) {
		return mapper.totalCount(bcri);
	}
	
	@Override
	public BookChapterVO chapterRead(BookChapterVO chapter) {
		return mapper.chapterRead(chapter);
	}

}
