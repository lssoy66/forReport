package com.forreport.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.forreport.domain.NoticeVO;

public interface NoticeMapper {
	
//	@Select("select * from tbl_notice where noticenum > 0")
	public List<NoticeVO> getList();
	public void insert1(NoticeVO notice);
	public void insertSelectKey1(NoticeVO notice);
	public NoticeVO read(int noticenum);

}
