package com.forreport.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.forreport.domain.MemberVO;
import com.forreport.mapper.MemberMapper;
import com.forreport.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	
	@Override
	public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
		MemberVO vo = memberMapper.read(name);
		
	    log.warn("queried by member mapper : "+ vo);
		
	    return vo == null ? null : new CustomUser(vo);
	}

}
