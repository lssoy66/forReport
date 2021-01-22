package com.forreport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.forreport.domain.NoticeVO;

public interface NoticeMapper {
	
	//@Select("select * from tbl_notice where noticenum > 0")
	public List<NoticeVO> getList1();
	public void insert1(NoticeVO notice);
	public void insertSelectKey1(NoticeVO notice);
	public NoticeVO read1(int noticenum);
	public int delete1(int noticenum);
	public int update1(NoticeVO notice);

}
