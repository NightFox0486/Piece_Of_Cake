package com.E203.pjt.model.dto.req;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MyPartyReqVO {
    Integer userSeq;
    Integer partySeq;
    String partyRole;
}
