package com.gyull.webnovel.controller.bookshelf;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookshelfController {

	@RequestMapping(value = "/bookshelf/subscribe", method = RequestMethod.GET)
	public String bookshelf(Model model) {
		return "/bookshelf/subscribe";
	}
}
