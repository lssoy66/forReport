package com.forreport.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CartMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private CartMapper mapper;

	// 주문자의 장바구니 리스트 가져오기
	@Test
	public void testGetCartList() {
		log.info("getCartList"); 
		mapper.getCartList("user3").forEach(user -> log.info(user));
		log.info(mapper.getProduct(3));
	}

}
