package com.example.signapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Employee;
import com.example.signapp.dto.Page;
import com.example.signapp.dto.SignForm;
import com.example.signapp.service.DocumentService;
import com.example.signapp.service.SignService;

import jakarta.servlet.http.HttpSession;
@Controller
public class SignController {
	
	@Autowired DocumentService documentService;
	@Autowired SignService signService;
	// 레벨1사인로 수정
	@GetMapping("/signLevel1")
	public String signLevel1(@RequestParam Integer documentNo
							, Model model) {
		model.addAttribute("documentNo", documentNo);
		return "signLevel1";
	}
	
	// 레벨2사인 추가
	@GetMapping("/signLevel2")
	public String signLevel2(@RequestParam int documentNo
							, Model model) {
		model.addAttribute("documentNo", documentNo);
		return "signLevel2";
	}
	

	   // 상세보기
    @GetMapping("/docView")
    public String docView(int documentNo, Model model) {
    	// 1) 문서 번호로 문서 조회
    	Document document = documentService.getDocumentByNo(documentNo);
    	SignForm sign = signService.getSignByDocumentNo(documentNo); // 서명 불러오기
    	// 2) 조회한 문서를 모델에 담아서 JSP로 넘김
    	model.addAttribute("document", document);
    	model.addAttribute("sign", sign); // JSP에서 ${sign.xxx}로 사용 가능
    	// 3) docOne 페이지로 이동
    	return "docView";
    	
    }

    @GetMapping("/docWrite")
    public String showWriteForm(Model model, Document document) {
        model.addAttribute("document", document);
        return "docWrite";  
    }

 
    @PostMapping("/writeDocument")
    public String writeDocument(@ModelAttribute Document document, HttpSession session) {
        // 로그인한 직원 정보 세션에서 꺼내기
        Employee loginEmployee = (Employee) session.getAttribute("loginEmployee");
       
        if (loginEmployee == null) {
            return "redirect:/login";  
        }

 
        document.setEmployeeId(loginEmployee.getEmployeeId());

        // 문서 저장
        documentService.writeDocument(document);

        return "redirect:/docList";  
    }
    @GetMapping("/docList")
    public String docList(Model model
    					,@RequestParam(defaultValue = "1") int currentPage
    					,@RequestParam(defaultValue = "10") int rowPerPage
    					,@RequestParam(defaultValue = "all") String searchOption
    					,@RequestParam(defaultValue = "") String searchWord) {
    	// 페이징 및 검색기능 위해 page 객체 생성
    	// 검색 옵션 및 단어에 따라 총 수 구하기 위해 맹글었음
    	int totalCount = documentService.getTotalCount(searchOption, searchWord);
    	Page page = new Page(rowPerPage, currentPage, totalCount, searchOption, searchWord);
    	
        List<Document> documentList = documentService.getDocumentList(page);
        model.addAttribute("documentList", documentList);
        // model에 page 넣기
        model.addAttribute("page", page);
        //두개의 상태값 비교해서 doc의 상태 업데이트
        for (Document doc : documentList) {
        	if (doc == null) continue;
            signService.getSignStatusByDocumentNo(doc.getDocumentNo());
        }
        
        System.out.println("searchOption=" + searchOption + ", searchWord=" + searchWord);
        System.out.println("Page searchOption=" + page.getSearchOption() + ", searchWord=" + page.getSearchWord());

        return "docList";
    }
    // filter - level1
    @GetMapping("/level1/level1List")
    public String level1List() {
    	
    	return "level1List";
    }
    
    // filter - level2
    @GetMapping("/level2/level2List")
    public String level2List(HttpSession session) {
    	
    	return "level2/level2List";
    }
    
    
    // 문서 수정
    @GetMapping("/updateDocView")
    public String updateDocument(Model model, @RequestParam("documentNo") int documentNo) {
    	Document doc = documentService.getDocumentByNo(documentNo);
    	model.addAttribute("document", doc);
    	return "updateDocView";
    }
   
    @PostMapping("/updateDocView")
    public String updateDocument(Document document) {
    	documentService.updateDocument(document);
    	return "redirect:/docList";
    }
    
    
    // 문서 삭제
    @PostMapping("/deleteDocView")
    public String deleteDocument(Model model, Document document) {
    	documentService.deleteDocument(document);
    	return "redirect:/docList";
    }
  
}
