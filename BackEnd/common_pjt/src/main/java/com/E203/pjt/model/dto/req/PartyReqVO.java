package com.E203.pjt.model.dto.req;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDateTime;

/**
 * 파티 생성 시 사용자에게 입력 받는 값
 */
@Getter
@Setter
//@ApiModel("PartyPostReq")
public class PartyReqVO {
//    @ApiModelProperty(name="")
    private String partyCode;
    private String partyTitle;
    private String partyContent;
    private Integer partyBookmarkCount;
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

    public Party toEntity(User user) {
        Party party = new Party();
        party.setUser(user);
        party.setPartyCode(partyCode);
        party.setPartyTitle(partyTitle);
        party.setPartyContent(partyContent);
        party.setPartyBookmarkCount(partyBookmarkCount);
        party.setPartyRdvDt(partyRdvDt);
        party.setPartyRdvLat(partyRdvLat);
        party.setPartyRdvLng(partyRdvLng);
        party.setPartyMemberNumTotal(partyMemberNumTotal);
        party.setPartyMemberNumCurrent(partyMemberNumCurrent);
        party.setPartyAddr(partyAddr);
        party.setPartyAddrDetail(partyAddrDetail);
        party.setPartyStatus(partyStatus);
        party.setItemLink(itemLink);
        party.setTotalAmount(totalAmount);
        return party;
    }
}
