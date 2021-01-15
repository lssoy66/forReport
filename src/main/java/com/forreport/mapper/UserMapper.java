package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.UserVO;

public interface UserMapper {
	
	// 회원 목록
	public List<UserVO> getUserList(String id);

}
