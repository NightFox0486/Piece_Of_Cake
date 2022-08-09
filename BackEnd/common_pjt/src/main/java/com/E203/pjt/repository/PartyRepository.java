package com.E203.pjt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.E203.pjt.model.entity.Party;

@Repository
public interface PartyRepository extends JpaRepository<Party, Integer>{
    Party findByPartySeq(Integer partySeq);
}
