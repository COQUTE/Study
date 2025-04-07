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
public class Club {
	
	private String clubId;
	private String clubName;
	private int stdAmount;
	private String presidentId;
	private String clubManagerId;
	private String clubRoom;
	
	@Override
	public String toString() {
		return "동아리명: " + clubName
				+ "\n총인원: " + stdAmount
				+ "\n동아리 회장 아이디: " + presidentId
				+ "\n지도교수 아이디: " + clubManagerId
				+ "\n동아리실: " + clubRoom;
	}
}
