package com.ssafy.api.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.ssafy.api.request.UserRegisterPostReq;
import com.ssafy.api.response.UserRes;
import com.ssafy.db.entity.User;

/**
 *	유저 관련 비즈니스 로직 처리를 위한 서비스 인터페이스 정의.
 */
public interface UserService {
	User createUser(UserRegisterPostReq userRegisterInfo);
	User getUserByUserId(String userId);
	User updateUser(Long id, UserRegisterPostReq userRegisterInfo);
	void deleteUser(Long id);
	UserRes getOneUserProgram(Long id);
	User findByUserId(Long user_id);
	
}
