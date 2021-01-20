package com.forreport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;
import com.forreport.mapper.ProductMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor // mapper 의존성 주입해준다.
@Service
public class ProductServiceImpl implements ProductService {

	private ProductMapper mapper;
	
	/*검색조건을 넣어 ProductList를 가져온다.*/
	@Override
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO) {
		
		log.info("get List");
		
		List<ProductVO> productList = mapper.getProductListWithPaging(searchingVO);
		return productList;
		
	}

	/* 조건에 맞는 게시글의 전체 개수 가져오기*/
	@Override
	public int getTotal(SearchingVO searchingVO) {
		log.info("get total count");
		return mapper.getTotalCount(searchingVO);
	}

	/* 게시글 번호를 이용해서 실제 게시글(상품내용) 가져오기*/
	@Override
	public ProductVO getProduct(int pronum) {
		log.info("getProduct");		
		
		return mapper.getProduct(pronum);
	}

	/* 카테고리에 맞춰서 제품 썸네일 만들기 */
	@Override
	public boolean makeThumbnail(long largeCa) {
		
		if(largeCa == 0) { // 레포트
			
			// 아직
		
		} else if(largeCa == 1) { // 논문
			
			// 아직
			
		} else {
			return false;
		}
		
		
		return true;		
	}

}
