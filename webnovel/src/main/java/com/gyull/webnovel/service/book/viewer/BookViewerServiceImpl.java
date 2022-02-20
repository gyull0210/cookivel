package com.gyull.webnovel.service.book.viewer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.mapper.book.viewer.BookViewerMapper;

import lombok.Setter;

@Service
public class BookViewerServiceImpl implements BookViewerService {

	@Setter(onMethod_ = {@Autowired})
	private BookViewerMapper mapper;
	
	
}
