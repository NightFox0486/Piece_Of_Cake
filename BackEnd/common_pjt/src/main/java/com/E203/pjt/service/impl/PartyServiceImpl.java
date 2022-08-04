package com.E203.pjt.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.E203.pjt.model.dto.res.PartyResVO;
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
  public PartyResVO detailParty(Integer partySeq) {
    PartyResVO partyResVO = new PartyResVO();
    Party party = partyRepository.findByPartySeq(partySeq);
    partyResVO.setPartySeq(party.getPartySeq());
    partyResVO.setUserSeq(party.getUser().getUserSeq());
    partyResVO.setPartyTitle(party.getPartyTitle());
    partyResVO.setPartyContent(party.getPartyContent());
    partyResVO.setPartyRegDt(party.getPartyRegDt());
    partyResVO.setPartyUpdDt(party.getPartyUpdDt());
    partyResVO.setPartyRdvDt(party.getPartyRdvDt());
    partyResVO.setPartyRdvLat(party.getPartyRdvLat());
    partyResVO.setPartyRdvLng(party.getPartyRdvLng());
    partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
    partyResVO.setPartyMemberNumCurrent(party.getPartyMemberNumCurrent());
    partyResVO.setPartyAddr(party.getPartyAddr());
    partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
    partyResVO.setPartyStatus(party.getPartyStatus());
    partyResVO.setItemLink(party.getItemLink());
    partyResVO.setTotalAmount(party.getTotalAmount());
    return partyResVO;
  }

  @Override
  public void deleteParty(Integer party_seq) {
    partyRepository.deleteById(party_seq);
  }

  @Override
  public List<PartyResVO> getPartyList() {
    List<Party> partyList = partyRepository.findAll();
    List<PartyResVO> partyResVOList = new ArrayList<>();
    for(Party party : partyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyRegDt(party.getPartyRegDt());
      partyResVO.setPartyUpdDt(party.getPartyUpdDt());
      partyResVO.setPartyRdvDt(party.getPartyRdvDt());
      partyResVO.setPartyRdvLat(party.getPartyRdvLat());
      partyResVO.setPartyRdvLng(party.getPartyRdvLng());
      partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
      partyResVO.setPartyMemberNumCurrent(party.getPartyMemberNumCurrent());
      partyResVO.setPartyAddr(party.getPartyAddr());
      partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
      partyResVO.setPartyStatus(party.getPartyStatus());
      partyResVO.setItemLink(party.getItemLink());
      partyResVO.setTotalAmount(party.getTotalAmount());
      partyResVOList.add(partyResVO);
    }
    return partyResVOList;
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
