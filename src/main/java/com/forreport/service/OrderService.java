package com.forreport.service;

import java.util.List;

import com.forreport.domain.ProductVO;

public interface OrderService {

	// 사용자가 선택한 특정 상품들 가져오기
	public List<ProductVO> getCartProduct(String id, String[] checkPronum);
	
}