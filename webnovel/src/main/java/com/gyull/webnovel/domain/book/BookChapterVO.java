package com.gyull.webnovel.domain.book;

import java.time.LocalDateTime;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;
/**
 * 책 회차페이지
 * 회차 카테고리에 공지사항인지 연재글인지 체크
 * 회차마다 책제목과 회차제목 모두 표시
 * 회차별 조회수, 평가점수, 댓글 수 체크
 * @author mkht0
 *
 */
@Data
public class BookChapterVO {

	private int chapter_idx;
	private int member_idx;
	private int book_idx;
	private String book_title;
	private String chapter_category;
	private String chapter_title;
	private String chapter_content;
	
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime chapter_regDate = LocalDateTime.now();
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime chapter_recentDate = LocalDateTime.now();
	private int chapter_views;
	private int chapter_rating;
	private int chapter_comments;
	
	private String chapter_isHidden;	
	
	//페이지 이전, 다음
	private int prev;
	private int next;
}
