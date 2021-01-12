package com.forreport.service;

import java.util.List;

import com.forreport.domain.CartVO;
import com.forreport.domain.ProductVO;

public interface CartService {
	
	// 장바구니에 담긴 상품정보(리스트) 가져오기
	public List<ProductVO> getCartList(String userId);

}
