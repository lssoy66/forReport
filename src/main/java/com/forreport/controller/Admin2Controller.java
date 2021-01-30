package com.forreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.forreport.domain.AdminCriteriaVO;
import com.forreport.domain.NoticeVO;
import com.forreport.domain.PageDTO;
import com.forreport.domain.ReviewCriteria;
import com.forreport.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class Admin2Controller {

	private NoticeService service1;

	@GetMapping("list1.fr")
	public void list(AdminCriteriaVO criteria, Model model) {
		log.info("list1");
		log.info("list1:" + service1.getNoticeListAllWithPagingAdmin(criteria));
		model.addAttribute("list1", service1.getNoticeListAllWithPagingAdmin(criteria));

		// 화면 페이지 처리를 위한 정보 전달
		model.addAttribute("pageMaker", new PageDTO(criteria, service1.getTotalCountAdmin(criteria)));
		log.info("service1.getTotalCountAdmin(criteria): " + service1.getTotalCountAdmin(criteria));
		log.info(new PageDTO(criteria, service1.getTotalCountAdmin(criteria)));
	}

	@GetMapping("/view1.fr")
	public void view(Model model, int noticenum) {

		log.info("view");
		model.addAttribute("NoticeVO", service1.get1(noticenum));

	}

	@PostMapping("/register1.fr")
	public String register(NoticeVO notice, RedirectAttributes rttr) {
		log.info("register: " + notice);
		service1.register1(notice);
		rttr.addFlashAttribute("result", notice.getNoticenum());
		return "redirect:/admin/list1.fr";

	}

	@GetMapping("/get1.fr")
	public void get(@RequestParam("noticenum") int noticenum, Model model, @ModelAttribute("cri") AdminCriteriaVO cri) {
		log.info("/get1");
		model.addAttribute("notice", service1.get1(noticenum));
	}

	@PostMapping("/modify1.fr")
	public String modify(NoticeVO notice, RedirectAttributes rttr) {
		log.info("modify:" + notice);
		if (service1.modify1(notice)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirct:/admin/list1.fr";

	}

	@PostMapping("/remove1.fr")
	public String remove(@RequestParam("noticenum") int noticenum, RedirectAttributes rttr, AdminCriteriaVO cri) {
		log.info("remove....." + noticenum);
		if (service1.remove1(noticenum)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/list1.fr";
	}
	
	

}
