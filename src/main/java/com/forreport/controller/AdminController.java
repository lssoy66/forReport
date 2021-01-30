package com.forreport.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forreport.domain.PageDTO;
import com.forreport.domain.ProductVO;
import com.forreport.domain.ReviewCriteria;
import com.forreport.domain.SearchingVO;
import com.forreport.domain.UploadVO;
import com.forreport.service.OrderService;
import com.forreport.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	OrderService orderService;
	
	@Setter(onMethod_ = @Autowired)
	ProductService productService;
	
	// 관리자 주문리스트 관리
	@GetMapping("orderList.fr")
	public void adminTestPage(ReviewCriteria criteria, Model model) {
		log.info("controller ~ start orderList");

		// Controller에서 비밀번호를 가져오는지 확인해봤습니다
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		UserDetails userDetails = (UserDetails) principal;
		log.info(userDetails.getPassword());
		
		// 페이징 처리 된 주문 목록 전달
		model.addAttribute("orderList", orderService.getOrderListAllWithPaging(criteria));
		
		// 화면 페이지 처리를 위한 정보 전달
		model.addAttribute("pageMaker", new PageDTO(criteria, orderService.getTotalCount(criteria)));
	}
	
	// 관리자 상품리스트 관리
	@GetMapping("productList.fr")
	public void adminProduct(SearchingVO searchingVO, Model model) {
		
		log.info("adminProduct");
		log.info("criteria.getPageNum(): " + searchingVO.getPageNum());
		log.info("criteria.getAmount(): " + searchingVO.getAmount());
		log.info("criteria.getApproval(): " + searchingVO.getApproval());		
		
		log.info("productList: " + productService.getProductListWithPagingInAdmin(searchingVO));
		log.info("new PageDTO(searchingVO, productService.getTotal(searchingVO): " + new PageDTO(searchingVO, productService.getTotal(searchingVO)));
		log.info("productService.getTotal(searchingVO): " + productService.getTotal(searchingVO));
		// 페이징 처리된 상품 목록 전달
		model.addAttribute("productList", productService.getProductListWithPagingInAdmin(searchingVO));

		// 화면 페이지 처리를 위한 정보 전달
		model.addAttribute("pageMaker", new PageDTO(searchingVO, productService.getTotalInAdmin(searchingVO)));
		log.info("productService.getTotalInAdmin(searchingVO): " + productService.getTotalInAdmin(searchingVO));
		log.info("searchingVO: "+searchingVO);
		
		// 승인 여부 전달 -> 999는 전체 승인, 0 미승인, 1 승인, 2 승인 거부, 3 삭제 요청
		model.addAttribute("approval", searchingVO.getApproval());
				
		// form:form 객체에서 사용하기 위한 productVO 보내기
		model.addAttribute("productVO", new ProductVO());
	}
	
	/* 넘어온 list들 중 id가 change인 경우 approval 수정 + 회원 등급 수정 */
	@PostMapping(value="approvalProcess.fr")
	@Transactional
	public String approvalProcess(ProductVO productVO, int approval){
		
		log.info("approvalProcess...");
		log.info("approvalProcess ProductVO: " + productVO);
		log.info("길이: " + productVO.getProductVOList().size());
		 
		for(int i = 0; i<productVO.getProductVOList().size(); i++) {
			if(productVO.getProductVOList().get(i).getProdsc().equals("change")) {
				// approval 수정 + 등급 조정
				productService.updateApprovalAndGrade(productVO.getProductVOList().get(i));
				log.info("productVO.getProductVOList().get(i): " + productVO.getProductVOList().get(i));
			}
		}
		
		// 승인 변경 후 다시 페이지로 돌아감
		return "redirect:/admin/productList.fr?approval="+approval;

	}
	
	// 다운로드
	@RequestMapping(value = "download.fr",
					produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody
	public ResponseEntity<Resource> downloadFile(@RequestHeader("User-Agent") String userAgent, int pronum){
		// 브라우저에 따라 다른 다운로드를 구현하기 위해 RequestHeader 사용
		
		log.info(pronum);
		
		// 썸네일 정보를 가져와서 파일 다운로드 구현
		UploadVO uploadVO = productService.getThumbnail(pronum);
		log.info(uploadVO);
		
		Resource resource = new FileSystemResource(uploadVO.getFileDirectory()+"\\"+uploadVO.getUUID()+"_"+uploadVO.getFileName());
		log.info("resource: " + resource);
		
		if(resource.exists()==false) { // 파일이 존재하지 않는 경우 >> header에 없다고 전달
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		
		String resourceName = resource.getFilename();
		log.info("resourceName: " + resourceName);
		
		String resourceOriginalName = resourceName.substring(resourceName.indexOf("_")+1); // 만약 원본파일에 _가 있으면? 노상관 어차피 가장 앞에있는 _를 인식한다.
		log.info("resourceOriginalName: " + resourceOriginalName);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			
			/*
			 * 533P 브라우저 처리
			 * 
			 * User-Agent
			 * - Http의 헤더 메시지 중에서 디바이스의 정보를 알 수 있는 헤더
			 * - IE의 경우 UserAgent값에 Trident를 가지고 있다.(예전에는 MISE로 해서 찾았는데 마이크로소프트가 없애버렸다....)
			 * - 그 외 브라우저는 safari, chrome 등으로 브라우저 이름을 입력해주면 된다.
			 * 
			 * URLEncoder.encode()
			 * - 한글을 표현하지 못하는 경우 한글을 ASCII값으로 인코딩해주어야한다. 이럴 때 URLEncoder 반대의 경우 URLDecoder를 사용한다.
			 * - URLEncoder.encode(Stirng string, "UTF-8"): string을 UTF-8 형식으로 인코딩해서 URL에 알맞게 변형해준다.
			 * 
			 * replaceAll?
			 * IE는 공백문자를 제대로 처리를 못한다. 그래서 강제로 공백문자로 변경을 해주어야 한다. 그 외는 알아서 지들이 공백 처리
			 * 	ex) 이은지 test1.png
			 * 	> replace전: 이은지+test1.png
			 * 	> replace후: 이은지 test1.png
			 * ... 그냥 기호,문자로 +가 표현되려면 \+로 적어야하고 \+를 살리기 위해서는 \\+라고 적은 후 여기를 공백으로 바꿔야한다.
			 * 
			 * "ISO-8859-1" 처리가 필요한 경우, 아닌 경우 브라우저에 따라 다른가요?
			 */
			
			String downloadName = null;
			
			if(userAgent.contains("Trident")) { // IE인 경우
				
				log.info("IE browser");
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
				log.info("replace전 downloadName: " + downloadName);
				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8").replaceAll("\\+", " ");
				log.info("replace후 downloadName: " + downloadName);
				
			} else if(userAgent.contains("Edge")) { // Edge인 경우
				
				log.info("Edge Browser");				
				downloadName = URLEncoder.encode(resourceOriginalName, "UTF-8");
				log.info("Edge name: " + downloadName);
				
			} else { // 그외 (여기서는 임의로 Chrome으로 간주)
				
				log.info("Chrome brower");
				
				downloadName = new String(resourceOriginalName.getBytes("UTF-8"),"ISO-8859-1");
				
			}
			
			
			headers.add("Content-disposition", "attachment; filename=" + downloadName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Resource>(resource, headers, HttpStatus.OK); // resource 경로로 저장!
	}
	
	
	
}
