package com.gyull.webnovel.service.book.viewer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.book.BookRatingDTO;
import com.gyull.webnovel.mapper.book.viewer.BookViewerRatingMapper;

import lombok.Setter;

@Service
public class BookViewerRatingServiceImpl implements BookViewerRatingService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerRatingMapper mapper;
	
	@Override
	public void rating(BookRatingDTO rating) {
		mapper.rating(rating);
	}

	@Override
	public BookRatingDTO readRating(BookRatingDTO rating) {
		return mapper.readRating(rating);
	}

	@Override
	public void modifyRating(BookRatingDTO rating) {
		mapper.updateRating(rating);
	}

}
