package com.gyull.webnovel.mapper.book.viewer;

import java.util.List;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookRatingDTO;
import com.gyull.webnovel.domain.book.BookRecentVO;

public interface BookViewerMapper {
	
	public BookChapterVO readChapter(BookChapterVO chapter); //읽기
	
	public List<BookChapterVO> chapterList(BookChapterVO chapter); //목록

	public int views(Integer chapter_idx); //조회 수 증가
	
	public void updateRate(BookRatingDTO rating); //챕터 별점 평균 업데이트
	
	public int totalRateCount(BookRatingDTO rating); //챕터 별점 참여자 수

}
