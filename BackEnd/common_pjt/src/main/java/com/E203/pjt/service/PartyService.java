package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.dto.req.PartyReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;

public interface PartyService {
  List<PartyResVO> listParty();
  PartyResVO createParty(PartyReqVO partyReqVO);
  PartyResVO detailParty(Integer partySeq);
  void deleteParty(Integer partySeq);

  // mypage에서 파티 참여 내역
  List<PartyResVO> listPartyGuest(Integer userSeq);
  // mypage에서 파티 개설 내역
//  List<Party> listPartyHost(Integer userSeq);
  List<PartyResVO> listPartyHost(Integer userSeq);

  List<MyParty> getMyPartyList(Integer userSeq);
  List<Party> getMyPartyHostList(Integer userSeq);
  List<Party> getMyPartyGuestList(Integer userSeq);
  List<Party> getMyPartyOngoingList(Integer userSeq);
  List<Party> getMyPartyDoneList(Integer userSeq);

}
