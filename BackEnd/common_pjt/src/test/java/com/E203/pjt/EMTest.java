package com.E203.pjt;

import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.model.entity.WishList;
import com.E203.pjt.model.entity.WishListPK;
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
//        party.setUserSeq(3);
        User u = em.find(User.class, 3);
        em.persist(u);
        party.setUser(u);
        party.setPartyCode("002");
        party.setPartyTitle("wwww");
        party.setPartyContent("wwww");
        party.setPartyRegDt(LocalDateTime.now());
        party.setPartyRdvLat("333");
        party.setPartyRdvLng("333");
        party.setPartyMemberNumTotal(3);
        party.setPartyMemberNumCurrent(2);
        party.setPartyRdvDt(LocalDateTime.now());
        party.setPartyAddr("wwww");
        party.setPartyAddrDetail("wwww");
        party.setPartyStatus(0);
        party.setItemLink("wwww");
        party.setTotalAmount("3333");
        em.persist(party);
//        em.persist(party);
//        System.out.println(em.find(User.class, 3));
//        System.out.println(party.getUser().getUserNickname());
//        System.out.println(party);
    }

    @Test
    void userTest() {
        User user = new User();
        user.setUserEmail("zcxv@zxcv.com");
        user.setUserPhone("010-9999-9999");
        user.setUserNickname("zxcv");
        user.setUserPassword("zxcv");
        user.setUserImage("zxcv");
        user.setUserRating(99);
        user.setUserLat("999");
        user.setUserLng("999");
        user.setUserAccount("999999");
        em.persist(user);
        em.flush();
        em.clear();
    }
}
