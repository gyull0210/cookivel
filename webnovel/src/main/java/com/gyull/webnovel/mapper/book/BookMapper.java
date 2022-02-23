package com.gyull.webnovel.mapper.book;

import java.util.List;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.BookCriteria;

public interface BookMapper {
	
	public BookVO bookInfo(Integer book_idx); //책 정보
	
	public List<BookChapterVO> chapterNotice(Integer book_idx); //공지사항 리스트

	public List<BookChapterVO> pagination(BookCriteria bcri); //회차 페이지네이션
	
	public int totalCount(BookCriteria bcri); //총 회차
	
	public BookChapterVO chapterRead(BookChapterVO chapter); //챕터 읽기 (추후 삭제)
}
