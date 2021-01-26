package com.forreport.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forreport.domain.PageDTO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.ReviewCriteria;
import com.forreport.domain.SearchingVO;
import com.forreport.service.OrderService;
import com.forreport.service.ProductService;

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
	
	@Setter(onMethod_ = @Autowired)
	ProductService productService;
	
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
	
	// 관리자 상품리스트 관리
	@GetMapping("productList.fr")
	public void adminProduct(SearchingVO searchingVO, Model model) {
		
		log.info("adminProduct");
		log.info("criteria.getPageNum(): " + searchingVO.getPageNum());
		log.info("criteria.getAmount(): " + searchingVO.getAmount());
		log.info("criteria.getApproval(): " + searchingVO.getApproval());		
		
		log.info("productList: " + productService.getProductListWithPagingInAdmin(searchingVO));
		log.info(new PageDTO(searchingVO, productService.getTotal(searchingVO)));
		
		// 페이징 처리된 상품 목록 전달
		model.addAttribute("productList", productService.getProductListWithPagingInAdmin(searchingVO));

		// 화면 페이지 처리를 위한 정보 전달
		model.addAttribute("pageMaker", new PageDTO(searchingVO, productService.getTotal(searchingVO)));

		// 승인 여부 전달 -> 999는 전체 승인, 0 미승인, 1 승인, 2 승인 거부, 3 삭제 요청
		model.addAttribute("approval", searchingVO.getApproval());
				
		// form:form 객체에서 사용하기 위한 productVO 보내기
		model.addAttribute("productVO", new ProductVO());
	}
	
	/* 넘어온 list들 중 id가 change인 경우 approval 수정 */
	//@ResponseBody
	@PostMapping(value="approvalProcess.fr")
	@Transactional
	public String approvalProcess(ProductVO productVO, int approval){
		
		log.info("approvalProcess...");
		log.info("approvalProcess ProductVO: " + productVO);
		log.info("길이: " + productVO.getProductVOList().size());
		 
		for(int i = 0; i<productVO.getProductVOList().size(); i++) {
			if(productVO.getProductVOList().get(i).getId().equals("change")) {
				productService.updateApproval(productVO.getProductVOList().get(i));
			}
		}
		
		
		return "redirect:/admin/productList.fr?approval="+approval;
		
	}
	
}
