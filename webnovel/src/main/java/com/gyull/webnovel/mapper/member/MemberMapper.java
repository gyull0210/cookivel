package com.gyull.webnovel.mapper.member;

import com.gyull.webnovel.domain.member.MemberVO;

public interface MemberMapper {

	public void register(MemberVO vo);
	
	public MemberVO read(String mem_email);
//	public int emailCheck(String mem_email);
//	
//	public int accountCheck(MemberVO vo);
//	
//	public int nickCheck(String mem_nickName);
//	
//	public int phoneCheck(String mem_phoneNum);
}
