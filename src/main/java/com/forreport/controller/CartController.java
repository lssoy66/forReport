package com.forreport.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	// 장바구니 리스트
	@GetMapping("cartList.fr")
	public void cartList(Model model) {
		log.info("CartListController");
		// 아이디는 세션에서 가져온다(현재 임의로 작성함!)
		model.addAttribute("cartProductList", service.getCartList("user3"));
	}

	// 장바구니 추가 :: JSON 형식({"id":"aa","pronum":10})으로
	@PostMapping(value = "writeProcess.fr", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> writeCart(@RequestBody IdPronumVO cart) {
		log.info("writeCartController");
		// 아이디는 세션에서 가져온다
		int result = service.addCart(cart);

		if (result == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 장바구니 항목 삭제 :: JSON 형식으로
	@PostMapping(value = "deleteProcess.fr", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> deleteCart(@RequestBody IdPronumVO cart) {
		log.info("deleteCartController");
		// 아이디는 세션에서 가져온다
		int result = service.deleteCartProduct(cart);

		if (result == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 장바구니 항목 전체 삭제
	@DeleteMapping(value = "deleteAllProcess.fr/{id}", produces = { MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public ResponseEntity<String> deleteCartAll(@PathVariable("id") String id) {
		log.info("deleteCartAllController");
		// 아이디는 세션에서 가져온다
		int result = service.deleteCartAll(id);
		log.info(result);

		if (result > 0) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
