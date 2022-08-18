package com.E203.pjt.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.E203.pjt.model.dto.req.PartyReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.*;
import com.E203.pjt.repository.*;
import com.E203.pjt.service.PartyService;
import com.E203.pjt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor  // bean 주입 (autowired 대신)
public class PartyServiceImpl implements PartyService {
  private final UserRepository userRepository;
  private final PartyRepository partyRepository;
  private final PartyRepositorySupport partyRepositorySupport;
  private final MyPartyRepository myPartyRepository;
  private final UserService userService;
  private final BookmarkRepository bookmarkRepository;

  @Override
  public List<PartyResVO> listParty() {
    List<Party> partyList = partyRepositorySupport.dynamicQueryPartyList();
    List<PartyResVO> partyResVOList = new ArrayList<>();
    for(Party party : partyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
      partyResVO.setPartyCode(party.getPartyCode());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
      partyResVO.setPartyRegDt(party.getPartyRegDt());
      partyResVO.setPartyUpdDt(party.getPartyUpdDt());
      partyResVO.setPartyRdvDt(party.getPartyRdvDt());
      partyResVO.setPartyRdvLat(party.getPartyRdvLat());
      partyResVO.setPartyRdvLng(party.getPartyRdvLng());
      partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
      partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
      partyResVO.setPartyAddr(party.getPartyAddr());
      partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
      partyResVO.setPartyStatus(party.getPartyStatus());
      partyResVO.setItemLink(party.getItemLink());
      partyResVO.setTotalAmount(party.getTotalAmount());
      partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
      partyResVOList.add(partyResVO);
    }
    return partyResVOList;
  }

  @Override
  public List<PartyResVO> listPieParty() {
    List<Party> piePartyList = partyRepositorySupport.dynamicQueryPiePartyList();
    List<PartyResVO> partyResVOList = new ArrayList<>();
    for(Party party : piePartyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
      partyResVO.setPartyCode(party.getPartyCode());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
      partyResVO.setPartyRegDt(party.getPartyRegDt());
      partyResVO.setPartyUpdDt(party.getPartyUpdDt());
      partyResVO.setPartyRdvDt(party.getPartyRdvDt());
      partyResVO.setPartyRdvLat(party.getPartyRdvLat());
      partyResVO.setPartyRdvLng(party.getPartyRdvLng());
      partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
      partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
      partyResVO.setPartyAddr(party.getPartyAddr());
      partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
      partyResVO.setPartyStatus(party.getPartyStatus());
      partyResVO.setItemLink(party.getItemLink());
      partyResVO.setTotalAmount(party.getTotalAmount());
      partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
      partyResVOList.add(partyResVO);
    }
    return partyResVOList;
  }

  @Override
  public List<PartyResVO> listBuyParty() {
    List<Party> buyPartyList = partyRepositorySupport.dynamicQueryBuyPartyList();
    List<PartyResVO> partyResVOList = new ArrayList<>();
    for(Party party : buyPartyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
      partyResVO.setPartyCode(party.getPartyCode());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
      partyResVO.setPartyRegDt(party.getPartyRegDt());
      partyResVO.setPartyUpdDt(party.getPartyUpdDt());
      partyResVO.setPartyRdvDt(party.getPartyRdvDt());
      partyResVO.setPartyRdvLat(party.getPartyRdvLat());
      partyResVO.setPartyRdvLng(party.getPartyRdvLng());
      partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
      partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
      partyResVO.setPartyAddr(party.getPartyAddr());
      partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
      partyResVO.setPartyStatus(party.getPartyStatus());
      partyResVO.setItemLink(party.getItemLink());
      partyResVO.setTotalAmount(party.getTotalAmount());
      partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
      partyResVOList.add(partyResVO);
    }
    return partyResVOList;
  }

