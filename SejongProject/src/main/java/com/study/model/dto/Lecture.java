package com.study.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Lecture {
	
	private int num;
	private String lctId;
	private String classId;
	private String profId;
	private String lctYear;
	private char lctSem;
	private String lctName;
	private char day;
	private int period;
	private int credit;
	private int hour;
	private String deptId;
	private String classroom;
	
	
	
	

}
