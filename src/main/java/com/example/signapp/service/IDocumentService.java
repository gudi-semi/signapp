package com.example.signapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.SignForm;
import com.example.signapp.mapper.DocumentMapper;

@Service
public class IDocumentService implements DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    @Override
    public List<Document> getDocumentList() {
        return documentMapper.selectDocumentList();
    }

    @Override
    public void writeDocument(Document document) {
        documentMapper.writeDocument(document);
    }

    // 문서 번호로 문서 하나 조회
	@Override
	public Document getDocumentByNo(int documentNo) {
		return documentMapper.selectDocumentByNo(documentNo);
	}
	
	// 문서 수정
	@Override
	public int updateDocument(Document document) {
		return documentMapper.updateDocument(document);
	}

	// 문서 삭제
	@Override
	public int deleteDocument(Document document) {
		return documentMapper.deleteDocument(document);
	}
	@Override
	public void updateDocumentStatus(int documentNo, String status) {
	        Document document = new Document();
	        document.setDocumentNo(documentNo);
	        document.setDocumentStatus(status);
	        documentMapper.updateDocumentStatus(document);
	    }

}
