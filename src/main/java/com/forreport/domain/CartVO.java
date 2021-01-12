package com.forreport.domain;

import lombok.Data;

@Data
public class CartVO {
	
	private int cartNum;	// 장바구니 번호
	private String id;		// 사용자 id(장바구니 주인)
	private int proNum;		// 상품 번호
	
}
