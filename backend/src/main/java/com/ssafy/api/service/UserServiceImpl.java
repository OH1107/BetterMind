package com.ssafy.api.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.ssafy.api.request.UserProgramPostReq;
import com.ssafy.api.request.UserRegisterPostReq;
import com.ssafy.api.response.UserRes;
import com.ssafy.db.entity.CategoryEnum;
import com.ssafy.db.entity.User;
import com.ssafy.db.entity.User_Program;
import com.ssafy.db.repository.UserRepository;
import com.ssafy.db.repository.UserRepositorySupport;
import com.ssafy.db.repository.User_ProgramRepository;

/**
 * 유저 관련 비즈니스 로직 처리를 위한 서비스 구현 정의.
 */
@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserRepository userRepository;

	@Autowired
	User_ProgramRepository userprogramRepository;
	
	@Autowired
	UserRepositorySupport userRepositorySupport;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public User createUser(UserRegisterPostReq userRegisterInfo) {
		User user = new User();
		user.setUserid(userRegisterInfo.getId());
		// 보안을 위해서 유저 패스워드 암호화 하여 디비에 저장.
		user.setPassword(passwordEncoder.encode(userRegisterInfo.getPassword()));
		user.setEmail(userRegisterInfo.getEmail());
		user.setName(userRegisterInfo.getName());
		user.setPhone(userRegisterInfo.getPhone());
		user.setCertificate(userRegisterInfo.getCertificate());
		user.setCategory(CategoryEnum.valueOf(userRegisterInfo.getCategory()));
		user.setDescription(userRegisterInfo.getDescription());
		user.setPoint(0);
		user.setRole(userRegisterInfo.getRole());
		//dsl 사용
		return userRepository.save(user);
	}

	@Override
	public User getUserByUserId(String userId) {
		// 디비에 유저 정보 조회 (userId 를 통한 조회).
		User user = userRepositorySupport.findUserByUserid(userId).get();
		return user;
	}

	@Override
	public User updateUser(Long id, UserRegisterPostReq userRegisterInfo) {
		User user = userRepository.getOne(id);
		user.setName(userRegisterInfo.getName());
		user.setEmail(userRegisterInfo.getEmail());
		user.setPhone(userRegisterInfo.getPhone());
		user.setDescription(userRegisterInfo.getDescription());
		user.setCategory(CategoryEnum.valueOf(userRegisterInfo.getCategory()));
		return userRepository.save(user);
	}

	@Override
	public void deleteUser(Long id) {
		userRepository.deleteById(id);
	}

	@Override
	public UserRes getOneUserProgram(Long id) {
		User user = userRepository.findById(id).get();
//		Long uid = userprogramRepository.findByUser_id(id).get(0).getId();
		UserRes u = new UserRes();
		u.setId(user.getId());
		List<User_Program> uplist = userprogramRepository.findByUser_id(user.getId());
		if(uplist != null) {
			List<UserProgramPostReq> programs = new ArrayList<>();
			for(User_Program k : uplist) {
				UserProgramPostReq l = new UserProgramPostReq();
				l.setProgram_id(k.getProgram().getId());
//				l.setProgram_id(k.getProgram().getLong());
//				l.setMyProgram_id(k.getMyProgram_id());
				programs.add(l);
			}
			u.setPrograms(programs);
		}
		return u;
	}
	
//	@Override
//	public UserRes getOneUserProgram(Long id) {
//		User user = userRepository.findById(id).get();
//		UserRes u = new UserRes();
//		u.setId(user.getId());
//		List<User_Program> uplist = userprogramRepository.findByUser_id(user.getId());
//		if(uplist != null) {
//			List<UserProgramPostReq> myprograms = new ArrayList<>();
//			for(User_Program k : uplist) {
//				UserProgramPostReq l = new UserProgramPostReq();
//				l.setMyProgram_id(k.getMyProgram_id());
//				myprograms.add(l);
//			}
//			u.setPrograms(myprograms);
//		}
//		return u;
//	}

	@Override
	public User findByUserId(Long user_id) {
		User user = userRepositorySupport.findUserByUserid(user_id).get();
		return user;
	}
	
}
