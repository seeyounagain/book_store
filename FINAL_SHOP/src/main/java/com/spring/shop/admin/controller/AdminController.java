package com.spring.shop.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.admin.service.AdminService;
import com.spring.shop.item.service.ItemService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="itemService")
	private ItemService itemService;
	
	// 카테고리 관리 페이지로 이동
	@GetMapping("/categoryManage")
	public String categoryManage(Model model) {
		
		model.addAttribute("list",itemService.selectCateList());
		
		return "admin/category_manage";
		
	}
	
	
}
