package com.example.signapp.dto;

import lombok.Data;

@Data
public class Document {
    private int documentNo;
    private String documentTitle;
    private String documentContent;
    private String employeeId;
    private String employeeName;
    private String documentStatus;
}
