package com.example.signapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class SignappApplication {

	public static void main(String[] args) {
		SpringApplication.run(SignappApplication.class, args);
	}

}
