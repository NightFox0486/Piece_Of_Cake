package com.E203.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.service.PartyService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class PartyController {
  @Autowired
  private final PartyService partyService;

  public PartyController(PartyService partyService) {
    this.partyService = partyService;
  }

  @PostMapping(value = "/parties")
  public void createParty(Party party) {
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
}
