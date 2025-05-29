package com.example.signapp.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.signapp.dto.SignForm;
import com.example.signapp.mapper.SignMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class SignService {
    @Autowired
    private SignMapper signMapper;
    @Autowired
    private DocumentService documentService;
    // Base64 문자열을 DB에 저장하는 메서드
    public boolean saveSignBase64(SignForm signForm, int level) {
        try {
            if (level == 1) {
                String base64Img = signForm.getFileNameLv1(); // data:image/png;base64,... 포함
                if (base64Img != null && base64Img.contains(",")) {
                    // DB에는 전체 문자열 저장 (웹에서 그대로 출력 가능)
                    signForm.setFileNameLv1(base64Img);
                } else {
                    throw new IllegalArgumentException("유효하지 않은 base64 문자열입니다. (Level 1)");
                }
            } else if (level == 2) {
                String base64Img = signForm.getFileNameLv2();
                if (base64Img != null && base64Img.contains(",")) {
                    signForm.setFileNameLv2(base64Img);
                } else {
                    throw new IllegalArgumentException("유효하지 않은 base64 문자열입니다. (Level 2)");
                }
            } else {
                throw new IllegalArgumentException("지원되지 않는 서명 레벨입니다. (1 또는 2만 허용)");
            }
        } catch (Exception e) {
            log.error("서명 저장 중 오류 발생", e);
            throw new RuntimeException("서명 저장 실패: " + e.getMessage());
        }

        return true;
    }

    public void addSignLevel1(SignForm signForm) {
        signMapper.addSignLevel1(signForm);
    }

    public void addSignLevel2(SignForm signForm) {
        signMapper.addSignLevel2(signForm);
    }
    
    // 서명 불러오기 (문서 번호 기준)
    public SignForm getSignByDocumentNo(int documentNo) {
        return signMapper.selectSignByDocumentNo(documentNo);
    }
    public SignForm getSignStatusByDocumentNo(int documentNo) {
        SignForm result = signMapper.selectSignByDocumentNo(documentNo);

        if (result != null) {
            String lv1 = result.getSignStatusLv1();
            String lv2 = result.getSignStatusLv2();

            if ("반려".equals(lv2) || "반려".equals(lv1)) {
                documentService.updateDocumentStatus(documentNo, "반려");
            } else if ("보류".equals(lv2) || "보류".equals(lv1)) {
                documentService.updateDocumentStatus(documentNo, "보류");
            } else if ("대기".equals(lv1) && "승인".equals(lv2)) {
                documentService.updateDocumentStatus(documentNo, "진행중");
            } else if ("승인".equals(lv1)) {
                documentService.updateDocumentStatus(documentNo, "승인");
            }
        }

        return result;
    }
}
