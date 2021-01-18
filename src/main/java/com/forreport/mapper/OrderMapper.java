package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.OrderVO;

public interface OrderMapper {
	
	public int addOrder(OrderVO order);
	
	public List<OrderVO> getOrderList(String id);
	
}
