package com.gyull.webnovel.mapper.book;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gyull.webnovel.domain.book.BookCommentVO;
import com.gyull.webnovel.domain.pagination.BookCommentCriteria;

public interface BookCommentMapper {

	public List<BookCommentVO> commentList(@Param("bccri") BookCommentCriteria bccri, @Param("book_idx") Integer book_idx);
	
	public int insert(BookCommentVO vo);
	
	public BookCommentVO read(Integer bookComment_idx);
	
	public int delete(Integer bookComment_idx);
	
	public int update(BookCommentVO vo);

}
