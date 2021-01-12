package com.forreport.domain;

import java.util.Map;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class SearchingVO {
	
	private String inputKeyword; // 입력한 키워드	
	private int largeCategory; // 대분류 
	private int smallCategory; // 소분류
	
	/*
	 	대분류
	 	 - 리포트(0) 논문(1)
	 	소분류
	 	- 인문사회(0) 자연공학(1) 예술체육(2) 교양(3)
	 */
	
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지 당 글의 개수
	
	public SearchingVO() { // 기본 페이지 출력은 1페이지
		this(1,10);
	}
	
	public SearchingVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}