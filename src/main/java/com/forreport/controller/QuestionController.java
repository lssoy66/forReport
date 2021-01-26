package com.forreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.forreport.domain.NoticeVO;
import com.forreport.domain.QuestionVO;
import com.forreport.service.QuestionService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/question/*")
@AllArgsConstructor
public class QuestionController {
	
	private QuestionService service2;
	
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service2.getList2());
	}
	
	@PostMapping
	public String register(QuestionVO question, RedirectAttributes rttr) {
		log.info("register: "+question);
		service2.register2(question);
		rttr.addFlashAttribute("result",question.getQuestionnum());
		return "redirect:/question/list";
		
	}
	
	@GetMapping("/get")
	public void get(@RequestParam("questionnum") int qeustionnum, Model model) {
		log.info("/get");
		model.addAttribute("question", service2.get2(qeustionnum));
	}
	
	@PostMapping("/modify")
	public String modify(QuestionVO question, RedirectAttributes rttr) {
		log.info("modify:"+question);
		if(service2.modify2(question)) {
			rttr.addFlashAttribute("result","success");
		}
		return "redirct:/question/list";
		
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("questionnum") int questionnum, RedirectAttributes rttr) {
		log.info("remove....."+questionnum);
		if(service2.remove2(questionnum)) {
			rttr.addFlashAttribute("result", "success");			
		}
		return "redirect:/question/list";		
	}

}






























