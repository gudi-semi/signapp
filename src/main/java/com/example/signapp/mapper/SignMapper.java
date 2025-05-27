package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.signapp.dto.SignForm;

@Mapper
public interface SignMapper {
    int addSignLevel1(SignForm signForm);  // level1 결재 처리
    int addSignLevel2(SignForm signForm);  // level2 결재 처리
    SignForm selectSignByDocumentNo(int documentNo); // 서명 불러오기
    int deleteOldSignsExceptLatest(@Param("documentNo") int documentNo); // 서명 중복된것 삭제
}
