package com.forreport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;
import com.forreport.domain.UploadVO;

public interface ProductMapper {
	
	/*전체 리스트 가져오기*/
	public List<ProductVO> getProductListWithPaging(SearchingVO searchingVO);
	
	/*전체 게시글 개수 가져오기*/
	public int getTotalCount(SearchingVO searchingVO);
	
	/*상품 상세페이지 만들기 위해서 tbl_product 한 행의 정보 가져오기*/
	public ProductVO getProduct(int pronum);
	
	/*등록 상품 내역 tbl_product에 업로드*/
	public int uploadTblProduct(ProductVO productVO);
	
	/*등록 상품 내역 tbl_upload에 업로드*/
	public int uploadTblUpload(UploadVO uploadVO);
	
	/* 썸네일 정보 가져오기*/
	public UploadVO getThumbnail(int pronum);
	
	/* UUID, fileName을 이용해서 pronum 가져오기 */
	public Integer getPronum(@Param("UUID") String UUID, @Param("fileName") String fileName);
	
	/* 수연 추가 :: 사용자(판매자)가 등록한 상품 전체 가져오기 */
	public List<ProductVO> getProductById(String id);
	
}
