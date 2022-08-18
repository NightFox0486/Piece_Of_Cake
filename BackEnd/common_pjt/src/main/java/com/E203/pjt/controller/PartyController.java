package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.dto.req.PartyReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import lombok.RequiredArgsConstructor;
import org.springframework.data.relational.core.sql.In;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.service.PartyService;

import javax.servlet.http.HttpSession;


@RestController
@RequiredArgsConstructor
public class PartyController {
  private final PartyService partyService;

  @GetMapping(value="/party")
  public List<PartyResVO> listParty() {
    List<PartyResVO> partyResVOList = partyService.listParty();
//    for (PartyResVO partyResVO : partyResVOList) {
//      System.out.println(partyResVO.getPartySeq() + " : " + partyResVO.getPartyTitle());
//    }
    return partyResVOList;
  }

  @GetMapping(value = "/party/pie")
  public List<PartyResVO> listPieParty() {
    List<PartyResVO> piePartyResVOList = partyService.listPieParty();
    return piePartyResVOList;
  }

  @GetMapping(value = "/party/buy")
  public List<PartyResVO> listBuyParty() {
    List<PartyResVO> buyPartyResVOList = partyService.listBuyParty();
    return buyPartyResVOList;
  }

  @GetMapping(value = "/party/dlv")
  public List<PartyResVO> listDlvParty() {
    List<PartyResVO> dlvPartyResVOList = partyService.listDlvParty();
    return dlvPartyResVOList;
  }

  @PostMapping(value = "/party")
  public PartyResVO createParty(@RequestBody PartyReqVO partyReqVO) {
//    System.out.println("[PartyController] createParty() called");
//    System.out.println(partyReqVO);
    PartyResVO result = partyService.createParty(partyReqVO);
    return result;
  }


  @GetMapping(value = "/party/{partySeq}")
  public PartyResVO detailParty(@PathVariable Integer partySeq) {
//    System.out.println("[PartyController] detailParty() called");
//    System.out.println("parameter partySeq: "+partySeq);
    PartyResVO partyResVO = partyService.detailParty(partySeq);
    return partyResVO;
  }

  @DeleteMapping(value = "/party/{partySeq}")
  public void cancelParty(@PathVariable Integer partySeq) {
    partyService.deleteParty(partySeq);
  }

  // 파티 호스트가 파티 완료를 누르면 !!!
  @PostMapping(value = "/party/{partySeq}")
  public Boolean doneParty(@PathVariable Integer partySeq) {
    return partyService.doneParty(partySeq);
  }

  @GetMapping(value = "/latest-party")
  public List<PartyResVO> listLatestParty() {
    List<PartyResVO> partyResVOList = partyService.listLatestParty();
//    for (PartyResVO partyResVO : partyResVOList) {
//      System.out.println(partyResVO.getPartySeq() + " : " + partyResVO.getPartyTitle());
//    }
    return partyResVOList;
  }

  @GetMapping(value = "/party/guest/{userSeq}")
  public List<PartyResVO> listPartyGuest(@PathVariable Integer userSeq) {
//    System.out.println("[PartyController] listPartyGuest() called");
//    System.out.println("parameter userSeq: "+userSeq);
    List<PartyResVO> partyGuestList = partyService.listPartyGuest(userSeq);
//    System.out.println(partyGuestList);
//    for (PartyResVO partyResVO : partyGuestList) {
//      System.out.println("title: "+ partyResVO.getPartyTitle()+", content: "+partyResVO.getPartyContent());
//    }
    return partyGuestList;
  }

  @GetMapping(value = "/party/host/{userSeq}")
  public List<PartyResVO> listPartyHost(@PathVariable Integer userSeq) {
//    System.out.println("[PartyController] listPartyHost() called");
//    System.out.println("parameter userSeq: "+userSeq);
    List<PartyResVO> partyHostList = partyService.listPartyHost(userSeq);
//    System.out.println(partyHostList);
//    for (PartyResVO partyResVO : partyHostList) {
//      System.out.println("title: "+ partyResVO.getPartyTitle()+", content: "+partyResVO.getPartyContent());
//    }
    return partyHostList;
  }

  @PatchMapping(value = "/partyimage/{partySeq}")
  public void addPartyMainImage(@PathVariable Integer partySeq, @RequestBody String partyMainImageUrl){
    // System.out.println("patchtest");
    // System.out.println(partySeq);
    // System.out.println(partyMainImageUrl);
    partyService.putPartyMainImageUrl(partySeq, partyMainImageUrl);
  }

  @PatchMapping(value = "/party/{partySeq}")
  public void changeParty(@PathVariable Integer partySeq, @RequestBody Party party){
    System.out.println(party); // System.out.println("patchtest");}
  }
}
