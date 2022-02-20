package com.gyull.webnovel.domain.book;

import java.time.LocalDateTime;

import lombok.Data;
/**
 * 책 댓글
 * 좋아요만 가능
 * 수정/삭제 가능
 * @author mkht0
 *
 */
@Data
public class BookCommentVO {

	private int bookComment_idx;
	private int member_idx;
	private String mem_nickName;
	private String bc_comment;
	private int bc_like;
	private LocalDateTime bc_regDate;
	private LocalDateTime bc_recentDate;
	
}
