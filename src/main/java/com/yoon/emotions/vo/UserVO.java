package com.yoon.emotions.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserVO {
	
	/**
	 * 사용자ID PK
	 */
	private String 	user_id;
	/**
	 * 비밀번호
	 */
	private String 	pwd;
	/**
	 * 이전 비밀번호
	 */
	private String 	before_pwd;
	/**
	 * 비밀번호 틀림갯수
	 */
	private int 	pwd_wrong_count;
	/**
	 * 성명
	 */
	private String 	name;
	/**
	 * 생년월일
	 */
	private String  bday;
	/**
	 * 전화번호
	 */	
	private String  tel;
	/**
	 * 우편번호
	 */	
	private String  address_num;
	/**
	 * 도로명주소
	 */	
	private String  address;
	/**
	 * 입력일시
	 */	
	private Date  	user_input_dt;
	/**
	 * 수정일시
	 */	
	private Date  	user_update_dt;
	/**
	 * 접속일자
	 */	
	private Date  	login_input_dt;
	/**
	 * 권한
	 */
	private String auth_id;
	/**
	 * 감정횟수
	 */
	private int sad_emotions;
	
	/**
	 * 프로필사진이름
	 */
	private String profil_name;
	/**
	 * 프로필사진
	 */
	private MultipartFile profil_img;
	
}
