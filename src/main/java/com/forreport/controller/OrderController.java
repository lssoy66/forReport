package com.forreport.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forreport.domain.IdPronumVO;
import com.forreport.domain.OrderVO;
import com.forreport.domain.PageDTO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.ReviewCriteria;
import com.forreport.domain.VbankVO;
import com.forreport.service.CartService;
import com.forreport.service.OrderService;
import com.forreport.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/order/*")
@AllArgsConstructor
public class OrderController {

	private OrderService service;
	private ProductService productService;
	
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
	
	// 결제 API 테스트
	@GetMapping(value = "complete", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	@ResponseBody
	public ResponseEntity<String> TestAmount(Long amount){
		log.info("amount :: " + amount);
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	// 주문 테이블에 데이터 저장
	// 결제 완료 = 주문 테이블 저장이므로 장바구니 삭제도 동시에
	@PostMapping("orderProcess.fr")
	public String orderProcess(OrderVO order, Model model) {
		// 뷰 페이지로 전달해야 하는 것 : 주문정보테이블의 정보, 총 결제금액, 주문한 상품리스트, 가상계좌 정보, 주문자 정보
		log.info(order);
		model.addAttribute("priceAll", order.getPayprice());
		
		int result = service.addOrder(order);
		log.info(result);
		
		// 해당 사용자의 주문내역 중, 오늘 날짜인 것을 전달
		List<OrderVO> orderList = service.getOrderList(order.getId());
		SimpleDateFormat dataformat = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < orderList.size(); i++) {
			if(dataformat.format(orderList.get(i).getOrderdate()).equals(dataformat.format(new Date()))) {
				log.info(orderList.get(i));
				if(order.getPronum() == orderList.get(i).getPronum()) {
					model.addAttribute("order", orderList.get(i));
				}
			}
		}
		
		// 상품리스트를 전달
		String[] pronumArr = new String[order.getPronumList().size()];
		for(int i = 0; i < order.getPronumList().size(); i++) {
			pronumArr[i] = order.getPronumList().get(i).toString();
		}	
		model.addAttribute("productList", service.getCartProduct(order.getId(), pronumArr));
		
		// 가상계좌정보를 전달
		model.addAttribute("vbank", service.getVbank(order.getId()));
		
		return result > 0 ? "order/orderSuccess" : null;
	}
	
	// 내 정보 - 주문리스트 페이지
	@GetMapping("myOrderList.fr")
	public void myOrderList(Model model, Principal principal) {
//		log.info(principal.getName());
//		log.info(service.getOrderList(principal.getName()));
		model.addAttribute("orderList", service.getOrderList(principal.getName()));
		log.info(service.getVbank(principal.getName()));
		model.addAttribute("vbank", service.getVbank(principal.getName()));
	}
	
	// 내 정보 - 판매리스트 페이지
	@GetMapping("mySaleList.fr")
	public void mySaleList(Model model, Principal principal) {
		List<ProductVO> list = productService.getProductById(principal.getName());
		model.addAttribute("saleList", list);
		// mapper에서 판매리스트를 가져올 때 인덱스/힌트를 사용해 정렬 
		// + tbl_order 테이블에서 해당 상품의 판매 수(count) 구해 전달
	}
	
}