  @Override
  public List<PartyResVO> listDlvParty() {
    List<Party> dlvPartyList = partyRepositorySupport.dynamicQueryDlvPartyList();
    List<PartyResVO> partyResVOList = new ArrayList<>();
    for(Party party : dlvPartyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
      partyResVO.setPartyCode(party.getPartyCode());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
      partyResVO.setPartyRegDt(party.getPartyRegDt());
      partyResVO.setPartyUpdDt(party.getPartyUpdDt());
      partyResVO.setPartyRdvDt(party.getPartyRdvDt());
      partyResVO.setPartyRdvLat(party.getPartyRdvLat());
      partyResVO.setPartyRdvLng(party.getPartyRdvLng());
      partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
      partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
      partyResVO.setPartyAddr(party.getPartyAddr());
      partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
      partyResVO.setPartyStatus(party.getPartyStatus());
      partyResVO.setItemLink(party.getItemLink());
      partyResVO.setTotalAmount(party.getTotalAmount());
      partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
      partyResVOList.add(partyResVO);
    }
    return partyResVOList;
  }

  @Override
  @Transactional
  public PartyResVO createParty(PartyReqVO partyReqVO) {
    User u = userRepository.findByUserSeq(partyReqVO.getUserSeq());
    Party req = partyReqVO.toEntity(u);
    Party party = partyRepository.save(req);
    MyPartyPK pk = new MyPartyPK();
    pk.setPartySeq(party.getPartySeq());
    pk.setUserSeq(partyReqVO.getUserSeq());
    MyParty myParty = new MyParty();
    myParty.setMyPartyPK(pk);
    myParty.setParty(party);
    myParty.setUser(userRepository.findByUserSeq(partyReqVO.getUserSeq()));
    myParty.setMyPartyRole("host");
    myPartyRepository.save(myParty);
    PartyResVO partyResVO = new PartyResVO();
    partyResVO.setPartySeq(party.getPartySeq());
    partyResVO.setUserSeq(party.getUser().getUserSeq());
//    partyResVO.setUserResVO(userService.detailUser(party.getUser().getUserSeq()));
    partyResVO.setPartyCode(party.getPartyCode());
    partyResVO.setPartyTitle(party.getPartyTitle());
    partyResVO.setPartyContent(party.getPartyContent());
    partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
//      partyResVO.setPartyBookmarkCount(party.getPartyBookmarkCount());
    partyResVO.setPartyCode(party.getPartyCode());
    partyResVO.setPartyRegDt(party.getPartyRegDt());
    partyResVO.setPartyUpdDt(party.getPartyUpdDt());
    partyResVO.setPartyRdvDt(party.getPartyRdvDt());
    partyResVO.setPartyRdvLat(party.getPartyRdvLat());
    partyResVO.setPartyRdvLng(party.getPartyRdvLng());
    partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
    partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
    partyResVO.setPartyAddr(party.getPartyAddr());
    partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
    partyResVO.setPartyStatus(party.getPartyStatus());
    partyResVO.setItemLink(party.getItemLink());
    partyResVO.setTotalAmount(party.getTotalAmount());
    partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
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
    partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
//      partyResVO.setPartyBookmarkCount(party.getPartyBookmarkCount());
    partyResVO.setPartyCode(party.getPartyCode());
    partyResVO.setPartyRegDt(party.getPartyRegDt());
    partyResVO.setPartyUpdDt(party.getPartyUpdDt());
    partyResVO.setPartyRdvDt(party.getPartyRdvDt());
    partyResVO.setPartyRdvLat(party.getPartyRdvLat());
    partyResVO.setPartyRdvLng(party.getPartyRdvLng());
    partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
    partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
    partyResVO.setPartyAddr(party.getPartyAddr());
    partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
    partyResVO.setPartyStatus(party.getPartyStatus());
    partyResVO.setItemLink(party.getItemLink());
    partyResVO.setTotalAmount(party.getTotalAmount());
    partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
    return partyResVO;
  }

