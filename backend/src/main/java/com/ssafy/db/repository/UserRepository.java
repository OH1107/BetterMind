package com.ssafy.db.repository;

import com.ssafy.api.request.UserRegisterPostReq;
import com.ssafy.db.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * 유저 모델 관련 디비 쿼리 생성을 위한 JPA Query Method 인터페이스 정의.
 */
//JpaRepository 상속받으면서 제네릭에 사용할 entity와 ID타입이 될 수 있는 클래스 
@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	// 아래와 같이, Query Method 인터페이스(반환값, 메소드명, 인자) 정의를 하면 자동으로 Query Method 구현됨.
	// 필드 검색을 위해서 메서드 이름으로 쿼리 생성 가능 접두어로 findBy를 사용해야함
	Optional<User> findByUserid(String userId);
//	User findByUser_id(Long userid);

}