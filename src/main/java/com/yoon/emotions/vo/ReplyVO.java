package com.yoon.emotions.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	/**
	 * 댓글고유번호 PK
	 */
	private int replyNo;
	/**
	 * 댓글레벨
	 */
	private int levelNo;
	/**
	 * 메인글고유번호 FK
	 */
	private int boardNo;
	/**
	 * 댓글내용
	 */
	private String text;
	/**
	 * 댓글내용 null값 비교용
	 */
	private String text2;
	/**
	 * 사용자아이디
	 */
	private String userId;
	/**
	 * 참조용댓글고유번호
	 */
	private int rfreplyNo;
	/**
	 * 댓글작성일자
	 */
	private Date replyInputDt;
	/**
	 * 댓글수정일자
	 */
	private Date replyUpdateDt;
	/**
	 * 부모댓글 작성자 아이디
	 */
	private String pUserId;
}
