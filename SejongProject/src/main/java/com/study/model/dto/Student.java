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
	
	// printGrade에 필요한 변수 선언
	private String lctName; // 강의 이름
	private String lctSemester; // 수강한 학기
	private String grade; // 수강한 강의 점수
	private int credit; // 수강한 강의 취득학점
	
	
	// 리스트를 활용해 학생의 각 과목별 점수 및 학기, 점수, 취득학점을 보관하기위해 선언
	public Student(String lctName, String lctSemester, String grade, int credit) {
		super();
		this.lctName = lctName;
		this.lctSemester = lctSemester;
		this.grade = grade;
		this.credit = credit;
	}



	public Student(String stdId) {
		this.stdId = stdId;
	}
}
