package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;

public interface ProductMapper {
	
	/*전체 리스트 가져오기*/
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO);
	
	/*전체 게시글 개수 가져오기*/
	public int getTotalCount(SearchingVO searchingVO);
	
	/*상품 상세페이지 만들기 위해서 tbl_product 한 행의 정보 가져오기*/
	public ProductVO getProduct(int pronum);
	
}
