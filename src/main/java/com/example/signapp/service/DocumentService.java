package com.example.signapp.service;

import java.util.List;

import com.example.signapp.dto.Document;

public interface DocumentService {
    void writeDocument(Document document);
    List<Document> getDocumentList();
    
 // 문서상세보기(문서번호를 받아 문서 한개 반환)
 	Document getDocumentByNo(int documentNo);
}
