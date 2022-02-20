package com.gyull.webnovel.service.freeseries;

import java.util.List;

import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.Criteria;

public interface FreeSeriesService {

	public List<BookVO> pagination(Criteria cri);
	
	public int totalCount(Criteria cri);
}
