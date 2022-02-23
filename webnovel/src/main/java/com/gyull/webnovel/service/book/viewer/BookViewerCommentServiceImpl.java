package com.gyull.webnovel.service.book.viewer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.book.BookCommentVO;
import com.gyull.webnovel.mapper.book.viewer.BookViewerCommentMapper;

import lombok.Setter;

@Service
public class BookViewerCommentServiceImpl implements BookViewerCommentService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerCommentMapper mapper;
	
	@Override
	public List<BookCommentVO> CommentPagination(BookCommentVO comment) {
		return mapper.CommentPagination(comment);
	}
	
	@Override
	public int totalCommentCount(BookCommentVO comment) {
		return mapper.totalCommentCount(comment);
	}

	@Override
	public int createComment(BookCommentVO comment) {
		return mapper.insertComment(comment);
	}

	@Override
	public BookCommentVO readComment(BookCommentVO comment) {
		return mapper.readComment(comment);
	}

	@Override
	public int removeComment(BookCommentVO comment) {
		return mapper.deleteComment(comment);
	}

	@Override
	public int like(BookCommentVO comment) {
		return mapper.like(comment);
	}

	@Override
	public int deleteLike(BookCommentVO comment) {
		return mapper.deleteLike(comment);
	}

}
