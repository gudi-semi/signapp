package com.example.signapp.dto;



import lombok.Data;
@Data
public class SignForm {
	private int signId;
	private int documentNo;
	private String approverId;
	private String signStatsLv1;
	private String signStatsLv2;
	private String signTime;
	private String fileName;
	
}
