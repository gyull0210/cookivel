package com.gyull.webnovel.domain.member;

import lombok.Data;

/**
 * 전체 코드분류 등록
 * 2자리
 * @author mkht0
 *
 */

@Data
public class MasterCodeVO {

	private String masterCode; //not auto increment
	private String ma_codeName;
}
