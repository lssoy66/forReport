package com.forreport.service;

import java.util.List;

import com.forreport.domain.QuestionVO;

public interface QuestionService {
	
	public void register2(QuestionVO question);
	public QuestionVO get2(int questionnum);
	public boolean modify2(QuestionVO question);
	public boolean remove2(int questionnum);
	public List<QuestionVO> getList2();

}
