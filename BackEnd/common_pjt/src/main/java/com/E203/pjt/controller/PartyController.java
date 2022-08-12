package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.dto.res.PartyResVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.service.PartyService;


@RestController
@RequiredArgsConstructor
public class PartyController {
  private final PartyService partyService;

  @PostMapping(value = "/party")
  public Party createParty(@RequestBody Party party) {
    System.out.println(party);
    Party result = partyService.createParty(party);
    return result;
  }

  @GetMapping(value="/party")
  public List<PartyResVO> listParty() {
    List<PartyResVO> partyResVOList = partyService.listParty();
    for (PartyResVO partyResVO : partyResVOList) {
      System.out.println(partyResVO.getPartySeq() + " : " + partyResVO.getPartyTitle());
    }
    return partyResVOList;
  }

  @GetMapping(value = "/party/{partySeq}")
  public PartyResVO detailParty(@PathVariable Integer partySeq) {
    PartyResVO partyResVO = partyService.detailParty(partySeq);
    return partyResVO;
  }

//  @GetMapping(value = "/party/{userSeq}")
//  public List<MyParty> getMyPartyList(@PathVariable Integer userSeq) {
//    List<MyParty> myPartyList = partyService.getMyPartyList(userSeq);
//    for (MyParty mp : myPartyList) {
//      System.out.println(mp.getParty().getPartySeq()+": "+mp.getParty().getPartyTitle()+" / ");
//    }
//    return myPartyList;
//  }

}
