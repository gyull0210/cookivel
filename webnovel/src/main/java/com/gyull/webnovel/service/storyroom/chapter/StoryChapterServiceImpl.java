package com.gyull.webnovel.service.storyroom.chapter;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gyull.webnovel.domain.book.BookChapterVO;
import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.StoryChapterCriteria;
import com.gyull.webnovel.mapper.storyroom.StoryRoomMapper;
import com.gyull.webnovel.mapper.storyroom.chapter.StoryChapterMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class StoryChapterServiceImpl implements StoryChapterService {

	@Setter(onMethod_ = {@Autowired})
	private StoryChapterMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	private StoryRoomMapper storyRoomMapper;
	
	@Override
	public BookVO bookInfo(Integer book_idx) {
		return mapper.bookInfo(book_idx);
	}
	
	@Override
	public List<BookChapterVO> pagination(StoryChapterCriteria sccri) {
		return mapper.pagination(sccri);
	}
	
	@Override
	public List<BookChapterVO> noticePagination(StoryChapterCriteria sccri){
		return mapper.noticePagination(sccri);
	}

	@Override
	public int totalCount(StoryChapterCriteria sccri) {
		return mapper.totalCount(sccri);
	}
	
	@Override
	public int totalNoticeCount(StoryChapterCriteria sccri) {
		return mapper.totalNoticeCount(sccri);
	}

	//회차 등록 메소드
	@Transactional
	@Override
	public void create(BookChapterVO chapter) {
		try {
			Integer book_idx = chapter.getBook_idx();
			
			if(chapter.getChapter_category().equals("연재")) {
				
				storyRoomMapper.bookChapterUpdate(book_idx);
				mapper.create(chapter);
				storyRoomMapper.bookChaptersUp(book_idx);
				
			} else {
				
				storyRoomMapper.bookChapterUpdate(book_idx);
				mapper.create(chapter);
			}
		
		} catch(Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
		
	}

	@Override
	public BookChapterVO read(BookChapterVO chapter) {
		return mapper.read(chapter);
	}

	@Override
	public void modify(BookChapterVO chapter) {
		mapper.modify(chapter);
	}

	//회차 삭제 메소드
	@Transactional
	@Override
	public void delete(BookChapterVO chapter) {
		try {
			Integer book_idx = chapter.getBook_idx();
			BookChapterVO vo = mapper.read(chapter);
			
			if(vo.getChapter_category().equals("연재")) {
				storyRoomMapper.bookChapterUpdate(book_idx);			
				mapper.delete(chapter);
				storyRoomMapper.bookChaptersDown(book_idx);	
				
			} else {
				mapper.delete(chapter);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			log.error(e.getMessage());
		}
      
	}

}
