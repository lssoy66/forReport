package com.forreport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.forreport.domain.CartVO;
import com.forreport.domain.IdPronumVO;
import com.forreport.domain.ProductVO;

public interface CartMapper {
	
	// 장바구니 사용자, 상품 번호를 받아 장바구니에 추가
	public int addCart(IdPronumVO cart);

	// 주문자의 장바구니 리스트 가져오기
	public List<CartVO> getCartList(String userId);
	
	// 상품 가져오기(테스트를 위해 임의로 작성)
	public ProductVO getProduct(int pronum);
	
}
