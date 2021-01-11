package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;

public interface ProductMapper {
	
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO);
	
}
