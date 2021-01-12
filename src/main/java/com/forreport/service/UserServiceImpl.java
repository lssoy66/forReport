package com.forreport.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forreport.domain.UserVO;
import com.forreport.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserService userService;
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	// 회원 가입
	@Override
	public void join(UserVO vo) throws Exception {
		userService.join(vo);
	}

}
