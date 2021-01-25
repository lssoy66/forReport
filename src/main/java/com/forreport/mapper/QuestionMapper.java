package com.forreport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.forreport.domain.QuestionVO;

public interface QuestionMapper {
	
	//@Select("select * from tbl_question where questionnum > 0")
	public List<QuestionVO> getList2();
	public void insert2(QuestionVO question);
	public void insertSelectKey2(QuestionVO question);
	public QuestionVO read2(int questionnum);
	public int delete2(int questionnum);
	public int update2(QuestionVO question);

}
