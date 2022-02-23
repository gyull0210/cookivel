package com.gyull.webnovel.service.book;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.book.BookCommentVO;
import com.gyull.webnovel.domain.pagination.BookCommentCriteria;
import com.gyull.webnovel.mapper.book.BookCommentMapper;

import lombok.Setter;

@Service
public class BookCommentServiceImpl implements BookCommentService {

	@Setter(onMethod_ = {@Autowired})
	private BookCommentMapper mapper;
	
	@Override
	public List<BookCommentVO> commentList(BookCommentCriteria bccri, Integer book_idx) {
		return mapper.commentList(bccri, book_idx);
	}

	@Override
	public int insert(BookCommentVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public BookCommentVO read(Integer bookComment_idx) {
		return mapper.read(bookComment_idx);
	}

	@Override
	public int remove(Integer bookComment_idx) {
		return mapper.delete(bookComment_idx);
	}

	@Override
	public int modify(BookCommentVO vo) {
		return mapper.update(vo);
	}

}
