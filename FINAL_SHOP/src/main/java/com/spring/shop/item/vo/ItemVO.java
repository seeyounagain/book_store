package com.spring.shop.item.vo;

public class ItemVO {
	
	// 쇼핑몰 상품 테이블
	// 상품코드(기본키), 상품명, 가격, 지은이, 출판사, 카테고리
	// ITEM_CODE, ITEM_NAME, ITEM_PRICE, WRITER, PUBLISHER ,REG_DATE, CATE_CODE
	    // ID 기본키 적용, 제약조건 이름 지정
	    // CATE_CODE 외래키 적용, 제약조건 이름 지정
	
	private String itemCode;
	private String itemName;
	private int itemPrice;
	private String writer;
	private String publisher;
	private String regDate;
	private String cateCode;
	private String translator;
	private String pubDate;
	private String isbn;
	private String page;
	
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getPubDate() {
		return pubDate;
	}
	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	
	
	
}
