package com.gyull.webnovel.service.book.viewer;

import java.util.List;

import com.gyull.webnovel.domain.book.BookChapterVO;

public interface BookViewerService {

	public BookChapterVO readChapter(BookChapterVO chapter); //읽기
	
	public List<BookChapterVO> chapterList(BookChapterVO chapter); //목록

	public int views(Integer chapter_idx); //조회 수 증가
}
