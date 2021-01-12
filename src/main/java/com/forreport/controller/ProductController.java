package com.forreport.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.support.HttpRequestHandlerServlet;

import com.forreport.domain.PageDTO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;
import com.forreport.service.ListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	private ListService listService;

	/*
	 *	검색 후 리스트 출력(주로 메인페이지에서 넘어온다. (get방식이기 때문에 url 직접 입력도 가능))
	 *	PageDTO를 이용해서 각 페이지별로 조건과 페이지 번호에 맞는 게시글 출력
	 */
	@GetMapping("list")
	public void productPage(
			HttpServletRequest req, SearchingVO searchingVO,
			Model model) {
		
		int total = listService.getTotal(searchingVO);
		
		PageDTO pageDTO = new PageDTO(searchingVO, total);
		
		System.out.println(pageDTO);
		
		List<ProductVO> productList = listService.getProductListWithPaging(searchingVO);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);		
		
	}
	
	@GetMapping("view")
	public void productView() {
		
	}
}
