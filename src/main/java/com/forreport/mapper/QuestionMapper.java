package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.QuestionVO;
import com.forreport.domain.ReviewCriteria;

public interface QuestionMapper {

	// @Select("select * from tbl_question where questionnum > 0")
	public List<QuestionVO> getList2();

	public void insert2(QuestionVO question);

	public void insertSelectKey2(QuestionVO question);

	public QuestionVO read2(int questionnum);

	public int delete2(int questionnum);

	public int update2(QuestionVO question);

	// 총 주문 수 가져오기
	public int getTotalCount(ReviewCriteria criteria);

	// 모든 주문 리스트 가져오기
	public List<QuestionVO> getNoticeListAllWithPaging(ReviewCriteria criteria);

}
