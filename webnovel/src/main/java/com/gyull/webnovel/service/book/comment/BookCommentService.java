package com.gyull.webnovel.service.book.comment;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gyull.webnovel.domain.book.BookCommentVO;
import com.gyull.webnovel.domain.pagination.BookCommentCriteria;

public interface BookCommentService {

	public List<BookCommentVO> commentList(@Param("bccri") BookCommentCriteria bccri, @Param("book_idx") Integer book_idx);

	public int insert(BookCommentVO vo);
	
	public BookCommentVO read(Integer bookComment_idx);
	
	public int remove(Integer bookComment_idx);
	
	public int modify(BookCommentVO vo);
}
