package com.E203.pjt.repository;

import com.E203.pjt.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.E203.pjt.model.entity.Party;

import java.util.List;

@Repository
public interface PartyRepository extends JpaRepository<Party, Integer>{
    Party findByPartySeq(Integer partySeq);
    List<Party> findAllByPartyStatus(Integer partyStatus);
    List<Party> findAllByUser(User user);


}
