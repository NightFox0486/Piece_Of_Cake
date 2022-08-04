package com.E203.pjt.model.dto.res;

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
    String partyTitle;
    String partyContent;
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
}
