package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.dto.req.PartyPostReqVO;
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
    for (PartyResVO partyResVO : partyResVOList) {
      System.out.println(partyResVO.getPartySeq() + " : " + partyResVO.getPartyTitle());
    }
    return partyResVOList;
  }

  @PostMapping(value = "/party")
  public Party createParty(@RequestBody PartyPostReqVO partyPostReqVO, HttpSession session) {
    System.out.println(partyPostReqVO);
    Party result = partyService.createParty(partyPostReqVO, (Integer)session.getAttribute("userSeq"));
    return result;
  }


  @GetMapping(value = "/party/{partySeq}")
  public PartyResVO detailParty(@PathVariable Integer partySeq) {
    System.out.println("[PartyController] detailParty() called");
    System.out.println("parameter partySeq: "+partySeq);
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
