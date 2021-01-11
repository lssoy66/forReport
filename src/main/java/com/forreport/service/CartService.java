package com.forreport.service;

import java.util.List;

import com.forreport.domain.CartVO;

public interface CartService {
	
	// 주문자의 장바구니 리스트 가져오기
	public List<CartVO> getCartList(String userId);

}
