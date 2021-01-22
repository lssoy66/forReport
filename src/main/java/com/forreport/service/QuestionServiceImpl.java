package com.forreport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.forreport.domain.QuestionVO;
import com.forreport.mapper.QuestionMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QuestionServiceImpl implements QuestionService {
	
	private QuestionMapper mapper2;

	@Override
	public void register2(QuestionVO question) {
		// TODO Auto-generated method stub

	}

	@Override
	public QuestionVO get2(int questionnum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify2(QuestionVO question) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove2(int questionnum) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<QuestionVO> getList2() {
		// TODO Auto-generated method stub
		return null;
	}

}
