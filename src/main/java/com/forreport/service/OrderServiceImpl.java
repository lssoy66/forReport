package com.forreport.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.forreport.domain.IdPronumVO;
import com.forreport.domain.OrderVO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.VbankVO;
import com.forreport.mapper.CartMapper;
import com.forreport.mapper.OrderMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import sun.print.resources.serviceui;

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
			// 주문테이블에 추가
			order.setPronum(order.getPronumList().get(i));
			order.setPayprice(cartMapper.getProduct(order.getPronum()).getPrice());
			success *= mapper.addOrder(order);
			
			// 장바구니 테이블에서 삭제
			idpro.setId(order.getId());
			idpro.setPronum(order.getPronumList().get(i));
			success *= cartMapper.deleteCartProduct(idpro);
		}
		
		// 만약 가상계좌 정보가 있다면 가상계좌 테이블에 추가
		if(order.getVbnum() != null) {
			VbankVO vbank = new VbankVO();
			vbank.setId(order.getId());
			vbank.setVbnum(order.getVbnum());
			vbank.setVbname(order.getVbname());
			vbank.setVbholder(order.getVbholder());
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = format.parse(order.getVbdate());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			vbank.setVbdate(date);
			
			mapper.addVbank(vbank);
		}
		
		log.info("success Number :: " + success);
		return success;
	}

	// 사용자의 주문 정보 가져오기
	@Override
	public List<OrderVO> getOrderList(String id) {
		return mapper.getOrderList(id);
	}

	// 사용자가 발급받은 가상계좌 정보 가져오기
	@Override
	public VbankVO getVbank(String id) {
		return mapper.getVbank(id);
	}
	
	
	
	

}
