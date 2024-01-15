package com.yoon.emotions.serviceImpl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.yoon.emotions.dao.UserDao;
import com.yoon.emotions.service.UserService;
import com.yoon.emotions.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	
	@Autowired
	private UserDao userDao;
	
	//application.properties 에서 받아온 값으로 회원가입 시 값 삽입
	@Value("${auth.user}")
	private String authUser;
	
	
	//기본 프로필 사진
	//basic_profil = person-fill.svg
	@Value("${basic_profil}")
	private String basic_profil;
	
	/**
	 * 아이디체크
	 */
	@Override
	public String idCheck(String ckId) {
		String failId = userDao.idCheck(ckId);
		return failId;
	}
	/**
	 * 회원가입
	 */
	@Override
	public int userInsert(Map<String, String> insertDataMap) {
		
		//map에 있는것 꺼내서 VO에 전달
		String user_id = insertDataMap.get("user_id");
		String pwd = insertDataMap.get("pwd");
		String name = insertDataMap.get("name");
		//생년월일에 있는 하이픈 제거 
		String bday = insertDataMap.get("bday").replaceAll("-","");
		String tel = insertDataMap.get("tel");
		String address_num = insertDataMap.get("address_num");
		String address = insertDataMap.get("address");
		
		UserVO userVo = new UserVO();
		userVo.setUser_id(user_id);
		userVo.setPwd(pwd);
		userVo.setName(name);
		userVo.setBday(bday);
		userVo.setTel(tel);
		userVo.setAddress_num(address_num);
		userVo.setAddress(address);
		userVo.setAuth_id(authUser);
		userVo.setSad_emotions(0);
		
		int insertResult = userDao.userInsert(userVo);

		return insertResult;
	}
	/**
	 * 로그인
	 */
	@Override
	public UserVO loginOk(Map<String, String> loginDataMap) {
		//map에서 꺼내서 VO로 전달
		String user_id = loginDataMap.get("user_id"); 
		String pwd = loginDataMap.get("pwd");

		UserVO userVo = new UserVO();
		userVo.setUser_id(user_id);
		userVo.setPwd(pwd);
		
		UserVO loginInfo = userDao.loginOk(userVo);
		
		return loginInfo;
	}
	/**
	 * 회원상세보기
	 */
	@Override
	public UserVO userEdit(String user_id) {
		
		UserVO userEditData = userDao.userEdit(user_id);
		
		return userEditData;
	}
	
	/**
	 * 비밀번호 변경
	 */
	@Override
	public int pwdChange(String pwd, String user_id ) {
		Date now = new Date();
		
		UserVO userVo = new UserVO();
		
		userVo.setPwd(pwd);
		userVo.setUser_id(user_id);
		userVo.setUser_update_dt(now);
		
		int pwdResetResult = userDao.pwdChange(userVo);
		
		return pwdResetResult;
	}
	/**
	 * 프로필 사진 변경
	 */
	@Override
	public int changeProfil(String profil_name,MultipartFile profil_img, String user_id) {
		
		UserVO userVo = new UserVO();
		userVo.setProfil_name(profil_name);
		userVo.setUser_id(user_id);
		
		int profilResetResult = userDao.changeProfil(userVo);
		
		return profilResetResult;
	}
	/**
	 * 프로필 사진 명 가져오기
	 */
	@Override
	public String profil(String user_id) {
		String profil_name = userDao.profil(user_id);
		
		return profil_name;
	}
	/**
	 * 프로필 삭제 시 
	 */
	@Override
	public int delProfil(String user_id) {
		String profil_name = basic_profil;
		int delProfilResult = userDao.delProfil(profil_name,user_id);
		return delProfilResult;
	}

}
