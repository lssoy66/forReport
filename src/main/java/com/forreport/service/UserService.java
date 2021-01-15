package com.forreport.service;

import java.util.List;
import java.util.Map;

import com.forreport.domain.UserVO;

public interface UserService {

	// 회원 가입
	public void join(UserVO vo) throws Exception;

	// 회원 목록 가져오기
	public List<UserVO> getUserList(String id);

	// 이메일 중복 확인
	public int emailCheck(String email) throws Exception;
	
	// 아이디 중복 확인
	public int idCheck(String id) throws Exception;



}
