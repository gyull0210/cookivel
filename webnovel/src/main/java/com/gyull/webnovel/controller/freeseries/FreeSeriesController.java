package com.gyull.webnovel.controller.freeseries;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gyull.webnovel.domain.pagination.Criteria;
import com.gyull.webnovel.domain.pagination.PaginationDTO;
import com.gyull.webnovel.service.freeseries.FreeSeriesService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class FreeSeriesController {
	
	private FreeSeriesService service;
	
	@RequestMapping(value = "/freeSeries/list", method = RequestMethod.GET)
	public String freeSeries(Model model, Criteria cri, String sort) {
		
		model.addAttribute("list", service.pagination(cri));

		Integer total = service.totalCount(cri);
		model.addAttribute("pageMaker", new PaginationDTO(cri, total));
		
		return "/freeSeries/list";
	}
}
