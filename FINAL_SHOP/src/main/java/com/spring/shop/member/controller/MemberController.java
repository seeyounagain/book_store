package com.spring.shop.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.member.service.MemberService;
import com.spring.shop.member.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	// 회원가입 페이지로 이동
	@GetMapping("/joinForm")
	public String joinForm() {
		
		return "member/member_join_form";
		
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/loginForm")
	public String loginForm() {
		
		return "member/member_login_form";
		
	}
	
	// 회원가입
	@PostMapping("/join")
	public String join(MemberVO memberVO) {
		
		memberService.insertMember(memberVO);
		
		return "redirect:/item/itemList";
		
	}
	
	// 로그인
	@PostMapping("/login")
	public String login(MemberVO memberVO, HttpSession session) {
		
		MemberVO loginInfo = memberService.selectMember(memberVO);
		
		if (loginInfo != null) {
			
			session.setAttribute("loginInfo", loginInfo);
			
			// 관리자 로그인 시
			if (loginInfo.getIsAdmin().equals("Y")) {
				return "redirect:/admin/categoryManage";
			}
			/*
			 * // 일반회원 로그인 시 else { return "redirect:/item/itemList"; }
			 */
			
		}
		
		return "redirect:/item/itemList";
		
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginInfo");
		
		return "redirect:/item/itemList";
		
	}
	
}
