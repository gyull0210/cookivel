package com.gyull.webnovel.domain.member;

import java.time.LocalDateTime;
import java.util.List;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;

import lombok.Data;

/**
 * 회원정보
 * 회원프로필사진 별도 @see MemberImageVO
 * 회원권한코드 별도 @see MemberCodeVO
 * 회원 간편로그인 별도 @see MemberAuthVO
 * 회원 계정상태 및 사용 유무 있음
 * @author mkht0
 *
 */
@Data
public class MemberVO {

	//회원 정보
	private int member_idx;
	private String mem_nickName;
	private String mem_email;
	private String mem_pw;
	private String mem_phoneNum;
	private String mem_name;
	private String mem_about;
	private String mem_address;
	private String mem_authority;
	private int mem_point;
	private int mem_money;
	private String mem_ip;
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime mem_regDate = LocalDateTime.now();
	@JsonDeserialize(using = LocalDateTimeDeserializer.class)
	private LocalDateTime mem_recentDate = LocalDateTime.now();
	private String mem_isUsed; //활성계정인지 휴면계정인지
	private String mem_isQuit; //탈퇴회원인지 아닌지
	
	
	//회원 권한
	private List<MemberCodeVO> authList;
	
	//회원 프로필 사진
	
	//회원 간편 로그인
}
