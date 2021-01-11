package com.forreport.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private int proNum;			// 상품번호
	private String id;			// id
	private int largeca;		// 대분류
	private int smallca;		// 소분류
	private String title;		// 제목
	private String proname;		// 상품명
	private String prodsc;		// 상품설명
	private int price;			// 가격
	private Date uploaddate;	// 작성일
	private int approval;		// 승인여부
	
}
