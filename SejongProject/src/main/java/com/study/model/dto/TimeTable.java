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
public class TimeTable {
	private String stdId;
	private String stdName;
	private String lctName;
	private String classId;
	private char day;
	private int period;
	private int hour;
	private String classroom;
	
	//SELECT STD_ID, STD_NAME, LCT_NAME, L.CLASS_ID, DAY, PERIOD, HOUR, CLASSROOM

}
