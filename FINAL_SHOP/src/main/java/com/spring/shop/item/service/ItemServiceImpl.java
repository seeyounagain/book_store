package com.spring.shop.item.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.item.vo.CategoryVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CategoryVO> selectCateList() {
		
		return sqlSession.selectList("itemMapper.selectCategoryList");
		
	}

}
