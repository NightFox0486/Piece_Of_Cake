package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.dto.req.PartyPostReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;

public interface PartyService {
  List<PartyResVO> listParty();
  Party createParty(PartyPostReqVO partyPostReqVO, Integer userSeq);
  PartyResVO detailParty(Integer partySeq);
  void deleteParty(Integer party_seq);

  // mypage에서 파티 개설 내역
  List<Party> listPartyHost(Integer userSeq);
  // mypage에서 파티 참여 내역
  List<Party> listPartyGuest(Integer userSeq);

  List<MyParty> getMyPartyList(Integer userSeq);
  List<Party> getMyPartyHostList(Integer userSeq);
  List<Party> getMyPartyGuestList(Integer userSeq);
  List<Party> getMyPartyOngoingList(Integer userSeq);
  List<Party> getMyPartyDoneList(Integer userSeq);

}
