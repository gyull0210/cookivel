package com.gyull.webnovel.domain.book;

import lombok.Data;

@Data
public class BookHashtagVO {

	private int hashtag_idx;
	private int book_idx;
	private String tag_name;
}
