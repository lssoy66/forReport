package com.forreport.service;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.forreport.domain.OrderVO;
import com.forreport.domain.ProductVO;
import com.forreport.mapper.CartMapperTests;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class OrderServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private OrderService orderService;
//	
//	@Test
//	public void testAddOrder() {
//		OrderVO order = new OrderVO();
//		order.setId("user3");
//		
//		List<Long> proList = new ArrayList<Long>();
//		proList.add((long) 67);
//		proList.add((long) 69);
//		order.setPronumList(proList);
//		
//		order.setPaymethod("card");
//		order.setPayprice(50000);
//		
//		int result = orderService.addOrder(order);
//		log.info(result);
//	}
	
	@Test
	public void testGetOrderList() {
		log.info(orderService.getOrderList("user3").get(0));
	}
	

}
