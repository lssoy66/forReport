package com.forreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forreport.domain.UserVO;
import com.forreport.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	
	// 회원가입
	@Override
	public void joinProcess(UserVO vo) throws Exception {
		userMapper.joinProcess(vo);
	}

	@Override
	public List<UserVO> getUserList(String id) {

		return null;

	}
	
	// 이메일 중복 확인
	@Override
	public int emailCheck(String email) throws Exception {
		
		return userMapper.emailCheck(email);
	}

	// 아이디 중복 확인
	@Override
	public int idCheck(String id) throws Exception {
		
		return userMapper.idCheck(id);
	}

	// 아이디 찾기
	@Override
	public String findId(String email) throws Exception {

		return userMapper.findId(email);
	}

}
