package com.forreport.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	public String id;
	public String password;
	public String name;
	public boolean enabled;
	
	private List<AuthVO> authList;

}
