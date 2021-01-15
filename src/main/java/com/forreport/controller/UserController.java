package com.forreport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.forreport.domain.UserVO;
import com.forreport.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/user/*")
@AllArgsConstructor
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	// 로깅을 위한 변수
//	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
//	private static final String String = null;

	// 이용 약관
	@RequestMapping("/provision.fr")
	public void provision() throws Exception {
		log.info("provision");
	}

	// 이메일 중복 체크
	@PostMapping("/emailCheck.fr")
	@ResponseBody
	public String emailCheck(String email) throws Exception {

		int result = userService.emailCheck(email);

		if (result != 0) {
			return "fail"; // 중복아이디 존재
		} else {
			return "success";
		}
	}

	// 본인 인증 (메일 발송) post
	@RequestMapping("/certification.fr")
	@ResponseBody
	public String certification(String email) throws Exception {

		// 이메일로 받는 인증코드 부분 (난수)
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;

		log.info("인증번호 = " + checkNum);

		// 이메일 발송
		String setFrom = "forreport0202@gmail.com";
		String toMail = email;
		String title = "[For Report] 회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + " 입니다." + "<br><br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

			helper.setFrom(setFrom); // 보내는사람 생략하면 정상작동을 안함
			helper.setTo(toMail); // 받는사람 이메일
			helper.setSubject(title); // 메일제목은 생략 가능
			helper.setText(content); // 메일 내용

			mailSender.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

		String num = Integer.toString(checkNum);

		return num;

	}

	// 인증번호 확인
	@RequestMapping("/certificationProcess2.fr{dice}")
	public ModelAndView join(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals)
			throws IOException {

		System.out.println("마지막 : email_injeung : " + email_injeung);

		System.out.println("마지막 : dice : " + dice);

		// 페이지이동과 데이터 전송을 동시에 하기위해 ModelAndView를 사용

		ModelAndView mv = new ModelAndView();

		mv.setViewName("/join.fr");

		mv.addObject("e_mail", email_injeung);

		if (email_injeung.equals(dice)) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함

			mv.setViewName("/join.fr{dice}");

			mv.addObject("e_mail", email_injeung);

			// 만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
			// 한번더 입력할 필요가 없게 한다.

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else if (email_injeung != dice) {

			ModelAndView mv2 = new ModelAndView();

			mv2.setViewName("/email_injeung.fr");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv2;

		}

		return mv;
	}

	// 아이디 중복 확인
	@ResponseBody
	@PostMapping("/idCheck.fr")
	public String idCheck(String id) throws Exception {
		int result = userService.idCheck(id);

		if (result != 0) {
			return "fail"; // 중복아이디 존재
		} else {
			return "success";
		}
	}

	// 회원 가입
	@RequestMapping("/join.fr")
	public String join(UserVO vo) throws Exception {
		log.info("join");

		userService.join(vo);

		return "redirect:/";
	}

}
