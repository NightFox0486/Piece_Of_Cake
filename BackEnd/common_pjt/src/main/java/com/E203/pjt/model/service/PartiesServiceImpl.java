package com.E203.pjt.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E203.pjt.model.entity.Parties;
import com.E203.pjt.repository.PartiesRepository;

@Service
public class PartiesServiceImpl implements PartiesService{
  @Autowired
  private PartiesRepository paritesRepository;

  @Override
  public Parties createParties(Parties parties) {
    return paritesRepository.save(parties);
  }

  @Override
  public void deleteParties(Integer party_seq) {
    paritesRepository.deleteById(party_seq);
  }

  @Override
  public List<Parties> getAllParties() {
    return paritesRepository.findAll();
  }
  
}
