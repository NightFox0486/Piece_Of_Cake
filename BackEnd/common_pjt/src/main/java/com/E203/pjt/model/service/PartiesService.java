package com.E203.pjt.model.service;

import java.util.List;

import com.E203.pjt.model.entity.Parties;

public interface PartiesService {
  Parties createParties(Parties parties);
  void deleteParties(Integer party_seq);
  List<Parties> getAllParties();
}
