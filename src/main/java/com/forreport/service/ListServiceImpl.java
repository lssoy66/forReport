package com.forreport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;
import com.forreport.mapper.ProductMapper;

import lombok.AllArgsConstructor;

@AllArgsConstructor // mapper 의존성 주입해준다.
@Service
public class ListServiceImpl implements ListService {

	private ProductMapper mapper;
	
	@Override
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO) {
		
		List<ProductVO> productList = mapper.getProductListWithPaging(searchingVO);
		return productList;
		
	}

	

}
