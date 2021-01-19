package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.OrderVO;
import com.forreport.domain.VbankVO;

public interface OrderMapper {
	
	// 주문 테이블에 데이터 추가
	public int addOrder(OrderVO order);
	
	// 사용자의 주문 테이블 리스트 가져오기
	public List<OrderVO> getOrderList(String id);
	
	// 가상계좌 테이블에 데이터 추가
	public int addVbank(VbankVO vbank);
	
	// 가상계좌 정보 가져오기
	public VbankVO getVbank(String id);
	
}
