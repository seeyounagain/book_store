package com.spring.shop.common.vo;

public class SideMenuVO {
	
	// 사이드 메뉴 정보 테이블
	// SIDE_MENU_CODE SIDE_MENU_NAME MENU_CODE SIDE_MENU_URI
	
	private String sideMenuCode;
	private String sideMenuName;
	private String menuCode;
	private String sideMenuUri;
	
	public String getSideMenuCode() {
		return sideMenuCode;
	}
	public void setSideMenuCode(String sideMenuCode) {
		this.sideMenuCode = sideMenuCode;
	}
	public String getSideMenuName() {
		return sideMenuName;
	}
	public void setSideMenuName(String sideMenuName) {
		this.sideMenuName = sideMenuName;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getSideMenuUri() {
		return sideMenuUri;
	}
	public void setSideMenuUri(String sideMenuUri) {
		this.sideMenuUri = sideMenuUri;
	}
	
	
}
