package com.forreport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forreport.domain.IdPronumVO;
import com.forreport.domain.ProductVO;
import com.forreport.mapper.CartMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	
	@Override
	public List<ProductVO> getCartProduct(String id, String[] checkPronum) {
		List<ProductVO> orderProductList = new ArrayList<>();
	
		for(int i = 0; i < checkPronum.length; i++) {
			orderProductList.add(cartMapper.getProduct(Integer.parseInt(checkPronum[i])));
		}
		
		return orderProductList;
		
	}

}
