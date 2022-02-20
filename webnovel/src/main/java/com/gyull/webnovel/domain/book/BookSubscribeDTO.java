package com.gyull.webnovel.domain.book;

import lombok.Data;

@Data
public class BookSubscribeDTO {

	private int subscribe_idx;
	private int member_idx;
	private int book_idx;
	private String book_title;
	private String book_writer;
	private String book_genre;
	private String book_chapters;
	private String book_intro;
	private String chapter_regDate;
}
