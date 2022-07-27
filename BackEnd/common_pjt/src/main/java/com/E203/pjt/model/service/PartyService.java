package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.Party;

public interface PartyService {
  Party createParty(Party party);
  void deleteParty(Integer party_seq);
  List<Party> getAllParties();
}
