package com.gyull.webnovel.service.member;

import com.gyull.webnovel.domain.member.MemberVO;

public interface MemberService {

	public void register(MemberVO vo);
	
	public MemberVO read(String mem_email);
}
