package com.spring.shop.item.service;

import java.util.List;

import com.spring.shop.item.vo.CategoryVO;

public interface ItemService {
	
	// 카테고리 목록 조회
	List<CategoryVO> selectCateList();
	
}
