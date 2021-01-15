package com.forreport.domain;

import lombok.Data;

@Data
public class UserVO {
	
	private String id;
	private String password;
	private String name;
	private String phone;
	private String email;
	private int grade;
		
}
