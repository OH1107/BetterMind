package com.ssafy.api.request;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@ApiModel("ProgramPostRequest")
public class ProgramPostReq {

	@ApiModelProperty(name="프로그램 번호 ID", example="Long")
	private Long id;	
	@ApiModelProperty(name="유저 ID", example="ssafy_web")
	private String userId;
	@ApiModelProperty(name="프로그램 명")
	private String name;
	@ApiModelProperty(name="전문가 소개")
	private String description;
	@ApiModelProperty(name="프로그램 소개")
	private String report;
	@ApiModelProperty(name="프로그램 가격")
	private int price;
	@ApiModelProperty(name="프로그램 진행횟수")
	private int count;
	@ApiModelProperty(name="프로그램 날짜")
	private String date;
	@ApiModelProperty(name="프로그램 시간")
	private String time;
	@ApiModelProperty(name="분류")
	private String category;
	
}
