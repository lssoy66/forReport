package com.forreport.domain;

import lombok.Data;

@Data
public class ReviewCriteria {
	
	private int pageNum; // 리뷰 페이지 번호
	private int amount; // 한 페이지 당 리뷰 개수
	
	public ReviewCriteria() { // 기본 페이지 출력은 1페이지, 한페이지에 댓글 10개씩
		this(1,10);
	}
	
	public ReviewCriteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

}
