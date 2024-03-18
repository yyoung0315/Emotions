package com.yoon.emotions.vo;

import java.util.Date;

import lombok.*;


@Data
@Getter
@Setter
public class EmotionsVO {
	/**
	 * board_no
	 */
	private int boardno;
	/**
	 * 1차분류 코드
	 */
	private String cls1Cd;
	/**
	 * 1차분류 코드명
	 */
	private String cls1Nm;
	/**
	 * 1차분류 사용유무
	 */
	private String cls1Yn;
	/**
	 * 2차분류 코드
	 */
	private String cls2Cd;
	/**
	 * 2차분류 코드명
	 */
	private String cls2Nm;
	/**
	 * 2차분류 사용유무
	 */
	private String cls2Yn;
	/**
	 * 2차분류 이모티콘사진이름
	 */
	private String cls2ImgNm;
	/**
	 * 3차분류 코드
	 */
	private int cls3Cd;
	
	/**
	 * 3차분류 코드명
	 */
	private String cls3Nm;
	/**
	 * 3차분류 사용유무
	 */
	private String cls3Yn;
	/**
	 * 등록일시
	 */
	private Date claInputDt;
	/**
	 * 수정일시
	 */
	private Date claUpdateDt;
	
}
