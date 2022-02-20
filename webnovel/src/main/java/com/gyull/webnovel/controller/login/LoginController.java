package com.gyull.webnovel.controller.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gyull.webnovel.domain.member.MemberVO;
import com.gyull.webnovel.security.domain.CustomUser;
import com.gyull.webnovel.service.login.LoginService;
import com.gyull.webnovel.service.member.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
public class LoginController {
	
	private LoginService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		log.info(error);
		log.info(logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		
		if(logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
		return "/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) {
			
		HttpSession session = request.getSession();

		MemberVO login = service.login(vo);
		
		if(login == null) {			
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",false);
		return "login";
		} else {
			session.setAttribute("member", login);
			//service.recentLogin(vo);
			return "redirect:/";
		}
	}

}
