package com.spring.shop.common.vo;

public class MenuVO {
	
	// 메뉴 정보 테이블
	// MENU_CODE MENU_NAME MENU_URI
	
	private String menuCode;
	private String menuName;
	private String menuUri;
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUri() {
		return menuUri;
	}
	public void setMenuUri(String menuUri) {
		this.menuUri = menuUri;
	}
	
}
