package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;

public interface PartyService {
  Party createParty(Party party);
  void deleteParty(Integer party_seq);
  List<Party> getAllParties();
  List<MyParty> getMyPartyList(User user);
}
