package com.spring.shop.member.service;

import java.util.List;

import com.spring.shop.member.vo.MemberVO;

public interface MemberService {
	
	// 회원가입
	void insertMember(MemberVO memberVO);
	
	// 로그인
	MemberVO selectMember(MemberVO memberVO);
	
	// 아이디 중복체크
	boolean selectMemberId(String id);
	
	// 회원 목록 조회
	List<MemberVO> selectMemberList();
	
}
