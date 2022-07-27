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

<<<<<<< HEAD
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

    @Test
    void chatLogTest() {
        ChatLog chatLog = new ChatLog();
        ChatRoom chatRoom = em.find(ChatRoom.class, 1);
        em.persist(chatRoom);
        chatLog.setChatRoom(chatRoom);
        chatLog.setChatContent("제가사고싶어요");
        chatLog.setChatCreatedAt(LocalDateTime.now());
        chatLog.setChatUpdatedAt(LocalDateTime.now());
        chatLog.setUserNickname("nickname");

        em.persist(chatLog);
    }

    @Test
    void chatRoomTest() {
        ChatRoom chatRoom = new ChatRoom();
        Party party = em.find(Party.class, 2);
        em.persist(party);
        chatRoom.setParty(party);
        chatRoom.setCreatedAt(LocalDateTime.now());
        chatRoom.setGuestNickname("eee");
        chatRoom.setHostNickname("eee");
        chatRoom.setGuestSeq(5);
        chatRoom.setHostSeq(45);

        em.persist(chatRoom);
    }
=======
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
>>>>>>> 58faf35 ([feat] wishlist crud & test)

    @Test
    void partyTest() {
        Party party = new Party();
<<<<<<< HEAD
        User u = em.find(User.class, 2);
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
=======
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
>>>>>>> 58faf35 ([feat] wishlist crud & test)
    }

    @Test
    void userTest() {
        User user = new User();
<<<<<<< HEAD
        user.setUserEmail("qqqq@qqqq.com");
        user.setUserPhone("010-2222-2222");
        user.setUserNickname("qqqq");
        user.setUserPassword("qqqq");
        user.setUserImage("qqqq");
        user.setUserRating(44);
        user.setUserLat("444");
        user.setUserLng("444");
        user.setUserAccount("44444");
=======
        user.setUserEmail("zcxv@zxcv.com");
        user.setUserPhone("010-9999-9999");
        user.setUserNickname("zxcv");
        user.setUserPassword("zxcv");
        user.setUserImage("zxcv");
        user.setUserRating(99);
        user.setUserLat("999");
        user.setUserLng("999");
        user.setUserAccount("999999");
>>>>>>> 58faf35 ([feat] wishlist crud & test)
        em.persist(user);
        em.flush();
        em.clear();
    }
<<<<<<< HEAD


=======
>>>>>>> 58faf35 ([feat] wishlist crud & test)
}
