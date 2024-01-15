package com.yoon.emotions.vo;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	/**
	 * 댓글고유번호 PK
	 */
	private int reply_no;
	/**
	 * 댓글레벨
	 */
	private int level_no;
	/**
	 * 메인글고유번호 FK
	 */
	private int board_no;
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
	private String user_id; 
	/**
	 * 참조용댓글고유번호
	 */
	private int rf_reply_no;
	/**
	 * 댓글작성일자
	 */
	private Date reply_input_dt;
	/**
	 * 댓글수정일자
	 */
	private Date reply_update_dt;
	/**
	 * 부모댓글 작성자 아이디
	 */
	private String puser_id; 
}
