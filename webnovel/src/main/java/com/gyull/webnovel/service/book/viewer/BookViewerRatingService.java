package com.gyull.webnovel.service.book.viewer;

import com.gyull.webnovel.domain.book.BookRatingDTO;

public interface BookViewerRatingService {

	public void rating(BookRatingDTO rating); //별점 등록
	
	public BookRatingDTO readRating(BookRatingDTO rating); //별점 읽기
	
	public void modifyRating(BookRatingDTO rating); //별점 수정
}
