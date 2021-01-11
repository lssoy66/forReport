package com.forreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
		log.info("CartList");
		model.addAttribute("cart", service.getCartList("user3"));
	}
	
	
	
}
