package com.yoon.emotions.serviceImpl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yoon.emotions.dao.BoardDao;
import com.yoon.emotions.dao.ReplyDao;
import com.yoon.emotions.service.BoardService;
import com.yoon.emotions.vo.BoardVO;
import com.yoon.emotions.vo.EmotionsVO;
import com.yoon.emotions.vo.InterestVO;
import com.yoon.emotions.vo.PagingVO;
import com.yoon.emotions.vo.ReplyVO;

@Service
public class BoardServiceImpl implements BoardService{

	
	@Autowired
	private BoardDao boardDao;

	@Autowired
	private ReplyDao replyDao;
	
	//1차분류 감정
	@Value("${cls1.emotion}")
	private String cls1_emotion;
	
	//1차분류 권한
	@Value("${cls1.auth}")
	private String cls1_auth;
	
	//1차분류 신고
	@Value("${cls1.report}")
	private String cls1_report;
	
	//사용유무 OK
	@Value("${yn.ok}")
	private String yn_ok;
	
	//사용유무 NO
	@Value("${yn.no}")
	private String yn_no;
	
	/**
	 * 캘린더 띄우기
	 */
	@Override
	public Map<String, Object> myCalendar(String user_id) {
		
		Map<String, Object>  listMap = new HashMap<>();
		
		String cls2_yn= yn_ok;
		LocalDate now = LocalDate.now();
		int year = Integer.parseInt(now.format(DateTimeFormatter.ofPattern("yyyy"))) ;
		int month = Integer.parseInt(now.format(DateTimeFormatter.ofPattern("MM")));
		String nowYm = now.format(DateTimeFormatter.ofPattern("yyyyMM"));
		
		List<BoardVO> myCalendarList = boardDao.myCalendar(user_id,cls2_yn,nowYm);
		int myCalendarCount = boardDao.myCalendarCount(user_id,cls2_yn,nowYm);
		
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH,month);
		int dayOfMonth = now.lengthOfMonth(); // 해당 월의 일 수
		
        int firstDayOfWeek = now.withDayOfMonth(month).getDayOfWeek().getValue();

		/*
		 * Map<Integer, Map<Integer, String>> day = new HashMap<>();
		 * 
		 * for (int i= 1; i<=dayOfMonth; i++) { day.put(i, new HashMap<Integer,
		 * String>()); }
		 * 
		 * for (BoardVO vo : myCalendarList) { int inputDay = vo.getInputDay();
		 * 
		 * Map<Integer, String> hm = new HashMap<>();
		 * 
		 * hm.put(vo.getBoard_no(), vo.getCls2_img_nm());
		 * 
		 * day.put(inputDay, hm); }
		 */
		
		// year, month, day

		listMap.put("year", year);
		listMap.put("month", month);
		listMap.put("dayOfMonth", dayOfMonth);
		listMap.put("firstDayOfWeek", firstDayOfWeek);
		listMap.put("myCalendarList", myCalendarList);
		listMap.put("myCalendarCount", myCalendarCount);
		
