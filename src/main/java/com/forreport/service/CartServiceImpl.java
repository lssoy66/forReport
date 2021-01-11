package com.forreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forreport.domain.CartVO;
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
	
	@Override
	public List<CartVO> getCartList(String userId) {
		return mapper.getCartList(userId);
	}
	
}
