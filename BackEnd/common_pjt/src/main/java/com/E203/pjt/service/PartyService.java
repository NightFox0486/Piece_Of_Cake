package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;

public interface PartyService {
  Party createParty(Party party);
  PartyResVO detailParty(Integer partySeq);
  void deleteParty(Integer party_seq);
  List<PartyResVO> listParty();
  List<MyParty> getMyPartyList(Integer userSeq);
  List<Party> getMyPartyHostList(Integer userSeq);
  List<Party> getMyPartyGuestList(Integer userSeq);
  List<Party> getMyPartyOngoingList(Integer userSeq);
  List<Party> getMyPartyDoneList(Integer userSeq);

}
