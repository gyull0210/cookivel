package com.gyull.webnovel.mapper.freeseries;

import java.util.List;

import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.Criteria;

public interface FreeSeriesMapper {

	public List<BookVO> pagination(Criteria cri);

	public List<BookVO> finishedPagination(Criteria cri);
	
	public int totalCount(Criteria cri);
	
	public int finishedCount(Criteria cri);
}
