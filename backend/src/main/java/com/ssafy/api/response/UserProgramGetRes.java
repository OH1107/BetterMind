package com.ssafy.api.response;

import java.util.List;

import com.ssafy.api.request.UserProgramPostReq;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ApiModel("UserProgramResponse")
public class UserProgramGetRes {

	@ApiModelProperty(name="신청자들")
	private List<UserProgramPostReq> users;
	@ApiModelProperty(name="프로그램 ID")
	private Long program_id;
}