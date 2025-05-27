package com.example.signapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.SignForm;
import com.example.signapp.service.SignService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SignRest {
    @Autowired
    SignService signService;

    @PostMapping("/signLevel1")
    public String addSignLevel1(@RequestBody SignForm signForm) {
        signService.saveSignImageAndSetFileName(signForm, 1);
        signService.addSignLevel1(signForm);
        return "결재 성공";
    }

    @PostMapping("/signLevel2")
    public String addSignLevel2(@RequestBody SignForm signForm) {
        signService.saveSignImageAndSetFileName(signForm, 2);
        signService.addSignLevel2(signForm);
        log.info("DB저장 전 documentNo: {}", signForm.getDocumentNo());
        return "결재 성공";
    }



}
