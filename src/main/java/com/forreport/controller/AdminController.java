package com.forreport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forreport.domain.PageDTO;
import com.forreport.domain.ReviewCriteria;
import com.forreport.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	OrderService orderService;
	
	// 관리자 주문리스트 관리
	@GetMapping("orderList.fr")
	public void adminTestPage(ReviewCriteria criteria, Model model) {
		log.info("controller ~ start orderList");
		log.info(criteria);
		log.info(criteria.getKeywordDay());
		
		// 페이징 처리 된 주문 목록 전달
		model.addAttribute("orderList", orderService.getOrderListAllWithPaging(criteria));
		
		// 화면 페이지 처리를 위한 정보 전달
		model.addAttribute("pageMaker", new PageDTO(criteria, orderService.getTotalCount(criteria)));
	}
	
}
