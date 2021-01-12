package com.forreport.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forreport.domain.IdPronumVO;
import com.forreport.service.CartService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cart/*")
@AllArgsConstructor
public class CartController {
	
	private CartService service;
	
	@GetMapping("cartList.fr")
	public void cartList(Model model) {
		log.info("CartListController");
		// 아이디는 세션에서 가져온다
		model.addAttribute("cartProductList", service.getCartList("user3"));
	}
	
	// {"id":aa,"pronum":10} :: JSON 형식으로
	@PostMapping(value = "writeProcess.fr", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> writeCart(@RequestBody IdPronumVO cart) {
		log.info("writeCartController");
		// 아이디는 세션에서 가져온다
		int result = service.addCart(cart);
		
		if(result == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	
}
