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
import com.example.signapp.service.DocumentService;
import com.example.signapp.service.SignService;

import jakarta.servlet.http.HttpSession;
@Controller
public class SignController {
	
	@Autowired DocumentService documentService;
	@Autowired SignService signService;
	// 레벨1사인로 수정
	@GetMapping("/signLevel1")
	public String signLevel1(@RequestParam int documentNo
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
    	
    	// 2) 조회한 문서를 모델에 담아서 JSP로 넘김
    	model.addAttribute("document", document);
    	
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
    public String docList(Model model) {
        List<Document> documentList = documentService.getDocumentList();
        model.addAttribute("documentList", documentList);
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
  
}
