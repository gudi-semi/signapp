package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.SignForm;
@Mapper
public interface SignMapper {
	int insertSign(SignForm signForm);
}
