package com.forreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forreport.domain.UserVO;
import com.forreport.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	UserService userService;

	// 이용 약관 get
	@GetMapping("/provision.fr")
	public void getProvision() throws Exception {
		log.info("get provision");
	}

	// 이용 약관 post
	@PostMapping("/provision.fr")
	public String postProvision(UserVO vo) throws Exception {
		log.info("post provision");

		userService.join(vo);

		return "redirect:/user/join.fr";
	}

	// 회원 가입 get
	@GetMapping("/join.fr")
	public void getJoin() throws Exception {
		log.info("get join");
	}

	// 회원 가입 post
	@PostMapping("/join.fr")
	public String postJoin(UserVO vo) throws Exception {
		log.info("post join");

		userService.join(vo);

		return null;

	}
}
