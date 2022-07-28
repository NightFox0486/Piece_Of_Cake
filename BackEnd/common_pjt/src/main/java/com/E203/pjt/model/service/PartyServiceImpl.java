package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.MyPartyRepository;
import com.E203.pjt.repository.PartyRepositorySupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.repository.PartyRepository;

@Service
public class PartyServiceImpl implements PartyService {
  @Autowired
  private PartyRepository partyRepository;

  @Autowired
  private PartyRepositorySupport partyRepositorySupport;

  @Autowired
  private MyPartyRepository myPartyRepository;

  @Override
  public Party createParty(Party party) {
    return partyRepository.save(party);
  }

  @Override
  public void deleteParty(Integer party_seq) {
    partyRepository.deleteById(party_seq);
  }

  @Override
  public List<Party> getAllParties() {
    return partyRepository.findAll();
  }

  @Override
  public List<MyParty> getMyPartyList(Integer userSeq) {
    return partyRepositorySupport.findDynamicQueryMyPartyList(userSeq);
  }

  @Override
  public List<Party> getMyPartyHostList(Integer userSeq) {
    return partyRepositorySupport.findDynamicQueryMyPartyHostList(userSeq);
  }

  @Override
  public List<Party> getMyPartyGuestList(Integer userSeq) {
    return partyRepositorySupport.findDynamicQueryMyPartyGuestList(userSeq);
  }

  @Override
  public List<Party> getMyPartyOngoingList(Integer userSeq) {
    return partyRepositorySupport.findDynamicQueryOngoingMyPartyList(userSeq);
  }

  @Override
  public List<Party> getMyPartyDoneList(Integer userSeq) {
    return partyRepositorySupport.findDynamicQueryDoneMypartyList(userSeq);
  }

}
