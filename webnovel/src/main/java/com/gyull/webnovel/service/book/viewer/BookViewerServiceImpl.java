package com.gyull.webnovel.service.book.viewer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.mapper.book.viewer.BookViewerMapper;

import lombok.Setter;

@Service
public class BookViewerServiceImpl implements BookViewerService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerMapper mapper;
	
	public BookChapterVO readChapter(BookChapterVO chapter) {
		return mapper.readChapter(chapter);
	}
	
	public List<BookChapterVO> chapterList(BookChapterVO chapter){
		return mapper.chapterList(chapter);
	}

	public int views(Integer chapter_idx) {
		return mapper.views(chapter_idx);
	}
}
