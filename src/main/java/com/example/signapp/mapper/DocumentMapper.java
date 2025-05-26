package com.example.signapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.Document;
@Mapper
public interface DocumentMapper {
	void writeDocument(Document document);
	List<Document> selectDocumentList();
	
	// 문서상세보기(문서번호를 받아 문서 한개 반환)
	Document selectDocumentByNo(int documentNo);
}
