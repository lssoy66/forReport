package com.forreport.service;

import java.util.List;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;

public interface ListService {
	
	/*검색조건을 넣어 ProductList를 가져온다.*/
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO);
}
