package com.E203.pjt.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.E203.pjt.model.dto.req.PartyPostReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.repository.PartyRepositorySupport;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.service.PartyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.repository.PartyRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor  // bean 주입 (autowired 대신)
public class PartyServiceImpl implements PartyService {
  private final UserRepository userRepository;
  private final PartyRepository partyRepository;
  private final PartyRepositorySupport partyRepositorySupport;

  @Override
  public List<PartyResVO> listParty() {
//    List<Party> partyList = partyRepository.findAll();
    List<Party> partyList = partyRepository.findAllByPartyStatus(1);
    System.out.println(partyList);
    List<PartyResVO> partyResVOList = new ArrayList<>();
    for(Party party : partyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
      partyResVO.setPartyCode(party.getPartyCode());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyBookmarkCount(party.getPartyBookmarkCount());
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
  @Transactional
  public Party createParty(PartyPostReqVO partyPostReqVO, Integer userSeq) {
    Party party = new Party();
    party.setItemLink(partyPostReqVO.getItemLink());
    party.setPartyAddr(partyPostReqVO.getPartyAddr());
    party.setPartyAddrDetail(partyPostReqVO.getPartyAddrDetail());
    party.setPartyStatus(partyPostReqVO.getPartyStatus());
    party.setPartyBookmarkCount(partyPostReqVO.getPartyBookmarkCount());
    party.setPartyCode(partyPostReqVO.getPartyCode());
    party.setPartyContent(partyPostReqVO.getPartyContent());
    party.setPartyMemberNumCurrent(partyPostReqVO.getPartyMemberNumCurrent());
    party.setPartyMemberNumTotal(partyPostReqVO.getPartyMemberNumTotal());
    party.setPartyRdvLat(partyPostReqVO.getPartyRdvLat());
    party.setPartyRdvLng(partyPostReqVO.getPartyRdvLng());
    party.setPartyTitle(partyPostReqVO.getPartyTitle());
    party.setTotalAmount(partyPostReqVO.getTotalAmount());
    party.setUser(userRepository.findByUserSeq(partyPostReqVO.getUserSeq()));

    return partyRepository.save(party);
  }

  @Override
  public PartyResVO detailParty(Integer partySeq) {
    PartyResVO partyResVO = new PartyResVO();
    Party party = partyRepository.findByPartySeq(partySeq);
    partyResVO.setPartySeq(party.getPartySeq());
    partyResVO.setUserSeq(party.getUser().getUserSeq());
    partyResVO.setPartyCode(party.getPartyCode());
    partyResVO.setPartyTitle(party.getPartyTitle());
    partyResVO.setPartyContent(party.getPartyContent());
    partyResVO.setPartyBookmarkCount(party.getPartyBookmarkCount());
    partyResVO.setPartyCode(party.getPartyCode());
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
  public List<Party> listPartyHost(Integer userSeq) {
    List<Party> partyHostList = partyRepositorySupport.dynamicQueryPartyHostList(userSeq);
    return partyHostList;
  }

  @Override
  public List<Party> listPartyGuest(Integer userSeq) {
    List<Party> partyGuestList = partyRepositorySupport.dynamicQueryPartyGuestList(userSeq);
    return partyGuestList;
  }

  @Override
  public List<MyParty> getMyPartyList(Integer userSeq) {
    return partyRepositorySupport.findDynamicQueryMyPartyList(userSeq);
  }

  @Override
  public List<Party> getMyPartyHostList(Integer userSeq) {
    return partyRepositorySupport.dynamicQueryPartyHostList(userSeq);
  }

  @Override
  public List<Party> getMyPartyGuestList(Integer userSeq) {
    return partyRepositorySupport.dynamicQueryPartyGuestList(userSeq);
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
