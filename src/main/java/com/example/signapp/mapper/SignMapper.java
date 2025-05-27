package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import com.example.signapp.dto.SignForm;

@Mapper
public interface SignMapper {
    int addSignLevel1(SignForm signForm);  // level1 결재 처리
    int addSignLevel2(SignForm signForm);  // level2 결재 처리
}
