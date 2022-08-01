package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.entity.MyParty;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.service.PartyService;


@RestController
@RequiredArgsConstructor
public class PartyController {
  private final PartyService partyService;

  @PostMapping(value = "/parties")
  public Party createParty(@RequestBody Party party) {
    System.out.println(party);
    Party result = partyService.createParty(party);
    return result;
  }

  @GetMapping(value="/parties")
  public List<Party> getAllParties() {
    List<Party> partyList = partyService.getAllParties();
    for (Party party : partyList) {
      System.out.println(party.getPartySeq() + " : " + party.getPartyCode());
    }
    return partyList;
  }

  @GetMapping(value = "/parties/{userSeq}")
  public List<MyParty> getMyPartyList(@PathVariable Integer userSeq) {
    List<MyParty> myPartyList = partyService.getMyPartyList(userSeq);
    for (MyParty mp : myPartyList) {
      System.out.println(mp.getParty().getPartySeq()+": "+mp.getParty().getPartyTitle()+" / ");
    }
    return myPartyList;
  }

}
