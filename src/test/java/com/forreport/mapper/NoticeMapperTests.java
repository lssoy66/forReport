package com.forreport.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.forreport.domain.NoticeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	
	@Test
	public void testGetlist1() {
		mapper.getList().forEach(notice -> log.info(notice));
	}
	
	@Test
	public void testInsert1() {
		NoticeVO notice = new NoticeVO();
		notice.setNoticetitle("새로 작성하는 글");
		notice.setNotice("새로 작성하는 내용");
		
		mapper.insert1(notice);
		log.info(notice);
	}
	
	@Test
	public void testInsertSelectKey1() {
		NoticeVO notice = new NoticeVO();
		notice.setNoticetitle("새로 작성하는 글 select key");
		notice.setNotice("새로 작성하는 내용 select key");
		
		mapper.insertSelectKey1(notice);
		log.info(notice);
	}
	
	@Test
	public void testRead1() {
		//존재하는 게시물 번호로 테스트
		NoticeVO notice = mapper.read(45);
		log.info(notice);
	}

}
































