package com.forreport.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.forreport.domain.PageDTO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.SearchingVO;
import com.forreport.domain.UploadVO;
import com.forreport.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	private ProductService productService;

	/* 각 페이지별로 조건(키워드, 카테고리)과 페이지 번호에 맞는 게시글 출력 */
	@GetMapping("list.fr")
	public void productPage(SearchingVO searchingVO, Model model) {
		
		int total = productService.getTotal(searchingVO);
		
		PageDTO pageDTO = new PageDTO(searchingVO, total);
		
		System.out.println(pageDTO);
		
		List<ProductVO> productList = productService.getProductListWithPaging(searchingVO);
				
		model.addAttribute("pageDTO", pageDTO);
		model.addAttribute("productList", productList);		
		
	}
	
	/* 댓글을 제외한 전체 상품 상세 뷰 살펴보기 -> 댓글은 ReviewController + Ajax를 이용해 확인 가능*/
	@GetMapping("view.fr")
	public void productView(int pronum, Model model) {
		
		ProductVO productVO = productService.getProduct(pronum);
		
		System.out.println(productVO);
						
		model.addAttribute("productVO", productVO);
	}
	
	/* 상품 등록 전 규정 및 주의사항 */
	@GetMapping("agree.fr")
	public void productUploadAgree() {
		log.info("agree.fr");		
	}
	
	/* 상품 등록 관련 내용 작성*/
	@PostMapping("write.fr")
	public void productWrite() {
		log.info("write.fr -> 상품 등록 창 출력");
	}
	
	/* 상품 서버 등록 */
	@PostMapping("upload.fr")
	public void productUpload(MultipartFile uploadFile, ProductVO productVO) {
				
		log.info("last productVO: " + productVO);
		
		log.info("upload.fr -> 상품 등록 진행");
		log.info("uploadFile: " + uploadFile);
		
		String uploadFolder = "C:\\upload";
		
		// 파일 업로드할 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("uploadPath: " + uploadPath);
		
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
			
			 // File의 경로에 파일이 있는지 확인 >> 없을 경우 mkdirs를 이용해 폴더 생성
			 // File.mkdirs():: 상위 폴더가 없을경우 상위폴더들까지 생성
		}
		
		// 파일의 원래 이름을 UploadVO에 저장
		UploadVO uploadVO = new UploadVO();
		
		log.info("upload File Name: " + uploadFile.getOriginalFilename());
		log.info("upload File Size: " + uploadFile.getSize());
		
		// IE인 경우 파일의 기존 디렉토리까지 다 나오기 때문에 파일 찐 이름만 가져오기 위해 subString 처리
		// 파일 이름은 uploadVO, productVO 각각 저장
		String uploadFileName = uploadFile.getOriginalFilename();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1); 
		
		productVO.setProname(uploadFileName);		
		uploadVO.setFileName(uploadFileName);
		log.info("original File Name: " + uploadFileName);
		
		// 중복방지를 위한 UUID 생성
		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString()+"_"+uploadFileName;
		
		
		File saveFile = null;
		try {
			
			// 위에서 만들어둔 오늘 날짜로 된 폴더에 파일 업로드하기 위한 셋팅
			saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile); // 업로드하려고 브라우저에서 올린 파일을 해당 위치에 저장
			
			uploadVO.setUUID(uuid.toString());
			uploadVO.setFileDirectory(uploadPath.toString());
			
			log.info("uploadVO.getUUID: " + uploadVO.getUUID());
			log.info("uploadVO.getFileDirectory: " + uploadVO.getFileDirectory());
			
		} catch(Exception e) {
			
			log.error(e.getMessage());
			
		} // try - catch
		
		
		log.info("last productVO: " + productVO);
		log.info("last uploadVO: " + uploadVO);
		
		productService.makeThumbnail(uploadVO, productVO.getLargeCa());
				
	} // END: productUpload
	
	/*날짜별 폴더 만들어 파일 분산 저장*/
	private String getFolder() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		return str.replace("-", File.separator);
	}
	
}