package com.E203.pjt.service.impl;

import java.util.List;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.repository.PartyRepositorySupport;
import com.E203.pjt.service.PartyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.repository.PartyRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor  // bean 주입 (autowired 대신)
public class PartyServiceImpl implements PartyService {
  private final PartyRepository partyRepository;
  private final PartyRepositorySupport partyRepositorySupport;

  @Override
  @Transactional
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
