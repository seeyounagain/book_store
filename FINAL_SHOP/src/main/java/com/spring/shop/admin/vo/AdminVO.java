package com.spring.shop.admin.vo;

public class AdminVO {
	
	// 쇼핑몰 회원 테이블
	// 아이디(기본키), 비밀번호, 이름, 연락처, 주소, 성별, 관리자여부, 가입일
	// ID, PW, NAME, TELL, ADDR, GENDER, IS_ADMIN, JOIN_DATE
	// TELL 010-1111-2222
	// GENDER 남 OR 여
	// IS_ADMIN Y OR N
	// ID 기본키 적용, 제약조건 이름 지정
	
	private String id;
	private String pw;
	private String name;
	private String tell;
	private String addr;
	private String gender;
	private String isAdmin;
	private String joinDate;
	
	private String[] tells;
	private String[] addrs;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String[] getTells() {
		return tells;
	}
	public void setTells(String[] tells) {
		String tell = tells[0] + "-" + tells[1] + "-" + tells[2];
		setTell(tell);
	}
	public String[] getAddrs() {
		return addrs;
	}
	public void setAddrs(String[] addrs) {
		String addr = addrs[0] + " " + addrs[1];
		setAddr(addr);
	}
	
	
	
}
