package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.CartVO;

public interface CartMapper {

	// 주문자의 장바구니 리스트 가져오기
	public List<CartVO> getCartList(String userId);
	
}
