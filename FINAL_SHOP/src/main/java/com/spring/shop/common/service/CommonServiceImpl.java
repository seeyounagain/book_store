package com.spring.shop.common.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.common.vo.BoardVO;
import com.spring.shop.common.vo.MenuVO;
import com.spring.shop.common.vo.SideMenuVO;

@Service("commonService")
public class CommonServiceImpl implements CommonService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 메뉴 목록 조회
	@Override
	public List<MenuVO> selectMenuList() {
		
		return sqlSession.selectList("commonMapper.selectMenuList");
		
	}
	
	// 사이드 메뉴 목록 조회
	@Override
	public List<SideMenuVO> selectSideList(MenuVO menuVO) {
		
		return sqlSession.selectList("commonMapper.selectSideMenuList", menuVO);
		
	}
	
	// 게시글 목록 조회
	@Override
	public List<BoardVO> selectBoardList(BoardVO boardVO) {
		
		return sqlSession.selectList("commonMapper.selectBoardList", boardVO);
		
	}
	
	// 전체 게시글 갯수 조회
	@Override
	public int countBoard(BoardVO boardVO) {

		return sqlSession.selectOne("commonMapper.countBoard",boardVO);
		
	}
	

}
