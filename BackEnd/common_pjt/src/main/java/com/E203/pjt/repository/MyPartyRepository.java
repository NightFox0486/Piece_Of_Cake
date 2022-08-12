package com.E203.pjt.repository;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.MyPartyPK;
import com.E203.pjt.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MyPartyRepository extends JpaRepository<MyParty, MyPartyPK> {
    List<MyParty> findByUser(User user);
}
