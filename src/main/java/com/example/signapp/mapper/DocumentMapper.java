package com.example.signapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Document;
import com.example.signapp.dto.Page;
@Mapper
public interface DocumentMapper {
	void writeDocument(Document document);
	List<Document> selectDocumentList(Page page);
	
	// 문서상세보기(문서번호를 받아 문서 한개 반환)
	Document selectDocumentByNo(int documentNo);
	
	// 문서 수정
	int updateDocument(Document document);
	
	// 문서 삭제
	int deleteDocument(Document document);
	
	//문서 상태 업데이트
	int updateDocumentStatus(Document document);
	
	int getTotalCount(Map<String, Object> param);
	
	// filter - level1 미결재서류목록
	List<Document> selectDocumentListLevel1(Page page);
	
	int getTotalCountLevel1(Map<String, Object> param);
	
	// filter - level2 미결재서류목록
	List<Document> selectDocumentListLevel2(Page page);
		
	int getTotalCountLevel2(Map<String, Object> param);
}
