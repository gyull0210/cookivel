package com.gyull.webnovel.domain.book;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.gyull.webnovel.domain.book.BookVO;

import lombok.Data;
/**
 * 책
 * 
 * 책 회차수, 책 조회수, 책 별점, 책 댓글 수는 @see BookChapterVO 의 합계
 * @author mkht0
 *
 */
@Data
public class BookVO {

	private int book_idx;
	private int member_idx;
	
	private String book_title;
	private String book_writer;
	private String book_genre;
	private String book_writeType;
	private int book_chapters; //총 회차 수
	private String book_intro;

	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime book_regDate = LocalDateTime.now();
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime book_recentDate = LocalDateTime.now();
	private String book_state;
	private String book_isHidden;

	//책 조회수, 별점, 댓글 수
	private int book_views;
	private int book_rating;
	private int book_comments;
	
	//책 표지 이미지
	private String book_imgName;
	private String book_imgUrl;
	private String book_imgThumbUrl;
	private String book_imgUuid;

}