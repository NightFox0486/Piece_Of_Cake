package com.E203.pjt;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.MyPartyPK;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.service.PartyService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@SpringBootTest
@Transactional
@Rollback(value = false)
public class ServiceTests {
    @Autowired
    PartyService partyService;

    @PersistenceContext
    EntityManager em;

    @Test
    void getMyPartyListTest() {
        User user = em.find(User.class, 3);
        Party party = em.find(Party.class, 1);
        MyPartyPK pk = new MyPartyPK(user.getUserSeq(), party.getPartySeq());
        MyParty myParty = new MyParty();
        myParty.setMyPartyPK(pk);
        myParty.setParty(party);
        myParty.setUser(user);
        myParty.setPartyListCode("guest");
        em.persist(myParty);
        em.flush();
        em.clear();
        List<MyParty> myPartyList = partyService.getMyPartyList(user);
        for (MyParty mp : myPartyList) {
            System.out.println(mp);
        }
    }
}
