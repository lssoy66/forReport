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
	
	private ListService list;

	/*
	 *	검색 후 리스트 출력(주로 메인페이지에서 넘어온다. (get방식이기 때문에 url 직접 입력도 가능)) 
	 */
	@GetMapping("list")
	public void productPage(
			HttpServletRequest req, String smallCategory, String largeCategory, Model model) {
		
		String inputKeyword = req.getParameter("inputKeyword");
		
		int smallCategoryInt;
		int largeCategoryInt;
		
		if(smallCategory==null) {
			smallCategoryInt = 999; // 소분류 선택 안한 경우 임의의 숫자를 지정해서 없는 것과 마찬가지로 처리
		} else {
			smallCategoryInt = Integer.parseInt(smallCategory);
		}
		
		if(largeCategory==null) {
			largeCategoryInt = 999; // 대분류 선택 안한 경우 임의의 숫자를 지정해서 없는 것과 마찬가지로 처리
		} else {
			largeCategoryInt = Integer.parseInt(largeCategory);
		}
				
		SearchingVO searchingVO = new SearchingVO();
		
		searchingVO.setInputKeyword(inputKeyword);
		searchingVO.setLargeCategory(largeCategoryInt);
		searchingVO.setSmallCategory(smallCategoryInt);
			
		
		System.out.println(searchingVO);
		
		List<ProductVO> productList = list.getProductListWithPaging(searchingVO);
		
		model.addAttribute("searchingVO", searchingVO);
		
	
		
		model.addAttribute("productList", productList);		
		
	}
}
