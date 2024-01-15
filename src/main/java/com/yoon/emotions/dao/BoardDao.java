package com.yoon.emotions.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yoon.emotions.vo.BoardVO;
import com.yoon.emotions.vo.EmotionsVO;
import com.yoon.emotions.vo.InterestVO;

@Mapper
public interface BoardDao {
	
	/**
	 * 나의기록/너의기록에서 내글 목록 띄우기
	 * @return 내가 쓴 글 목록
	 */
	List<BoardVO> recordList(String user_id, String search1, String search2, int start,int pagelen,String cls2_cd,String screen);
	
	/**
	 * 캘린더 띄우기
	 * @return 로그인 아이디로 조회되는 글의 2차분류감정/board_no
	 */
	List<BoardVO> myCalendar(String user_id,String cls2_yn, String nowYm);
	/**
	 * 당월에 쓴 글 갯수띄우기
	 * @return 로그인 아이디로 조회되는 글의 2차분류감정/board_no
	 */
	int myCalendarCount(String user_id,String cls2_yn, String nowYm);
	/**
	 * 유저마다 당일에 쓴글있는지 확인
	 * @return 당일 글이 있으면 1 없으면 0
	 */
	int toDay(String user_id);
	/**
	 * 해당 글 마다 댓글갯수 update
	 */
	void updateReplyCount(int board_no);
	
	/**
	 * 2차분류 감정 가져오기
	 * @return 감정들 이름, 이모티콘 사진이름, 코드
	 */
	List<EmotionsVO> cls2Emotion(String cls1_cd,String cls2_yn);
	/**
	 * 3차분류 감정가져오기
	 * @return 감정들 이름, 코드
	 */
	List<EmotionsVO> cls3Emotion(String cls2_cd,String cls3_yn);

	/**
	 * 유저별 글 갯수
	 * @return 해당 유저의 글 갯수
	 */
	int totalCount(String user_id, String search1, String search2,String cls2_cd,String screen);
	
	/**
	 * 글 수정 띄우기
	 */
	BoardVO myEdit(String cls1_cd,String user_id);
	
	/**
	 * 글 등록
	 * @param boardVO (user_id,board_title,board_detail,emotion)
	 * @return 성공시 1 이상 실패 시 0
	 */
	int writeOk(BoardVO boardVO);
	
	/**
	 * 글 수정
	 * @param boardVO (user_id,board_title,board_detail,emotion)
	 * @return 성공시 1 이상 실패 시 0
	 */
	int editOk(BoardVO boardVO);
	/**
	 * 체크박스로 삭제 
	 * @param boardVO (idx , userId)
	 * @return 성공시 1 이상 실패 시 0
	 */
	int deleteCheck(BoardVO boardVO);
	/**
	 * 내 글 상세보기
	 * @param Board_no 게시글 pk
	 * @return 해당 번호의 글 전체 내용
	 */
	BoardVO DetailBoard(String cls1_cd, int board_no, String user_id,String screen);
	/**
	 * 글 상세보기 2,3차 분류 띄우기
	 * @param Board_no,1차분류코드 게시글 pk
	 * @return 해당 번호의 글의 2,3차분류
	 */
	EmotionsVO detailEmotion(EmotionsVO emotionsVO);
	/**
	 * 글 비공개
	 * @param Board_no,비공개유무
	 * @return 성공시 1 이상 실패 시 0
	 */
	int hideChk(BoardVO boardVO);
	/**
	 * 관심글 여부확인
	 * @param Board_no,로그인 아이디
	 * @return 있으면 1 없으면 0
	 */
	int interestListWhether(int board_no, String user_id);
	/**
	 * 관심글 등록
	 * @param Board_no,비공개유무
	 * @return 성공시 1 이상 실패 시 0
	 */
	int interestInsert(int board_no, String user_id);
	/**
	 * 관심글 삭제
	 * @param Board_no,비공개유무
	 * @return 성공시 1 이상 실패 시 0
	 */
	int interestDel(int board_no, String user_id);

	/**
	 * 내 관심글 목록
	 * @return 로그인 아이디
	 */
	List<InterestVO> interesList(String user_id);
	
	/**
	 * screen 구별용
	 * @param board_no
	 * @return
	 */
	String screenChk(int board_no);
	
	/**
	 * 메인에 최신글 띄우기
	 * @return
	 */
	List<BoardVO> newRecord ();
}
