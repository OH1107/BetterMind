package com.ssafy.db.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;

/**
 * 유저 모델 정의.
 */
//Entity가 붙은 클래스는 JPA가 관리하는 클래스이고, 테이블과 매핑할 테이블에 해당 어노테이션을 붙인다.
@Entity
@Getter
@Setter
public class User extends BaseEntity {
	private String userid;
	private String name;
	private String role;
	private String email;
	private String phone;
	private String certificate; // 자격번호
	private String description;
	private Enum<CategoryEnum> category;

	@OneToMany(fetch = FetchType.LAZY)
	private List<User_Program> program;
	
	private int point;
	private String profile_url;

	@JsonIgnore
	@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
	private String password;
	
}
