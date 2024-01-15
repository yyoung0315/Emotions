package com.yoon.emotions.vo;

import java.util.Date;

import lombok.Data;


@Data
public class EmotionsVO {
	/**
	 * board_no
	 */
	private int board_no;
	/**
	 * 1차분류 코드
	 */
	private String cls1_cd;
	/**
	 * 1차분류 코드명
	 */
	private String cls1_nm;
	/**
	 * 1차분류 사용유무
	 */
	private String cls1_yn;
	/**
	 * 2차분류 코드
	 */
	private String cls2_cd;
	/**
	 * 2차분류 코드명
	 */
	private String cls2_nm;
	/**
	 * 2차분류 사용유무
	 */
	private String cls2_yn;
	/**
	 * 2차분류 이모티콘사진이름
	 */
	private String cls2_img_nm;
	/**
	 * 3차분류 코드
	 */
	private int cls3_cd;
	
	/**
	 * 3차분류 코드명
	 */
	private String cls3_nm;
	/**
	 * 3차분류 사용유무
	 */
	private String cls3_yn;
	/**
	 * 등록일시
	 */
	private Date cl_input_dt;
	/**
	 * 수정일시
	 */
	private Date cl_update_dt;
	
}
