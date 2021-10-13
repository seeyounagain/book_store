package com.spring.shop.item.vo;

public class ImgVO {
	
	// 상품 이미지 정보 테이블
	// 이미지코드(기본키), 첨부한 파일 이름, 업로드 된 파일 이름, 상품코드(외래키), 메인이미지여부
	// IMG_CODE -- IMG_001 ~~~
	// ORIGIN_IMG_NAME ATTACHED_IMG_NAME ITEM_CODE IS_MAIN
	
	private String imgCode;
	private String originImgName;
	private String attachedImgName;
	private String itemCode;
	private String isMain;
	
	public ImgVO() {
		
	};
	
	public ImgVO(String imgCode, String originImgName, String attachedImgName, String itemCode, String isMain) {
		super();
		this.imgCode = imgCode;
		this.originImgName = originImgName;
		this.attachedImgName = attachedImgName;
		this.itemCode = itemCode;
		this.isMain = isMain;
	}
	
	public String getImgCode() {
		return imgCode;
	}
	public void setImgCode(String imgCode) {
		this.imgCode = imgCode;
	}
	public String getOriginImgName() {
		return originImgName;
	}
	public void setOriginImgName(String originImgName) {
		this.originImgName = originImgName;
	}
	public String getAttachedImgName() {
		return attachedImgName;
	}
	public void setAttachedImgName(String attachedImgName) {
		this.attachedImgName = attachedImgName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getIsMain() {
		return isMain;
	}
	public void setIsMain(String isMain) {
		this.isMain = isMain;
	}
	
	
}
