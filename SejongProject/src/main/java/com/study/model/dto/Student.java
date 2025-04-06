package com.study.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Student {
	
	private String stdId;
	private String stdName;
	private String stdAddress;
	private String stdPhone;
	private String stdEmail;
	private String Major;
	private String Minor;
	private String AccountNum;
	
	public Student(String stdId) {
		this.stdId = stdId;
	}
}
