package com.yoon.emotions.vo;

import lombok.Data;

@Data
public class PagingVO {

	/**
	 * 페이징 한블럭의 길이 
	 */
	private int pagelen;
	/**
	 * 각페이지의 시작
	 */
	private int start ;
	/**
	 * 전체 페이지 수
	 */
	private int totalPages;	
	/**
	 *현재 내가 속해 있는 블럭
	 */
	private int currentBlock;
	/**
	 * 페이징 블럭 시작점
	 */
	private int startPage;
	/**
	 * 페이징 블럭 마지막점
	 */
	private int endPage;
	/**
	 * 현재 페이지
	 */
	private int nowPage;
	/**
	 * 전체 레코드 수
	 */
	private int totalCount;
	/**
	 * 검색조건
	 */
	private String search1;
	/**
	 * 검색어
	 */
	private String search2;
	
}
