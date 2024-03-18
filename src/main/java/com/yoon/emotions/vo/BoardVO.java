package com.yoon.emotions.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;


@Data
public class BoardVO {
	/**
	 * 게시글번호 PK
	 */
	private int boardno;
	/**
	 * 화면용num
	 */
	private int rownum;
	/**
	 * 제목
	 */
	private String boardtitle;
	/**
	 * 내용
	 */
	private String boarddetail;
	/**
	 * 감정 분류
	 */
	private String emotions;
	/**
	 * 슬픈감정 횟수
	 */
	private int  sademotions;
	/**
	 * 작성자 FK
	 */
	private String userid;
	/**
	 * 프로필사진이름
	 */
	private String profilname;
	/**
	 * 프로필사진
	 */
	private MultipartFile profilimg;
	/**
	 * 입력일시
	 */
	private Date boardinputdt;
	/**
	 * 수정일시
	 */
	private Date boardupdatedt;
	/**
	 * 글 비공개 여부
	 */
	private String hide;
	
	/**
	 * 해당 글의 댓글 갯수
	 */
	private int replycount;
	
	/**
	 * 2차분류 코드
	 */
	private String cls2cd;
	/**
	 * 2차분류 코드명
	 */
	private String cls2nm;
	/**
	 * 2차분류 이미지명
	 */
	private String cls2imgnm;
	/**
	 * 3차분류 코드
	 */
	private int cls3cd;
	/**
	 * 3차분류 코드명
	 */
	private String cls3nm;
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
