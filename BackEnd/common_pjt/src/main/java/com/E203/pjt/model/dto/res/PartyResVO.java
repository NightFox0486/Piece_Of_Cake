package com.E203.pjt.model.dto.res;

import com.E203.pjt.model.entity.User;
import lombok.*;

import java.time.LocalDateTime;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class PartyResVO {
    Integer partySeq;
    Integer userSeq;
//    UserResVO userResVO;
//    Integer userNickname;
    String partyCode;
    String partyTitle;
    String partyContent;
    Integer partyBookmarkCount;
    LocalDateTime partyRegDt;
    LocalDateTime partyUpdDt;
    LocalDateTime partyRdvDt;
    String partyRdvLat;
    String partyRdvLng;
    Integer partyMemberNumTotal;
    Integer partyMemberNumCurrent;
    String partyAddr;
    String partyAddrDetail;
    Integer partyStatus;
    String itemLink;
    String totalAmount;
    String partyMainImageUrl;
}
