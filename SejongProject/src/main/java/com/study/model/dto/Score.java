package com.study.model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Score {
	
	// printGrade에 필요한 변수 선언
		private String lctName; // 강의 이름
		private String lctSemester; // 수강한 학기
		private String grade; // 수강한 강의 점수
		private int credit; // 수강한 강의 취득학점

}
