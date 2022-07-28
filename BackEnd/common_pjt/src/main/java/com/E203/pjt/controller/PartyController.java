package com.E203.pjt.controller;

import java.util.List;

import com.E203.pjt.model.entity.MyParty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.service.PartyService;


@RestController
public class PartyController {
  @Autowired
  private final PartyService partyService;

  public PartyController(PartyService partyService) {
    this.partyService = partyService;
  }

  @PostMapping(value = "/parties")
  public void creaetParty(Party party) {
    System.out.println(party);
    System.out.println(partyService.createParty(party));
  }

  @GetMapping(value="/parties")
  public void getAllParties(@RequestParam Integer partySeq) {
    List<Party> partyList = partyService.getAllParties();
    for (Party party : partyList) {
      System.out.println(party.getPartySeq() + " : " + party.getPartyCode());
    }
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
