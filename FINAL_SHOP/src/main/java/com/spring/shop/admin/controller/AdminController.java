package com.spring.shop.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.admin.service.AdminService;
import com.spring.shop.item.service.ItemService;
import com.spring.shop.item.vo.CategoryVO;
import com.spring.shop.item.vo.ItemVO;

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
		model.addAttribute("sidePage","cateManage");
		
		return "admin/category_manage";
		
	}
	
	// 상품등록 페이지로 이동
	@GetMapping("/regItem")
	public String regItem(Model model) {
		
		model.addAttribute("list",itemService.selectCateList());
		model.addAttribute("sidePage","regItem");
		
		return "admin/reg_item";
		
	}
	
	// 상품관리 페이지로 이동
	@GetMapping("/itemManage")
	public String itemManage(Model model) {
		
		model.addAttribute("sidePage","itemManage");
		model.addAttribute("list", itemService.selectItemList());
		
		return "admin/item_manage";
		
	}
	
	// 상품등록
	@PostMapping("/regItem")
	public String registItem(ItemVO itemVO) {
		
		itemService.insertItem(itemVO);
		
		return "redirect:/admin/regItem";
		
	}
	
	// 카테고리 등록
	@PostMapping("/regCate")
	public String registCate(CategoryVO categoryVO) {
		
		itemService.insertCate(categoryVO);
		
		return "redirect:/admin/categoryManage";
		
	}
	
	// 카테고리 & 상품 삭제
	@GetMapping("/deleteCate")
	public String deleteCate(CategoryVO categoryVO) {
		
		itemService.deleteCate(categoryVO);
		
		return "redirect:/admin/categoryManage";
		
	}
	
	
}
