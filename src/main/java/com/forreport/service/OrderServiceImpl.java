package com.forreport.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.forreport.domain.IdPronumVO;
import com.forreport.domain.OrderVO;
import com.forreport.domain.ProductVO;
import com.forreport.mapper.CartMapper;
import com.forreport.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrderServiceImpl implements OrderService {

	@Setter(onMethod_ = @Autowired)
	private CartMapper cartMapper;
	
	@Setter(onMethod_ = @Autowired)
	private OrderMapper mapper;
	
	@Override
	public List<ProductVO> getCartProduct(String id, String[] checkPronum) {
		List<ProductVO> orderProductList = new ArrayList<>();
		
		for(int i = 0; i < checkPronum.length; i++) {
			orderProductList.add(cartMapper.getProduct(Integer.parseInt(checkPronum[i])));
		}
		
		return orderProductList;
	}

	// 결제 성공 = 주문 테이블 저장 + 장바구니 테이블 삭제
	@Override
	@Transactional
	public int addOrder(OrderVO order) {
		int success = 1;
		IdPronumVO idpro = new IdPronumVO();
		for(int i = 0; i < order.getPronumList().size(); i++) {
			order.setPronum(order.getPronumList().get(i));
			order.setPayprice(cartMapper.getProduct(order.getPronum()).getPrice());
			success *= mapper.addOrder(order);
			
			idpro.setId(order.getId());
			idpro.setPronum(order.getPronumList().get(i));
			success *= cartMapper.deleteCartProduct(idpro);
		}
		log.info("success Number :: " + success);
		return success;
	}
	
	

}
