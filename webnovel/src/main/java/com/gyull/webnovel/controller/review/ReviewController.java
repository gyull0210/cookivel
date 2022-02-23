package com.gyull.webnovel.controller.review;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class ReviewController {

	@RequestMapping(value = "/review/list", method = RequestMethod.GET)
	public String review(Model model) {
		
		return "/review/list";
	}
}
