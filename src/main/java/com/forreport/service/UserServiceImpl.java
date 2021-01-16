package com.forreport.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forreport.domain.UserVO;
import com.forreport.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	

	@Setter(onMethod_ = @Autowired)
	private UserMapper userMapper;
	
	@Override
	public void join(UserVO vo) throws Exception {

	}

	@Override
	public List<UserVO> getUserList(String id) {

		return null;

	}

}