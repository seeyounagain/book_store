package com.spring.shop.item.service;

import java.util.List;

import com.spring.shop.item.vo.CategoryVO;
import com.spring.shop.item.vo.ImgVO;
import com.spring.shop.item.vo.ItemVO;

public interface ItemService {
	
	// 카테고리 목록 조회
	List<CategoryVO> selectCateList();
	
	// 카테고리 등록
	void insertCate(CategoryVO categoryVO);
	
	// 카테고리 & 포함상품 삭제
	void deleteCate(CategoryVO categoryVO);
	
	// 상품 등록
	void insertItem(ItemVO itemVO);
	
	// 상품 삭제
	void deleteItem(ItemVO itemVO);
	
	// 상품 목록 조회 (상품 리스트)
	List<ItemVO> selectItemListMain();
	
	// 상품 목록 조회 (관리자)
	List<ItemVO> selectItemListManage();
	
	// 상품 이미지 코드 숫자 생성
	int selectImgCodeNum();
	
	// 상품 이미지 정보 등록
	void insertItemImgList(ItemVO itemVO);
	
	// 상품코드 생성
	String selectItemCode();
	
}
