package com.forreport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forreport.domain.CartVO;
import com.forreport.domain.ProductVO;
import com.forreport.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartServiceImpl implements CartService {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;
	
	// 사용자의 장바구니 정보를 조회한 후, 등록된 상품번호를 통해 상품 정보 리스트를 가져온다
	@Override
	public List<ProductVO> getCartList(String userId) {
		List<ProductVO> productList = new ArrayList<>();
		mapper.getCartList(userId) .forEach(cart ->
		 	productList.add(mapper.getProduct(cart.getProNum())) );
		
		log.info(productList);
		
		return productList;
	}
	
}
