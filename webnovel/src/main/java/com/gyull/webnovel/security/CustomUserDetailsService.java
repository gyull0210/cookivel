package com.gyull.webnovel.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.gyull.webnovel.domain.member.MemberVO;
import com.gyull.webnovel.mapper.member.MemberMapper;
import com.gyull.webnovel.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String mem_nickName) throws UsernameNotFoundException {
		log.warn("Load User By UserName: "+ mem_nickName);
		
		MemberVO vo = mapper.read(mem_nickName);
		log.warn("queried by member mapper: "+vo);
		
		return vo == null ? null : new CustomUser(vo);
	}

}
