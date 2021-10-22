package com.spring.shop.common.util;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spring.shop.common.service.CommonService;
import com.spring.shop.common.vo.MenuVO;

// 상단메뉴, 사이드메뉴를 조회하는 인터셉터
public class MenuInterceptor extends HandlerInterceptorAdapter {
	
	@Resource(name="commonService")
	private CommonService commonService;
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		// 상단메뉴 조회
		modelAndView.addObject("menuList", commonService.selectMenuList());
		// 사이드메뉴 조회 (매개변수 필요)
		MenuVO menuVO = (MenuVO)(modelAndView.getModel().get("menuVO"));
		
		if (menuVO.getMenuCode() == null) {
			
			menuVO.setMenuCode("MENU_001");
			
		}
		
		modelAndView.addObject("sideMenuList",commonService.selectSideList(menuVO));
		
	}
	
}
