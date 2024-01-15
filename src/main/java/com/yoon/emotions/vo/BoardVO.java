package com.yoon.emotions.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class BoardVO {
	/**
	 * 게시글번호 PK
	 */
	private int board_no;
	/**
	 * 화면용num
	 */
	private int rownum;
	/**
	 * 제목
	 */
	private String board_title;
	/**
	 * 내용
	 */
	private String board_detail;
	/**
	 * 감정 분류
	 */
	private String emotions;
	/**
	 * 슬픈감정 횟수
	 */
	private int  sad_emotions;
	/**
	 * 작성자 FK
	 */
	private String user_id;
	/**
	 * 프로필사진이름
	 */
	private String profil_name;
	/**
	 * 프로필사진
	 */
	private MultipartFile profil_img;
	/**
	 * 입력_일시
	 */
	private Date board_input_dt;
	/**
	 * 수정_일시
	 */
	private Date board_update_dt;
	/**
	 * 글 비공개 여부
	 */
	private String hide;
	
	/**
	 * 해당 글의 댓글 갯수
	 */
	private int reply_count;
	
	/**
	 * 2차분류 코드
	 */
	private String cls2_cd;
	/**
	 * 2차분류 코드명
	 */
	private String cls2_nm;
	/**
	 * 2차분류 이미지명
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
	 * 검색 조건 
	 */
	private String search1 ;
	/**
	 * 검색 내용
	 */
	private String search2 ;
	
	//페이징
	
	/**
	 * 각페이지 데이터 시작점
	 */
	private int start;
	/**
	 * 페이지 갯수 재설정
	 */
	private int pagelen;
	/**
	 * 한페이지에 데이터 갯수
	 */
	private int len;
	
	// 이전글 다음글 
	
	/**
	 * 이전글 번호
	 */
	private int beforeNum;
	/**
	 * 이전글 제목
	 */
	private String beforeTitle;
	/**
	 * 다음글 번호
	 */
	private int nextNum;
	/**
	 * 다음글 제목
	 */
	private String nextTitle;
	/**
	 * 날짜 일 만 출력 
	 */
	private int inputDay;
}
