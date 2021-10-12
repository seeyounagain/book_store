package com.spring.shop.admin.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.admin.service.AdminService;
import com.spring.shop.common.service.CommonService;
import com.spring.shop.common.vo.MenuVO;
import com.spring.shop.common.vo.SideMenuVO;
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
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	// 카테고리 관리 페이지로 이동
	@GetMapping("/categoryManage")
	public String categoryManage(Model model, MenuVO menuVO, SideMenuVO sideMenuVO) {
		
		model.addAttribute("list",itemService.selectCateList());
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideList("MENU_001"));
		
		model.addAttribute("sidePage","categoryManage");
		
		return "admin/category_manage";
		
	}
	
	// 상품등록 페이지로 이동
	@GetMapping("/regItem")
	public String regItem(Model model,SideMenuVO sideMenuVO) {
		
		model.addAttribute("list",itemService.selectCateList());
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideList("MENU_001"));
		
		model.addAttribute("sidePage","regItem");
		
		return "admin/reg_item";
		
	}
	
	// 상품관리 페이지로 이동
	@GetMapping("/itemManage")
	public String itemManage(Model model,SideMenuVO sideMenuVO) {
		// 상품 목록 조회 -> 전달
		model.addAttribute("list", itemService.selectItemList());
		// 메뉴 목록 조회 -> 전달
		model.addAttribute("menuList",commonService.selectMenuList());
		// 사이드 메뉴 목록 조회 -> 전달
		model.addAttribute("sideMenuList",commonService.selectSideList("MENU_001"));
		
		model.addAttribute("sidePage","itemManage");
		
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
	
	// 상품 삭제
	@GetMapping("/deleteItem")
	public String deleteItem(ItemVO itemVO) {
		
		itemService.deleteItem(itemVO);
		
		return "redirect:/admin/itemManage";
		
	}
	
	// 회원 조회 페이지로 이동
	@GetMapping("/memberList")
	public String selectMemberList(Model model,SideMenuVO sideMenuVO) {
		
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideList("MENU_002"));
		
		model.addAttribute("sidePage","memberList");
		
		return "admin/member_list";
		
	}
	
	// 회원 관리 페이지로 이동
	@GetMapping("/memberManage")
	public String manageMember(Model model,SideMenuVO sideMenuVO) {
		
		model.addAttribute("menuList",commonService.selectMenuList());
		model.addAttribute("sideMenuList",commonService.selectSideList("MENU_002"));
		
		model.addAttribute("sidePage","memberManage");
		
		return "admin/member_manage";
		
	}
	
	
}
