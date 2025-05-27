package com.example.signapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.signapp.dto.SignForm;
import com.example.signapp.service.SignService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController // Controller + ResponseBoy
public class SignRest {
	@Autowired SignService signService;
	@PostMapping("/signLevel2")
	public String addSign(SignForm signForm,  HttpSession session, Model model) {
		SignForm loginEmployee = (SignForm) session.getAttribute("loginEmployee");
		
	    model.addAttribute("signForm", signForm);
	    model.addAttribute("approverId", loginEmployee);
	    
	    signService.addSign(signForm);
	    
	    return "결재완료";
	}
	
	@PostMapping("/signLevel1")
	public String confirmSign(SignForm signForm,  HttpSession session, Model model) {
		  SignForm loginEmployee = (SignForm) session.getAttribute("loginEmployee");

		 
		    model.addAttribute("signForm", signForm);
		    model.addAttribute("approverId", loginEmployee);
		log.info(signForm.toString());
		
		signService.confirmSign(signForm);
		return "결제완료";
	}
	
}
