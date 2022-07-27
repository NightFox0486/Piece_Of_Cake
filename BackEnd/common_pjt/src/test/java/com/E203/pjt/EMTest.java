package com.E203.pjt;

import com.E203.pjt.model.entity.*;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDateTime;
import java.util.Optional;

@SpringBootTest
@Transactional
@Rollback(value = false)
public class EMTest {
    @PersistenceContext
    EntityManager em;

    @Test
    void myPartyTest() {
        MyPartyPK pk = new MyPartyPK(2, 1);
        MyParty myParty = new MyParty();
        myParty.setMyPartyPK(pk);
        myParty.setParty(em.find(Party.class, 2));
        myParty.setUser(em.find(User.class, 1));
        myParty.setPartyListCode("host");
        em.persist(myParty);
        em.flush();
        em.clear();
    }

//    @Test
//    void wishListTest() {
//        WishListPK pk = new WishListPK(1, 1);
//        WishList wishList = new WishList();
//        wishList.setWishListPK(pk);
//        wishList.setUser(em.find(User.class, 1));
//        wishList.setParty(em.find(Party.class, 1));
//        em.persist(wishList);
//        em.flush();
//        em.clear();
//    }

    @Test
    void partyTest() {
        Party party = new Party();
        User u = em.find(User.class, 2);
        em.persist(u);
        party.setUser(u);
        party.setPartyCode("001");
        party.setPartyTitle("qqqq");
        party.setPartyContent("qqqq");
        party.setPartyRegDt(LocalDateTime.now());
        party.setPartyRdvLat("222");
        party.setPartyRdvLng("222");
        party.setPartyMemberNumTotal(2);
        party.setPartyMemberNumCurrent(1);
        party.setPartyRdvDt(LocalDateTime.now());
        party.setPartyAddr("qqqq");
        party.setPartyAddrDetail("qqqq");
        party.setPartyStatus(0);
        party.setItemLink("qqqq");
        party.setTotalAmount("2222");
        em.persist(party);
    }

    @Test
    void userTest() {
        User user = new User();
        user.setUserEmail("qwer@qwer.com");
        user.setUserPhone("010-4321-4321");
        user.setUserNickname("qwer");
        user.setUserPassword("qwer");
        user.setUserImage("qwer");
        user.setUserRating(43);
        user.setUserLat("432");
        user.setUserLng("432");
        user.setUserAccount("4321");
        em.persist(user);
        em.flush();
        em.clear();
    }
}
