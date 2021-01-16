package com.forreport.service;

import java.util.List;

import com.forreport.domain.UserVO;

public interface UserService {

	// 회원 가입
	public void join(UserVO vo) throws Exception;

	// 회원 목록 가져오기
	public List<UserVO> getUserList(String id);


}