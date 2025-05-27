package com.example.signapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.signapp.dto.SignForm;
@Mapper
public interface SignMapper {
	int addSign(SignForm signForm); // lv2
	int confirmSign(SignForm signForm); //lv1
}
