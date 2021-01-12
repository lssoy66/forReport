package com.forreport.service;

import com.forreport.domain.UserVO;

public interface UserService {

	// 회원 가입
	public void join(UserVO vo) throws Exception;
}
