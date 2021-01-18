package com.forreport.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {

	private long ordernum;	// 주문 번호
	private long pronum;		// 상품 번호
	private String id;		// 주문자 id
	private String paymethod;	// 결제방식
	private long payprice;	// 결제금액
	private Date orderdate;	// 주문일자
	
	private List<Long> pronumList;	// 상품번호 리스트
	
	// 신용카드 결제 시
	private long applynum;	// 카드 승인번호
	
	// 무통장 결제 시(가상계좌) - 테스트용
//	private String vbanknum;	// 입금계좌명
//	private String vbankName;	// 은행명
//	private String vbankHolder;	// 입금기한
//	private String vbankDate;	// 승인번호
	
	
}