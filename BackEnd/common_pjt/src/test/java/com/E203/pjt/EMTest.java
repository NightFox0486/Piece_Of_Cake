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
        User u = em.find(User.class, 1);
        em.persist(u);
        party.setUser(u);
        party.setPartyCode("001");
        party.setPartyTitle("eee");
        party.setPartyContent("eee");
        party.setPartyRegDt(LocalDateTime.now());
        party.setPartyRdvLat("44");
        party.setPartyRdvLng("234");
        party.setPartyMemberNumTotal(3);
        party.setPartyMemberNumCurrent(2);
        party.setPartyRdvDt(LocalDateTime.now());
        party.setPartyAddr("ee");
        party.setPartyAddrDetail("ee");
        party.setPartyStatus(0);
        party.setItemLink("ee");
        party.setTotalAmount("12341234");
        em.persist(party);
    }

    @Test
    void userTest() {
        User user = new User();
        user.setUserEmail("qqqq@qqqq.com");
        user.setUserPhone("010-2222-2222");
        user.setUserNickname("qqqq");
        user.setUserPassword("qqqq");
        user.setUserImage("qqqq");
        user.setUserRating(44);
        user.setUserLat("444");
        user.setUserLng("444");
        user.setUserAccount("44444");
        em.persist(user);
        em.flush();
        em.clear();
    }
}
