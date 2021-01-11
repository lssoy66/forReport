package com.forreport.controller;

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

import com.forreport.domain.SearchingVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
public class ProductController {

	/*
	 *	검색 후 리스트 출력(주로 메인페이지에서 넘어온다. (get방식이기 때문에 url 직접 입력도 가능)) 
	 */
	@GetMapping("list")
	public void productPage(
			HttpServletRequest req, String smallCategory, String bigCategory, Model model) {
		
		String inputKeyword = req.getParameter("inputKeyword");
		SearchingVO searchingVO = new SearchingVO(inputKeyword, bigCategory, smallCategory);
		
		/*
		 * 파라미터를 이용해 키워드, 대분류 확인하여 리스트 보여주기
		 * 
		 * 1. 키워드 입력한 경우 확인
		 * 2. 대분류 클릭한 경우 확인 > 소분류 확인
		 */
		
		if(inputKeyword==null) { // 키워드X
			
			// 대분류를 선택해서 들어온 경우
			if(bigCategory.equals("Paper") || bigCategory.equals("Report")) { // 대분류 선택한 경우\
											
				if(smallCategory!=null) { // 소분류 선택한 경우
					searchingVO.setSmallCategory(smallCategory);
				}
				
			} else { // 대분류 선택 안한 경우
				searchingVO.setBigCategory("Paper/Report");
			}
			
		} else { // 키워드 O
			searchingVO.setBigCategory("Paper/Report");
		}
		
		model.addAttribute("searchingVO", searchingVO);
	}
}
