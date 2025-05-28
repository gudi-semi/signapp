package com.example.signapp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Page;
import com.example.signapp.mapper.DocumentMapper;

@Service
public class IDocumentService implements DocumentService {

    @Autowired
    private DocumentMapper documentMapper;

    @Override
    public List<Document> getDocumentList(Page page) {
        return documentMapper.selectDocumentList(page);
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
	// 페이징 및 검색 땜에 맹금
	@Override
	public int getTotalCount(String searchOption, String searchWord) {
		Map<String, Object> param = new HashMap<>();
	    param.put("searchOption", searchOption);
	    param.put("searchWord", searchWord);
	    return documentMapper.getTotalCount(param);
	}
	
	// filter
	@Override
	public List<Document> getDocumentListLevel1(Page page) {
		return documentMapper.selectDocumentListLevel1(page);
	}
	
	@Override
	public int getTotalCountLevel1(String searchOption, String searchWord) {
		Map<String, Object> param = new HashMap<>();
	    param.put("searchOption", searchOption);
	    param.put("searchWord", searchWord);
	    return documentMapper.getTotalCountLevel1(param);
	}
	
	@Override
	public List<Document> getDocumentListLevel2(Page page) {
		return documentMapper.selectDocumentListLevel2(page);
	}
	
	@Override
	public int getTotalCountLevel2(String searchOption, String searchWord) {
		Map<String, Object> param = new HashMap<>();
		param.put("searchOption", searchOption);
		param.put("searchWord", searchWord);
		return documentMapper.getTotalCountLevel2(param);
	}
}
