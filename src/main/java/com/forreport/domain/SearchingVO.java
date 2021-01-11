package com.forreport.domain;

import java.util.Map;
import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.Data;


@Data
@AllArgsConstructor
public class SearchingVO {
	
	private String inputKeyword; // 입력한 키워드	
	private String bigCategory; // 대분류
	private String smallCategory; // 소분류
	
}
