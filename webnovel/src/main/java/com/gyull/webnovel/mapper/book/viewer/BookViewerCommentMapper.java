package com.gyull.webnovel.mapper.book.viewer;

import java.util.List;

import com.gyull.webnovel.domain.book.BookCommentVO;

public interface BookViewerCommentMapper {
	
	public List<BookCommentVO> CommentPagination(BookCommentVO comment); //댓글 목록
	
	public int totalCommentCount(BookCommentVO comment); //댓글 수
	
	public int insertComment(BookCommentVO comment); //댓글 등록
	
	public BookCommentVO readComment(BookCommentVO comment); //댓글 읽기
	
	public int deleteComment(BookCommentVO comment); //댓글 삭제
	
	public int totalLikeCount(BookCommentVO comment); //추천 수
	
	public int like(BookCommentVO comment); //댓글 추천
	
	public int deleteLike(BookCommentVO comment); //댓글 추천 취소
}
