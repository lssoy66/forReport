package com.forreport.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	
	private long pronum; /*상품번호*/
	private String id; /*아이디*/
	private long largeCa; /*대분류*/
	private long smallCa; /*소분류*/
	private String title; /*제목*/
	private String proname; /*상품명*/
	private String prodsc; /*상품설명*/
	private long price; /*가격*/
	private Date uploadDate; /*작성일*/
	private long approval; /*승인여부*/
	
	// 수연 추가 :: 판매 개수
	private int count;

}
