package com.forreport.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.forreport.domain.UserVO;
import com.forreport.mapper.AuthMapper;
import com.forreport.mapper.UserMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private AuthMapper authMapper;
	
	
	// 회원가입
	@Override
	@Transactional // 권한부여, 회원가입 모두 같이 이루어져야 하기 때문에 추가
	public void joinProcess(UserVO vo) throws Exception {
		userMapper.joinProcess(vo);
		
		// 권한 부여
		int authResult = authMapper.grantAuth(vo.getId());
		System.out.println("authMapper: " + authResult);
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
	public String findId(HttpServletResponse response, String email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String id = userMapper.findId(email);
		
		if (id == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return id;
		} 
	}

	/*
	 * // 비밀번호 찾기
	 * 
	 * @Override public String findPw(String id, String email) throws Exception {
	 * 
	 * return userMapper.findPw(id, email); }
	 */


}
