package com.gyull.webnovel.domain.book;

import java.time.LocalDateTime;

import lombok.Data;
/**
 * 회차 별점
 * 
 * @author mkht0
 *
 */
@Data
public class BookRatingDTO {
	
	private int bookRating_idx;
	private int member_idx;
	private int book_idx;
	private int chapter_idx;
	private int chapter_rate;
	private LocalDateTime br_regDate;
}
