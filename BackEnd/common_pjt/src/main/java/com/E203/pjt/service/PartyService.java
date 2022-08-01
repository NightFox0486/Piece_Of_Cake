package com.E203.pjt.service;

import java.util.List;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;

public interface PartyService {
  Party createParty(Party party);
  void deleteParty(Integer party_seq);
  List<Party> getAllParties();
  List<MyParty> getMyPartyList(Integer userSeq);
  List<Party> getMyPartyHostList(Integer userSeq);
  List<Party> getMyPartyGuestList(Integer userSeq);
  List<Party> getMyPartyOngoingList(Integer userSeq);
  List<Party> getMyPartyDoneList(Integer userSeq);

}
