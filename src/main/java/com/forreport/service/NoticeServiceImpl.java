package com.forreport.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.forreport.domain.NoticeVO;
import com.forreport.mapper.NoticeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private NoticeMapper mapper1;
	
	@Override
	public void register1(NoticeVO notice) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public NoticeVO get1(int noticenum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean modify1(NoticeVO notice) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean romove1(int noticenum) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<NoticeVO> getList1() {
		// TODO Auto-generated method stub
		return null;
	}

}
