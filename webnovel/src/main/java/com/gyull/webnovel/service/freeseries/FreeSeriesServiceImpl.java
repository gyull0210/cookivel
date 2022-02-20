package com.gyull.webnovel.service.freeseries;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.book.BookVO;
import com.gyull.webnovel.domain.pagination.Criteria;
import com.gyull.webnovel.mapper.freeseries.FreeSeriesMapper;

import lombok.Setter;

@Service
public class FreeSeriesServiceImpl implements FreeSeriesService {

	@Setter(onMethod_ = {@Autowired})
	private FreeSeriesMapper mapper;
	
	@Override
	public List<BookVO> pagination(Criteria cri) {
		return mapper.pagination(cri);
	}

	@Override
	public int totalCount(Criteria cri) {
		return mapper.totalCount(cri);
	}

}
