package com.yoon.emotions.service;

import java.util.List;
import java.util.Map;

import com.yoon.emotions.vo.BoardVO;
import com.yoon.emotions.vo.EmotionsVO;
import com.yoon.emotions.vo.InterestVO;

public interface BoardService {

	/**
	 * 캘린더 화면 띄우기
	 * 
	 * @param 로그인 아이디
	 * @return 로그인아이디로 조회되는 전체 감정+board_no
	 */
	Map<String, Object> myCalendar(String user_id);

	/**
	 * 나의기록 띄우기
	 * 
	 * @return 감정,글 정보 다가져옴
	 */
	Map<String, Object> recordList(String user_id, String search1, String search2, String page, String pageUnit,
			String cls2_cd,String screen );

	/**
	 * 글작성 팝업띄우기
	 * 
	 * @return 해당 유저의 글 갯수
	 */
	Map<String, Object> writer(String user_id, String cls2_cd, String search1, String search2,String screen);

	/**
	 * 글 등록
	 * 
	 * @param writeData(user_id,title,content,emotion)
	 * @return 성공시 1 이상 실패 시 0
	 */
	int writeOk(Map<String, String> writeData);

	/**
	 * 글 수정하기 화면
	 * 
	 * @param board_no 사용자가 목록에서 선택한 글의 번호
	 * @return 해당 번호로 조회되는 전체 목록
	 */
	Map<String, Object> myEdit(String user_id, String cls2_cd);

	/**
	 * 글 수정
	 * 
	 * @param writeData(user_id,title,content,emotion)
	 * @return 성공시 1 이상 실패 시 0
	 */
	int editOk(Map<String, String> editData);

	/**
	 * 체크박스 삭제
	 * 
	 * @param idx
	 * @param userId
	 * @return 성공시 1 이상 실패 시 0
	 */
	int deleteCheck(List<Integer> chkList, String user_id);

	/**
	 * 글 상세보기
	 * 
	 * @param Board_no 게시글 pk
	 * @return 해당 번호의 글 전체 내용
	 */
	Map<String, Object> detailBoard(int board_no, String user_id, String screen);

	/**
	 * 버튼으로 삭제
	 * 
	 * @param board_no
	 * @return 성공시 1 이상 실패 시 0
	 */
	int deleteBtn(int board_no, String user_id);

	/**
	 * 글 비공개
	 * 
	 * @param Board_no,비공개유무
	 * @return 성공시 1 이상 실패 시 0
	 */
	int hideChk(int board_no, String hide);

	/**
	 * 관심글 등록
	 * 
	 * @param Board_no,비공개유무
	 * @return 성공시 1 이상 실패 시 0
	 */
	int interestInsert(int board_no, String user_id);

	/**
	 * 관심글 삭제
	 * 
	 * @param Board_no,비공개유무
	 * @return 성공시 1 이상 실패 시 0
	 */
	int interestDel(int board_no, String user_id);

	/**
	 * 내 관심글 목록
	 * 
	 * @return 로그인 아이디
	 */
	List<InterestVO> interesList(String user_id);

	/**
	 * 메인에 최신글 띄우기
	 * @return
	 */
	List<BoardVO> newRecord ();
	
}