		return listMap;
	}
	
	/**
	 * 나의/너의기록
	 */
	@Override
	public Map<String, Object> recordList(String user_id, String search1, String search2,String page,String pageUnit,String cls2_cd,String screen) {
		Map<String, Object>  listMap = new HashMap<>();
		
		//현재페이지
	    int nowPage = 1;
	    int pagelen = 0;
	    //페이징 한 블럭의 길이
        if(null == pageUnit || "".equals(pageUnit)) {
        	pagelen = 10;
        }else {
        	pagelen = Integer.parseInt(pageUnit);
        }
	    
	    //현재 내가 속해 있는 블럭
	    int currentBlock = 0;
	    //페이징 블럭 시작점
	    int startPage = 0;
	    //페이징 블럭 마지막점
	    int endPage = 0;
	    //전체 페이지 갯수
	    int totalPages;
	    //전체 레코드 수
	    int totalCount;
	    //page(현재페이지)에 null , 공백처리   
	    if (null == page || 0 == page.length()) {
            nowPage = 1;
        } else {
            try {
                nowPage = Integer.parseInt(page);
            } catch (NumberFormatException e) {
                nowPage = 1;
            }
        }
	    //총 글수 가져오기
	    totalCount = boardDao.totalCount(user_id,search1,search2,cls2_cd,screen);
	    //전체 페이지 수
    	totalPages = totalCount % pagelen == 0 ? totalCount / pagelen : (totalCount / pagelen) + 1;
    	
    	// 현재 페이지가 총 페이지 수를 초과하면 마지막 페이지로 설정
        if (nowPage > totalPages) {
            nowPage = totalPages; 
        }
		
        //현재 내가 속해 있는 블럭
        currentBlock = (nowPage - 1) / pagelen + 1;
        //페이징 블럭 시작점
        startPage = (currentBlock - 1) * pagelen + 1;
        //페이징 블럭 마지막점
        endPage = startPage + pagelen - 1;
        
        //페이징 블럭 마지막점이 총페이지 수를 초과하면 페이징 블럭 마지막점은 총페이지로 설정
        if (endPage > totalPages) {
            endPage = totalPages;
        }
        //각페이지의 시작
        int start = (nowPage - 1) * pagelen;
        //첫 시작점 셋팅
        if(0 > start) {
        	start = 0;
        }
		
        String cls1_cd= cls1_emotion;
        String cls2_yn= yn_ok;
        
        //2차분류 가져오는 메소드
 	 	List<EmotionsVO> cls2Emotion = boardDao.cls2Emotion(cls1_cd,cls2_yn);
 	 	//글목록 가져오기
 	 	List<BoardVO> recordList = boardDao.recordList(user_id,search1,search2,start,pagelen,cls2_cd,screen);
	 	//당일 쓴글이있는지 확인
	 	int toDay = boardDao.toDay(user_id);
	 	
		// 페이징
		PagingVO pageVo = new PagingVO();
		
		pageVo.setPagelen(pagelen);
		pageVo.setSearch1(search1);
		pageVo.setSearch2(search2);
		pageVo.setCurrentBlock(currentBlock);
		pageVo.setTotalPages(totalPages);
		pageVo.setStartPage(startPage);
		pageVo.setEndPage(endPage);
		pageVo.setNowPage(nowPage);
		pageVo.setTotalCount(totalCount);

		listMap.put("paging", pageVo);
		listMap.put("cls2Emotion", cls2Emotion);
		listMap.put("recordList", recordList);
		listMap.put("totalCount", totalCount);
		listMap.put("toDay", toDay);
		
		
		return listMap;
	}
	
	/**
	 * 기록 저장 팝업 띄우기 
	 */
	@Override
	public Map<String, Object> writer(String user_id, String cls2_cd,String search1, String search2,String screen) {
		
		Map<String, Object>  listMap = new HashMap<>();
		int totalCount = boardDao.totalCount(user_id,search1,search2,cls2_cd,screen);
		
        String cls1_cd= cls1_emotion;
        String cls2_yn= yn_ok;
        String cls3_yn= yn_ok;
        
		List<EmotionsVO> cls2Emotion = boardDao.cls2Emotion(cls1_cd,cls2_yn);
		
		if("" != cls2_cd || null != cls2_cd) {
			List<EmotionsVO> cls3Emotion = boardDao.cls3Emotion(cls2_cd,cls3_yn);
			listMap.put("cls3Emotion", cls3Emotion);
		}
		
		PagingVO pagingVo = new PagingVO();
		
		pagingVo.setTotalCount(totalCount);
		
		listMap.put("cls2Emotion", cls2Emotion);
		listMap.put("totalCount", pagingVo.getTotalCount());
		
		return listMap ;
		
	}
	/**
	 * 글등록
	 */
	@Override
	public int writeOk(Map<String, String> writeData) {
		//map에서 꺼내와서 VO에 담아 전달
		String user_id = writeData.get("user_id");
		String board_title = writeData.get("board_title");
		String board_detail = writeData.get("board_detail");
		String cls3_cd = writeData.get("cls3_cd");
		

		BoardVO boardVO = new BoardVO();
		boardVO.setUser_id(user_id);
		boardVO.setBoard_title(board_title);
		boardVO.setBoard_detail(board_detail);
		boardVO.setEmotions(cls3_cd);
		int writeResult = boardDao.writeOk(boardVO);

		return writeResult;
	}

	/**
	 * 수정하기 화면 띄우기
	 */
	@Override
	public Map<String, Object> myEdit(String user_id,String cls2_cd) {
		Map<String, Object>  listMap = new HashMap<>();
		String cls1_cd= cls1_emotion;
        String cls2_yn= yn_ok;
        String cls3_yn= yn_ok;
        
		BoardVO myEdit = boardDao.myEdit(cls1_cd,user_id);
		
		List<EmotionsVO> cls2Emotion = boardDao.cls2Emotion(cls1_cd,cls2_yn);
		
		if("" != cls2_cd || null != cls2_cd) {
			List<EmotionsVO> cls3Emotion = boardDao.cls3Emotion(cls2_cd,cls3_yn);
			listMap.put("cls3Emotion", cls3Emotion);
		}
		
		listMap.put("cls2Emotion", cls2Emotion);
		listMap.put("myEdit", myEdit);
		
		return listMap;
	}
	/**
	 * 글 수정
	 */
	@Override
	public int editOk(Map<String, String> editData) {
		//map에서 꺼내와서 VO에 담아 전달
		String user_id = editData.get("user_id");
		String board_title = editData.get("board_title");
		String board_detail = editData.get("board_detail");
		String cls3_cd = editData.get("cls3_cd");
		int board_no = Integer.parseInt(editData.get("board_no"));
		
		Date now = new Date();

		BoardVO boardVO = new BoardVO();
		boardVO.setUser_id(user_id);
		boardVO.setBoard_title(board_title);
		boardVO.setBoard_detail(board_detail);
		boardVO.setEmotions(cls3_cd);
		boardVO.setBoard_no(board_no);
		boardVO.setBoard_update_dt(now);
		
		
		int editResult = boardDao.editOk(boardVO);
		
		return editResult;
	}
	/**
	 * 글 상세보기
	 */
	@Override
	public Map<String, Object> detailBoard(int board_no,String user_id,String screen) {
		String cls1_cd= cls1_emotion;
		
		EmotionsVO emotionsVO = new EmotionsVO();
		
		emotionsVO.setBoard_no(board_no);
		emotionsVO.setCls1_cd(cls1_cd);
		
		BoardVO detailBoardResult =null;
		EmotionsVO detailEmotion = null;
		List<ReplyVO> replyList = null;
		int interest = 0;
		
		if(""== screen || null ==screen) {
			String id = boardDao.screenChk(board_no);
			
			if(id.equals(user_id) ) {
				screen = "myRecord";
			}else {
				screen = "yourRecord";
			}
		}
		
		detailBoardResult = boardDao.DetailBoard(cls1_cd,board_no,user_id,screen);
		detailEmotion = boardDao.detailEmotion(emotionsVO);
		replyList = replyDao.replyList(board_no);
		interest = boardDao.interestListWhether(board_no,user_id);
		boardDao.updateReplyCount(board_no);
	
		Map<String, Object>  listMap = new HashMap<>();
		
		listMap.put("detailBoardList", detailBoardResult);
		listMap.put("detailEmotion", detailEmotion);
		listMap.put("replyList", replyList);
		listMap.put("interest", interest);
		
		
		return listMap;
	}
	
	/**
	 * 글 체크박스로 삭제 
	 */
	@Override
	public int deleteCheck(List<Integer> chkList, String user_id) {
		
		//결과값은 int로 추가추가 됨 
		int deleteChkCount = 0;
		int replyChk = 0;
		
		
		//여러개를 체크를 할수있기 때문에 List 값 받아와서 for 문 돌려서 하나씩 전달 		
		for (int i=0; i<chkList.size(); i++) {
			
			int board_no = chkList.get(i);
			
			BoardVO boardVo = new BoardVO();
			
			boardVo.setBoard_no(board_no);
			boardVo.setUser_id(user_id);
			
			replyChk = replyDao.totalReply(board_no);
			
			if(0 < replyChk) {
				replyDao.replyAllDel(boardVo);
			}
			
			deleteChkCount += boardDao.deleteCheck(boardVo);
		}
		
		return deleteChkCount;
	}

	/**
	 * 버튼으로 글삭제
	 */
	@Override
	public int deleteBtn(int board_no,String user_id) {
		
		int replyChk = 0;
		
		BoardVO boardVo = new BoardVO();
		
		boardVo.setBoard_no(board_no);
		boardVo.setUser_id(user_id);
		
		replyChk = replyDao.totalReply(board_no);
		
		if(0 < replyChk) {
			replyDao.replyAllDel(boardVo);
		}
		
		
		int deleteChkCount = boardDao.deleteCheck(boardVo);
		
		return deleteChkCount;
	}
	
	/**
	 * 글 비공개
	 */
	@Override
	public int hideChk(int board_no, String hide) {
		
		BoardVO boardVo = new BoardVO();
		
		boardVo.setBoard_no(board_no);
		boardVo.setHide(hide);
		
		int hideChkResult= boardDao.hideChk(boardVo);
		
		return hideChkResult;
	}
	
	/**
	 * 관심글 등록
	 */
	@Override
	public int interestInsert(int board_no, String user_id) {
		
		int interestInsertResult= boardDao.interestInsert(board_no,user_id);
		
		return interestInsertResult;
	}
	
	/**
	 * 관심글 삭제
	 */
	@Override
	public int interestDel(int board_no, String user_id) {
		
		int interestDelResult= boardDao.interestDel(board_no,user_id);
		
		return interestDelResult;
	}

	@Override
	public List<InterestVO> interesList(String user_id) {
		List<InterestVO> interList = boardDao.interesList(user_id);
		return interList;
	}

	@Override
	public List<BoardVO> newRecord() {
		
		List<BoardVO> interList = boardDao.newRecord();
		
		return interList;
	}

}
