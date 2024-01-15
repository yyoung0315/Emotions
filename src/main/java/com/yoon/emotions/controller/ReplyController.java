package com.yoon.emotions.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yoon.emotions.service.ReplyService;
import com.yoon.emotions.vo.UserVO;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	
	/**
	 * 댓글등록
	 * @param ReplyData
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "replyInsert.do")
	@ResponseBody
	public void replyInsert(@RequestBody Map<String, String> ReplyData, HttpSession  session,HttpServletResponse response) throws IOException {	
		// 세션 값(이름이랑 아이디) 받아서 아이디만 map에 put 
		UserVO loginInfo = (UserVO) session.getAttribute("loginInfo");
	    String user_id = loginInfo.getUser_id();
	    ReplyData.put("user_id", user_id);
		
		//ajax에 값 넘기기 위해 PrintWriter 변수
		PrintWriter out = response.getWriter();
		
		int replyInsertResult = replyService.replyInsert(ReplyData);
		
		if(replyInsertResult > 0) {
			out.print("ok");	
		}else {
			out.print("no");
		}
	}
	/**
	 * 댓글삭제 시
	 * @param reply_no
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "replyDelete.do")
	public void replyDelete(@RequestParam("reply_no")int reply_no, HttpServletResponse response) throws IOException {	
		// service에 해당 글의 번호(board_no) 전달
		int replyDeleteRsult = replyService.replyDelete(reply_no);
		//ajax에 값 넘기기 위해 PrintWriter 변수
		PrintWriter out = response.getWriter();
		
		 if(replyDeleteRsult > 0) {
				out.print("ok");	
			}else {
				out.print("no");
			}	
	}
	/**
	 * 댓글 등록
	 * @param addReplyData
	 * @param session
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/addReply.do")
	@ResponseBody
	public void addReply(@RequestBody Map<String, String> addReplyData, HttpSession  session,HttpServletResponse response) throws IOException {	
		// 세션 값(이름이랑 아이디) 받아서 아이디만 map에 put 
		UserVO loginInfo = (UserVO) session.getAttribute("loginInfo");
	    String user_id = loginInfo.getUser_id();
	    addReplyData.put("user_id", user_id);
		
		//ajax에 값 넘기기 위해 PrintWriter 변수
		PrintWriter out = response.getWriter();
		
		int replyInsertResult = replyService.addReply(addReplyData);
		
		if(replyInsertResult > 0) {
			out.print("ok");	
		}else {
			out.print("no");
		}
	}
	
	/**
	 * 답글 수정
	 * @param editReplyData
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "editReply.do")
	@ResponseBody
	public void editReply(@RequestBody Map<String, String> editReplyData,HttpServletResponse response) throws IOException {	
		
		//ajax에 값 넘기기 위해 PrintWriter 변수
		PrintWriter out = response.getWriter();
		
		int replyeditResult = replyService.editReply(editReplyData);
		
		if(replyeditResult > 0) {
			out.print("ok");	
		}else {
			out.print("no");
		}
	}
}
