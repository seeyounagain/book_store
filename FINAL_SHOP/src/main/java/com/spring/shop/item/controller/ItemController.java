package com.spring.shop.item.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.admin.service.AdminService;
import com.spring.shop.common.service.CommonService;
import com.spring.shop.item.service.ItemService;
import com.spring.shop.item.vo.ItemVO;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Resource(name="itemService")
	private ItemService itemService;
	
	@Resource(name="adminService")
	private AdminService adminService;
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	// 메인화면 - 상품목록화면
	@GetMapping("/itemList")
	public String selectItemList(Model model) {
		
		model.addAttribute("list",itemService.selectItemList());
		model.addAttribute("cateList",itemService.selectCateList());
		model.addAttribute("menuList",commonService.selectMenuList());
		
		return "item/item_list";
		
	}
	

	
}
