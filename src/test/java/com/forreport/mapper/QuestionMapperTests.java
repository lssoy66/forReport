package com.forreport.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.forreport.domain.NoticeVO;
import com.forreport.domain.QuestionVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class QuestionMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private QuestionMapper mapper;
	
	@Test
	public void testGetList2() {
		mapper.getList().forEach(question -> log.info(question));
	}
	
	@Test
	public void testInsert2() {
		QuestionVO question = new QuestionVO();
		question.setQuestiontitle("새로 작성하는 글");
		question.setQuestion("새로 작성하는 내용");
		
		mapper.insert2(question);
		log.info(question);
	}
	
	@Test
	public void testInsertSelectKey2() {
		QuestionVO question = new QuestionVO();
		question.setQuestiontitle("새로 작성하는 글 select key");
		question.setQuestion("새로 작성하는 내용 select key");
		
		mapper.insertSelectKey2(question);
		log.info(question);
		
	}
	
	@Test
	public void testRead1() {
		//존재하는 게시물 번호로 테스트
		QuestionVO question = mapper.read(25);
		log.info(question);
	}

}

































