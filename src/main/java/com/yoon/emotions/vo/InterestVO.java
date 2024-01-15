package com.yoon.emotions.vo;

import java.util.Date;

import lombok.Data;

@Data
public class InterestVO {

	/**
	 * 관심글고유번호 FK
	 */
	private int board_no;
	/**
	 * 관심글을 등록한 아이디
	 */
	private String user_id; 
	
	/**
	 * 관심글 등록 일자
	 */
	private Date it_input_dt;

}
