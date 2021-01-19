package com.forreport.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forreport.domain.PageDTO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.ReviewVO;
import com.forreport.domain.SearchingVO;
import com.forreport.service.ProductService;
import com.forreport.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;

	/* 각 페이지별로 조건(키워드, 카테고리)과 페이지 번호에 맞는 게시글 출력 */
	@GetMapping("list.fr")
	public void productPage(SearchingVO searchingVO, Model model) {
		
		int total = productService.getTotal(searchingVO);
		
		PageDTO pageDTO = new PageDTO(searchingVO, total);
		
		System.out.println(pageDTO);
		
		List<ProductVO> productList = productService.getProductListWithPaging(searchingVO);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);		
		
	}
	
	/* 댓글을 제외한 전체 상품 상세 뷰 살펴보기 -> 댓글은 ReviewController + Ajax를 이용해 확인 가능*/
	@GetMapping("view.fr")
	public void productView(int pronum, Model model) {
		
		ProductVO productVO = productService.getProduct(pronum);
		
		System.out.println(productVO);
						
		model.addAttribute("productVO", productVO);
	}
	
	/* 상품 등록 전 규정 및 주의사항 */
	@GetMapping("agree.fr")
	public void productUploadAgree() {
		
	}
	
	/* 상품 등록 관련 내용 작성*/
	@GetMapping("write.fr")
	public void productWrite() {
		
	}
	
	/* 상품 등록 진행*/
	@PostMapping("write.fr")
	public void productUpload() {
		
	}
	
}