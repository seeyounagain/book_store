package com.spring.shop.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.shop.admin.service.AdminService;
import com.spring.shop.common.service.CommonService;
import com.spring.shop.common.util.FileUploadUtil;
import com.spring.shop.common.vo.MenuVO;
import com.spring.shop.common.vo.SideMenuVO;
import com.spring.shop.item.service.ItemService;
import com.spring.shop.item.vo.CategoryVO;
import com.spring.shop.item.vo.ImgVO;
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
		model.addAttribute("list", itemService.selectItemListManage());
		// 메뉴 목록 조회 -> 전달
		model.addAttribute("menuList",commonService.selectMenuList());
		// 사이드 메뉴 목록 조회 -> 전달
		model.addAttribute("sideMenuList",commonService.selectSideList("MENU_001"));
		
		model.addAttribute("sidePage","itemManage");
		
		return "admin/item_manage";
		
	}
	
	// 상품등록
	@PostMapping("/regItem")
	public String registItem(ItemVO itemVO,MultipartHttpServletRequest multi) {
		
		// 첨부파일 UPLOAD
		Iterator<String> inputNames = multi.getFileNames(); // 첨부된 파일의 이름이 아닌 input 태그의 name 속성!!! 가져옴
		
		// 파일이 첨부될 경로 (끝에 \\ 있는지 체크!)
		//String uploadPath = "C:\\Users\\siyoon\\git\\book_store\\FINAL_SHOP\\src\\main\\webapp\\resources\\upload\\";
		String uploadPath = "D:\\myGit\\book_store\\FINAL_SHOP\\src\\main\\webapp\\resources\\upload\\";
		
		// imgVO 담을 리스트 생성
		List<ImgVO> imgList = new ArrayList<>();
		
		// 상품 코드 생성
		String itemCode = itemService.selectItemCode();
		
		// 다음에 올 이미지 코드 숫자 생성
		int nextNum = itemService.selectImgCodeNum();
		
		// input file 태그의 갯수만큼 while
		while (inputNames.hasNext()) {
			
			String inputName = inputNames.next();
			
			// 업로드한 원본 파일명
			// file.getOriginalFilename();
			// 실제 첨부된 파일명
			// file.getName();
			// 파일 크기
			// file.getSize();
			
			// 경로에 파일 업로드
			// 반드시 예외 처리 해줘야 함
			try {
				
					
				// 다중 파일 업로드 시
				// multiple 속성이 있는 input 태그의 name 속성이 "file2" 로 지정됨
				if (inputName.equals("files")) {
					
					if (!multi.getFiles(inputName).equals("")) {
						
					// list로 첨부된 파일들 가져오기
					List<MultipartFile> fileList = multi.getFiles(inputName);
					
					// 파일들 하나씩 꺼내서 업로드 하기
					for (MultipartFile file : fileList) {
						// 업로드 할 파일명 설정
						String uploadFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
						// 업로드 ex ) ~~~~\\resources\\upload\\2021101311425575_파일명.jpg
						file.transferTo(new File(uploadPath + uploadFileName));
						
						String imgCode = "IMG_" + String.format("%03d", nextNum++);
						
						imgList.add(new ImgVO(imgCode, file.getOriginalFilename(), uploadFileName, itemCode, "N"));
						
					}
					
				}
					
				}
				// 단일 업로드
				else {
					
					if (!multi.getFile(inputName).equals("")) {
						
					// name 속성으로 input 태그에 첨부된 파일 가져오기
					MultipartFile file = multi.getFile(inputName);
					// 업로드 할 파일명 설정
					String uploadFileName = FileUploadUtil.getNowDateTime() + "_" + file.getOriginalFilename();
					// 지정한 경로에 파일 첨부
					file.transferTo(new File(uploadPath + uploadFileName));
					
					String imgCode = "IMG_" + String.format("%03d", nextNum++);
					
					imgList.add(new ImgVO(imgCode, file.getOriginalFilename(), uploadFileName, itemCode, "Y"));
					
					}
					
				}
				
			} catch (IllegalStateException e) {
				// 업로드 예외 발생 시
				e.printStackTrace();
			} catch (IOException e) {
				// 파일 입출력 예외 발생 시
				e.printStackTrace();
			}
			
		}
		
		// 이미지 정보 아이템에 넣기
		itemVO.setImgList(imgList);
		
		// 아이템에 코드 넣기
		itemVO.setItemCode(itemCode);
		
		// 상품 정보 INSERT
		itemService.insertItem(itemVO);
		
		// 상품 이미지 정보 INSERT
		itemService.insertItemImgList(itemVO);
		
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
