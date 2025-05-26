package com.example.signapp.dto;



import lombok.Data;
@Data
public class SignForm {
	private int signId;
	private int documentNo;
	private String approverId;
	private String signStatusLv1;
	private String signStatusLv2;
	private String signTime;
	private String fileName;
	
}
