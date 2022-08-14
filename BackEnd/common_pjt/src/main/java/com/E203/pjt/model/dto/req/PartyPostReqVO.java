package com.E203.pjt.model.dto.req;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

import com.E203.pjt.model.entity.User;

/**
 * 파티 생성 시 사용자에게 입력 받는 값
 */
@Getter
@Setter
//@ApiModel("PartyPostReq")
public class PartyPostReqVO {
//    @ApiModelProperty(name="")
    private String partyCode;
    private String partyTitle;
    private String partyContent;
    private Integer partyBookmarkCount;
    private LocalDateTime partyRegDt;
    private LocalDateTime partyUpdDt;
    private LocalDateTime partyRdvDt;
    private String partyRdvLat;
    private String partyRdvLng;
    private Integer partyMemberNumTotal;
    private Integer partyMemberNumCurrent;
    private String partyAddr;
    private String partyAddrDetail;
    private Integer partyStatus;
    private String itemLink;
    private String totalAmount;
    private User user;
}
