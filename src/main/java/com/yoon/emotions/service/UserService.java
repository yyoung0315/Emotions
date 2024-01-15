package com.yoon.emotions.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.yoon.emotions.vo.UserVO;

public interface UserService{

	/**
	 * 아이디 체크 
	 * @param ckId
	 * @return 같은 아이디가 있으면 리턴 없으면 null
	 */
	String idCheck(String ckId);
	/**
	 * 회원가입
	 * @param insertDataMap
	 * @return 성공값 1 실패값0
	 */
	int userInsert(Map<String, String> insertDataMap);
	
	/**
	 * 로그인
	 * @param loginDataMap 로그인을 시도한 아이디 / 비밀번호
	 * @return 성공시 아이디와 이름 
	 */
	UserVO loginOk(Map<String, String> loginDataMap);
	
	/**
	 * 회원상세보기
	 * @param userId 로그인 된 세션의 아이디 값
	 * @return user 테이블의 해당 회원의 전체 정보 
	 */
	UserVO userEdit(String user_id);
	
	/**
	 * 회원 비밀번호 재설정
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @param pwd 사용자가 변경 요청한 비밀번호
	 * @return 성공값 1 실패값0
	 */
	int pwdChange(String user_id,String pwd);
	
	/**
	 * 회원 프로필 재설정
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @param 사용자가 변경 요청한 프로필사진
	 * @return 성공값 1 실패값0
	 */
	int changeProfil(String profil_name, MultipartFile profil_img, String user_id);
	
	/**
	 * 회원 프로필 삭제
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @return 성공값 1 실패값0
	 */
	int delProfil(String user_id);
	
	/**
	 * 회원 프로필 name가져오기
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @return 회원 프로필 name
	 */
	String profil(String user_id);
	
}
