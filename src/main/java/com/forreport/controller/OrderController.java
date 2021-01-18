package com.forreport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forreport.domain.IdPronumVO;
import com.forreport.domain.ProductVO;
import com.forreport.service.CartService;
import com.forreport.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {

	private OrderService service;
	
	// 주문 페이지 출력(사용자가 선택한 상품의 정보를 화면에 표시)
	@PostMapping("order.fr")
	public void orderList(@RequestParam("id") String id, 
			@RequestParam("checkPronum") String[] checkPronum, 
			@RequestParam("price") int price,
			Model model) {
		//log.info(service.getCartProduct(id, checkPronum));
		model.addAttribute("price", price);
		model.addAttribute("orderProductList", service.getCartProduct(id, checkPronum));
	}
	
	@GetMapping(value = "complete", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> TestAmount(Long amount){
		log.info("amount :: " + amount);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	
}







