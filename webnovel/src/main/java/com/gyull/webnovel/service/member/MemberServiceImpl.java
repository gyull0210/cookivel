package com.gyull.webnovel.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.member.MemberVO;
import com.gyull.webnovel.mapper.member.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public void register(MemberVO vo) {
		mapper.register(vo);

	}
	
	@Override
	public MemberVO read(String mem_email) {
		return mapper.read(mem_email);
	}

}
