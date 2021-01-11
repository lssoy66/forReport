package com.forreport.controller;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forreport.domain.SearchingVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
public class ProductController {

	/*일반 검색 경우: 대분류 선택*/
	@GetMapping("list")
	public void productPage(
			@Param(value = "inputKeyword") String inputKeyword,
			@Param(value = "smallCategory") String smallCategory,
			@Param(value = "bigCategory") String bigCategory,
			Model model) {
						
		if(bigCategory=="paper" ||  bigCategory=="report") { // 대분류 선택한 경우
			model.addAttribute("searchingVO", new SearchingVO(inputKeyword, bigCategory, smallCategory));
		} else { // 대분류 선택 안한 경우
			model.addAttribute("searchingVO", new SearchingVO(inputKeyword, "paper/report", smallCategory));
		}
				
	}
	
}
