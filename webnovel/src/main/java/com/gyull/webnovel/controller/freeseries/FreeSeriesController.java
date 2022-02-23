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

	@RequestMapping(value = "/freeSeries/recentBook", method = RequestMethod.GET)
	public String recentBook(Model model, Criteria cri) {
		
		model.addAttribute("list", service.pagination(cri));

		Integer total = service.totalCount(cri);
		model.addAttribute("total", total);
		model.addAttribute("pageMaker", new PaginationDTO(cri, total));
		
		return "/freeSeries/recentBook";
	}

	@RequestMapping(value = "/freeSeries/finishedBook", method = RequestMethod.GET)
	public String finishedBook(Model model, Criteria cri) {
		
		model.addAttribute("list", service.finishedPagination(cri));

		Integer total = service.finishedCount(cri);
		model.addAttribute("total", total);
		model.addAttribute("pageMaker", new PaginationDTO(cri, total));
		
		return "/freeSeries/finishedBook";
	}
}
