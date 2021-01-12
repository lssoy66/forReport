package com.forreport.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/login/*")
public class CommonController {
	// admin.jsp를 처리하기 위한 클래스(626)
	// '/accessError'라는 URI으로 접근 제한시 보이는 화면을 처리한다.

	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("접근 제한되었습니다. : " + auth);
		model.addAttribute("msg", "Access Denied");
		
	}
	// (631) CustomLogin(메서드 추가)
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if(error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}
		if(logout != null) {
			model.addAttribute("logout", "Logouted!!!");
		}
		
	}
	// (640) Logout
	@GetMapping("/customLogout")
	public void logoutGet() {
		log.info("custom logout");
	}
}
