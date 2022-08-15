package com.E203.pjt.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.E203.pjt.model.dto.req.PartyReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.MyPartyPK;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.MyPartyRepository;
import com.E203.pjt.repository.PartyRepositorySupport;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.service.PartyService;
import com.E203.pjt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.E203.pjt.repository.PartyRepository;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor  // bean 주입 (autowired 대신)
public class PartyServiceImpl implements PartyService {
  private final UserRepository userRepository;
  private final PartyRepository partyRepository;
  private final PartyRepositorySupport partyRepositorySupport;
  private final MyPartyRepository myPartyRepository;
  private final UserService userService;

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
//      partyResVO.setUserResVO(userService.detailUser(party.getUser().getUserSeq()));
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
  public PartyResVO createParty(PartyReqVO partyReqVO, Integer userSeq) {
    User u = userRepository.findByUserSeq(userSeq);
    Party req = partyReqVO.toEntity(u);
    Party party = partyRepository.save(req);
    MyPartyPK pk = new MyPartyPK();
    pk.setPartySeq(party.getPartySeq());
    pk.setUserSeq(userSeq);
    MyParty myParty = new MyParty();
    myParty.setMyPartyPK(pk);
    myParty.setParty(party);
    myParty.setUser(userRepository.findByUserSeq(userSeq));
    myParty.setPartyListCode("host");
    myPartyRepository.save(myParty);
    PartyResVO partyResVO = new PartyResVO();
    partyResVO.setPartySeq(party.getPartySeq());
    partyResVO.setUserSeq(party.getUser().getUserSeq());
//    partyResVO.setUserResVO(userService.detailUser(party.getUser().getUserSeq()));
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
  public PartyResVO detailParty(Integer partySeq) {
    PartyResVO partyResVO = new PartyResVO();
    Party party = partyRepository.findByPartySeq(partySeq);
    partyResVO.setPartySeq(party.getPartySeq());
    partyResVO.setUserSeq(party.getUser().getUserSeq());
//    partyResVO.setUserResVO(userService.detailUser(party.getUser().getUserSeq()));
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
  public void deleteParty(Integer partySeq) {
    Party party = partyRepository.findByPartySeq(partySeq);
    partyRepository.delete(party);
  }

  @Override
  public List<PartyResVO> listPartyGuest(Integer userSeq) {
    System.out.println("[PartyServiceImpl] listPartyGuest() called");
    List<PartyResVO> result = new ArrayList<>();
    User user = userRepository.findByUserSeq(userSeq);
    List<MyParty> myPartyList = myPartyRepository.findAllByUserAndPartyListCode(user, "guest");
    for (MyParty myParty : myPartyList) {
      PartyResVO partyResVO = detailParty(myParty.getParty().getPartySeq());
      result.add(partyResVO);
    }
    return result;
  }

  @Override
  public List<PartyResVO> listPartyHost(Integer userSeq) {
    System.out.println("[PartyServiceImpl] listPartyHost() called");
    List<PartyResVO> result = new ArrayList<>();
    User user = userRepository.findByUserSeq(userSeq);
    List<MyParty> myPartyList = myPartyRepository.findAllByUserAndPartyListCode(user, "host");
    for (MyParty myParty : myPartyList) {
      PartyResVO partyResVO = detailParty(myParty.getParty().getPartySeq());
      result.add(partyResVO);
    }
    return result;
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
