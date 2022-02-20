package com.gyull.webnovel.domain.member;

import java.time.LocalDateTime;

import lombok.Data;
/**
 * 충전 및 결제 항목에 대한 이유도 들어가야 하나... 고민
 * @author mkht0
 *
 */
@Data
public class MemberPointDTO {

	private int member_idx;
	private int point_charge;
	private int point_consume;
	private LocalDateTime regDate;
	
}
