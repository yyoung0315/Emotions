package com.yoon.emotions.dao;

import org.apache.ibatis.annotations.Mapper;

import com.yoon.emotions.vo.UserVO;

@Mapper
public interface UserDao {

	/**
	 * 아이디 체크
	 * @param userId
	 * @return 같은 아이디가 있으면 리턴 없으면 null
	 */
	String idCheck(String user_id);
	
	/**
	 * 회원가입
	 * @param userVo user테이블의 모든값 
	 * @return 성공 1 이상 실패 0
	 */
	int userInsert(UserVO userVo);
	
	/**
	 * 로그인
	 * @param userVo 아이디 / 비밀번호
	 * @return 아이디와 이름  
	 */
	UserVO loginOk(UserVO userVo);
	/**
	 * 회원상세보기
	 * @param userId 로그인되어있는 세션의 아이디값 
	 * @return 성공 1 이상 실패 0
	 */
	UserVO userEdit(String user_id);
	
	/**
	 * 회원 비밀번호 재설정
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @param pwd 사용자가 변경 요청한 비밀번호
	 * @return 성공값 1 실패값0
	 */
	int pwdChange(UserVO userVo);
	
	/**
	 * 회원 프로필 재설정
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @param 사용자가 변경 요청한 프로필사진
	 * @return 성공값 1 실패값0
	 */
	int changeProfil(UserVO userVo);
	
	/**
	 * 회원 프로필 삭제
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @return 성공값 1 실패값0
	 */
	int delProfil(String profil_name ,String user_id);
	
	/**
	 * 회원 프로필 name가져오기
	 * @param user_id 로그인 된 세션의 아이디 값
	 * @return 회원 프로필 name
	 */
	String profil(String user_id);
	
}
