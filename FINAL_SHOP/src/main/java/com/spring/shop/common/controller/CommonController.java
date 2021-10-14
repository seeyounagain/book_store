package com.spring.shop.common.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.admin.service.AdminService;
import com.spring.shop.common.service.CommonService;
import com.spring.shop.item.service.ItemService;

@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="itemService")
	private ItemService itemService;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	
	// 게시판 목록으로 이동
	@GetMapping("/boardList")
	public String boardList(Model model) {
		
		model.addAttribute("cateList",itemService.selectCateList());
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("boardList",commonService.selectBoardList());
		
		return "member/board_list";
		
	}
	
}
