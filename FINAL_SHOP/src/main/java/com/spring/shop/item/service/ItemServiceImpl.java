package com.spring.shop.item.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.shop.item.vo.CategoryVO;
import com.spring.shop.item.vo.ItemVO;

@Service("itemService")
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 카테고리 목록 조회
	@Override
	public List<CategoryVO> selectCateList() {
		
		return sqlSession.selectList("itemMapper.selectCategoryList");
		
	}
	
	// 상품 등록
	@Override
	public void insertItem(ItemVO itemVO) {
		
		sqlSession.insert("itemMapper.insertItem",itemVO);
		
	}
	
	// 상품 목록 조회
	@Override
	public List<ItemVO> selectItemList() {
		
		return sqlSession.selectList("itemMapper.selectItemList");
		
	}
	
	// 카테고리 등록
	@Override
	public void insertCate(CategoryVO categoryVO) {
		
		sqlSession.insert("itemMapper.insertCategory",categoryVO);
		
	}
	
	// 카테고리 & 포함상품 삭제
	@Transactional(rollbackFor = Exception.class)
	@Override
	public void deleteCate(CategoryVO categoryVO) {
		
		// 트랜잭션
		sqlSession.delete("itemMapper.deleteCategoryItem", categoryVO);
		sqlSession.delete("itemMapper.deleteCategory", categoryVO);
		
	}
	
	// 상품 삭제
	@Override
	public void deleteItem(ItemVO itemVO) {
		
		sqlSession.delete("itemMapper.deleteItem",itemVO);
		
	}

}
