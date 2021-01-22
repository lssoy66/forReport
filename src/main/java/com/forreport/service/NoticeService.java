package com.forreport.service;

import java.util.List;

import com.forreport.domain.NoticeVO;

public interface NoticeService {
	
	public void register1(NoticeVO notice);
	public NoticeVO get1(int noticenum);
	public boolean modify1(NoticeVO notice);
	public boolean romove1(int noticenum);
	public List<NoticeVO> getList1();

}
