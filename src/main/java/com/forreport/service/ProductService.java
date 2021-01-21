package com.forreport.service;

import java.io.File;
import java.util.List;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;
import com.forreport.domain.UploadVO;


public interface ProductService {
	
	/*검색조건을 넣어 ProductList를 가져온다.*/
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO);
	
	/* 조건에 맞는 전체 게시글의 개수를 가져온다.*/
	public int getTotal(SearchingVO searchingVO);
	
	/* pronum과 일치하는 제품 상세 정보 가져오기*/
	public ProductVO getProduct(int pronum);
	
	/* 카테고리에 맞춰서 제품 썸네일 만들기 */
	public boolean makeThumbnail(UploadVO uploadVO, long largeCa);
}