  @Override
  public void deleteParty(Integer partySeq) {
    Party party = partyRepository.findByPartySeq(partySeq);
    partyRepository.delete(party);
  }

  @Override
  public Boolean doneParty(Integer partySeq) {
    Party party = partyRepository.findByPartySeq(partySeq);
    party.setPartyStatus(0);
    partyRepository.save(party);
    party = partyRepository.findByPartySeq(partySeq);
    return party.getPartyStatus().equals(0);
  }

  @Override
  public List<PartyResVO> listLatestParty() {
    List<Party> latestPartyList = partyRepositorySupport.dynamicQueryLatestPartyList();
    List<PartyResVO> result = new ArrayList<>();
    for(Party party : latestPartyList) {
      PartyResVO partyResVO = new PartyResVO();
      partyResVO.setPartySeq(party.getPartySeq());
      partyResVO.setUserSeq(party.getUser().getUserSeq());
//      partyResVO.setUserResVO(userService.detailUser(party.getUser().getUserSeq()));
      partyResVO.setPartyCode(party.getPartyCode());
      partyResVO.setPartyTitle(party.getPartyTitle());
      partyResVO.setPartyContent(party.getPartyContent());
      partyResVO.setPartyBookmarkCount(bookmarkRepository.findAllByParty(party).size());
//      partyResVO.setPartyBookmarkCount(party.getPartyBookmarkCount());
      partyResVO.setPartyRegDt(party.getPartyRegDt());
      partyResVO.setPartyUpdDt(party.getPartyUpdDt());
      partyResVO.setPartyRdvDt(party.getPartyRdvDt());
      partyResVO.setPartyRdvLat(party.getPartyRdvLat());
      partyResVO.setPartyRdvLng(party.getPartyRdvLng());
      partyResVO.setPartyMemberNumCurrent(partyRepositorySupport.dynamicQueryPartyMemberNumCurrent(party.getPartySeq()).intValue());
      partyResVO.setPartyMemberNumTotal(party.getPartyMemberNumTotal());
      partyResVO.setPartyAddr(party.getPartyAddr());
      partyResVO.setPartyAddrDetail(party.getPartyAddrDetail());
      partyResVO.setPartyStatus(party.getPartyStatus());
      partyResVO.setItemLink(party.getItemLink());
      partyResVO.setTotalAmount(party.getTotalAmount());
      partyResVO.setPartyMainImageUrl(party.getPartyMainImageUrl());
      result.add(partyResVO);
    }
    return result;
  }

  @Override
  public List<PartyResVO> listPartyGuest(Integer userSeq) {
//    System.out.println("[PartyServiceImpl] listPartyGuest() called");
    List<PartyResVO> result = new ArrayList<>();
    User user = userRepository.findByUserSeq(userSeq);
    List<MyParty> myPartyList = myPartyRepository.findAllByUserAndMyPartyRole(user, "guest");
    Collections.reverse(myPartyList);
    for (MyParty myParty : myPartyList) {
      PartyResVO partyResVO = detailParty(myParty.getParty().getPartySeq());
      result.add(partyResVO);
    }
    return result;
  }

  @Override
  public List<PartyResVO> listPartyHost(Integer userSeq) {
//    System.out.println("[PartyServiceImpl] listPartyHost() called");
    List<PartyResVO> result = new ArrayList<>();
    User user = userRepository.findByUserSeq(userSeq);
    List<MyParty> myPartyList = myPartyRepository.findAllByUserAndMyPartyRole(user, "host");
    Collections.reverse(myPartyList);
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

  @Override
  public void putPartyMainImageUrl(Integer partySeq, String partyMainImageUrl) {
    Party party = partyRepository.findByPartySeq(partySeq);
    party.setPartyMainImageUrl(partyMainImageUrl);
    partyRepository.save(party);
  }

  @Override
  public void changeParty(Integer partySeq, Party party) {
    partyRepository.save(party);
  }

}
