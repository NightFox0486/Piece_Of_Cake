package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.repository.PartyRepository;

@Service
public class PartyServiceImpl implements PartyService {
  @Autowired
  private PartyRepository partyRepository;

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
  
}
