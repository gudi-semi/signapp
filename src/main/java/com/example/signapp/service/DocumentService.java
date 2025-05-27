package com.example.signapp.service;

import java.util.List;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.SignForm;

public interface DocumentService {
    void writeDocument(Document document);
    
    List<Document> getDocumentList();
    
 // 문서상세보기(문서번호를 받아 문서 한개 반환)
 	Document getDocumentByNo(int documentNo);
 	
 	// 문서 수정
    int updateDocument(Document document);
    
    // 문서 삭제
	int deleteDocument(Document document);
	
	//문서 상태 업데이트
    void updateDocumentStatus(int documentNo, String documentStatus);

}
