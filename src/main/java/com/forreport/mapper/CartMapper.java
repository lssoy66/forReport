package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.CartVO;
import com.forreport.domain.ProductVO;

public interface CartMapper {

	// 주문자의 장바구니 리스트 가져오기
	public List<CartVO> getCartList(String userId);
	
	// 상품 가져오기(테스트를 위해 임의로 작성)
	public ProductVO getProduct(int pronum);
	
}
