package com.spring.shop.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.shop.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 회원가입
	@Override
	public void insertMember(MemberVO memberVO) {
		
		sqlSession.insert("memberMapper.insertMember",memberVO);
		
	}
	
	// 로그인
	@Override
	public MemberVO selectMember(MemberVO memberVO) {
		
		return sqlSession.selectOne("memberMapper.selectMember",memberVO);
		
	}
	
	// 아이디 중복체크
	@Override
	public boolean selectMemberId(String id) {
		
		String result = sqlSession.selectOne("memberMapper.selectMemberId", id);
		// true = 중복아이디존재 false = 아이디생성가능
		return result == null ? false : true;
		
	}
	
	// 회원 목록 조회
	@Override
	public List<MemberVO> selectMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

}
