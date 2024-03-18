package com.yoon.emotions.vo;

import java.util.Date;

import lombok.Data;

@Data
public class InterestVO {

	/**
	 * 관심글고유번호 FK
	 */
	private int boardNo;
	/**
	 * 관심글을 등록한 아이디
	 */
	private String userId;
	
	/**
	 * 관심글 등록 일자
	 */
	private Date ITInputDt;

}
