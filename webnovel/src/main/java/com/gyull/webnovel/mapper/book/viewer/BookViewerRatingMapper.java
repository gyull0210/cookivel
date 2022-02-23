package com.gyull.webnovel.mapper.book.viewer;

import com.gyull.webnovel.domain.book.BookRatingDTO;

public interface BookViewerRatingMapper {
	
	public void rating(BookRatingDTO rating); //별점 등록
	
	public BookRatingDTO readRating(BookRatingDTO rating); //별점 읽기
	
	public void updateRating(BookRatingDTO rating); //별점 수정
}
