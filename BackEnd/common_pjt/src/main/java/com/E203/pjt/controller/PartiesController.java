package com.E203.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.E203.pjt.model.entity.Parties;
import com.E203.pjt.model.service.PartiesService;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@RestController
public class PartiesController {
  @Autowired
  private final PartiesService partiesService;

  public PartiesController(PartiesService usersService) {
    this.partiesService = usersService;
  }

  @PostMapping(value = "/parties")
  public void createUsers(Parties parties) {
    System.out.println(parties);
    System.out.println(partiesService.createParties(parties));
  }

  @GetMapping(value="/parties")
  public void getAllUsers(@RequestParam Integer partySeq) {
    List<Parties> partyList = partiesService.getAllParties();
    for (Parties party : partyList) {
      System.out.println(party.getPartySeq() + " : " + party.getPartyCode());
    }
  }
}
