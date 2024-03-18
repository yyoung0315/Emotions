package com.yoon.emotions.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO {
	
	/**
	 * 사용자ID PK
	 */
	private String 	userId;
	/**
	 * 비밀번호
	 */
	private String 	pwd;
	/**
	 * 이전 비밀번호
	 */
	private String 	beforePwd;
	/**
	 * 비밀번호 틀림갯수
	 */
	private int 	pwdWrongCount;
	/**
	 * 성명
	 */
	private String 	name;
	/**
	 * 생년월일
	 */
	private String  bDay;
	/**
	 * 전화번호
	 */	
	private String  tel;
	/**
	 * 우편번호
	 */	
	private String  addressNum;
	/**
	 * 도로명주소
	 */	
	private String  address;
	/**
	 * 입력일시
	 */	
	private Date  	userInputDt;
	/**
	 * 수정일시
	 */	
	private Date  	userUpdateDt;
	/**
	 * 접속일자
	 */	
	private Date  	loginInputDt;
	/**
	 * 권한
	 */
	private String authId;
	/**
	 * 감정횟수
	 */
	private int sadEmoCount;
	
	/**
	 * 프로필사진이름
	 */
	private String profilName;
	/**
	 * 프로필사진
	 */
	private MultipartFile profilImg;
	
}
