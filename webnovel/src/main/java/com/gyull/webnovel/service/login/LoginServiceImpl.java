package com.gyull.webnovel.service.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.gyull.webnovel.domain.member.MemberVO;
import com.gyull.webnovel.mapper.login.LoginMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class LoginServiceImpl implements LoginService {

	@Setter(onMethod_ = {@Autowired})
	private LoginMapper mapper;
	
	@Override
	public MemberVO login(MemberVO vo) {
		log.info("[LoginService:"+vo);
		return mapper.login(vo);
	}

}
