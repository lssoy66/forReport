package com.forreport.mapper;

import java.util.List;

import com.forreport.domain.UserVO;

public interface UserMapper {
	
	public List<UserVO> getUserList();
	
	public void insert(UserVO user);
	
}
