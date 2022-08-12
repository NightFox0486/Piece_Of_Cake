package com.E203.pjt;

import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.req.BookmarkReqVO;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.service.UserService;
import com.E203.pjt.service.BookmarkService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.time.LocalDateTime;

@SpringBootTest
@Transactional
@Rollback(value = false)
public class DataTests {

    @PersistenceContext
    EntityManager em;

    @Autowired
    UserService userService;

    @Autowired
    PartyRepository partyRepository;

    @Autowired
    BookmarkService bookmarkService;

    @Test
    void makeKakaoUsers() {
        UserReqVO userReqVO = new UserReqVO();
        userReqVO.setUserEmail("asdf@asdf.com");
        userReqVO.setUserPhone("010-1111-1111");
        userReqVO.setUserNickname("asdf");
        userReqVO.setUserImage("asdf");
        userReqVO.setUserKakaoLoginId("12341234");
        User user = userReqVO.toEntity();
        em.persist(user);
        em.flush();
        em.clear();
    }

    @Test
    void makeUsers() {
        for (int i=0; i<5; i++) {
            User user = new User();
            user.setUserEmail(String.format("%d000@%d000.com", i, i));
            user.setUserPhone(String.format("010-%d000-%d000", i, i));
            user.setUserNickname(String.format("%d000",i));
            user.setUserPassword(String.format("%d000",i));
            user.setUserImage(String.format("%d000",i));
            user.setUserRating(44);
            user.setUserLat(String.format("%d",i*111));
            user.setUserLng(String.format("%d",i*111));
            user.setUserAccount(String.format("%d0000",i));
            user.setUserKakaoLoginId(String.format("%d", i*1111111));
            em.persist(user);
            em.flush();
            em.clear();
        }
    }

    @Test
    void makeBookmark() {
        for (int i=1; i<11; i++) {
            for (int j=1; j<5; j++) {
                BookmarkReqVO bookmarkReqVO = new BookmarkReqVO();
                bookmarkReqVO.setUserSeq(j);
                bookmarkReqVO.setPartySeq(i);
                bookmarkService.insertBookmark(bookmarkReqVO);
            }
        }
    }

    @Test
    void makeParties() {
        for (int i=0; i<10; i++) {
            Party party = new Party();
            User u = em.find(User.class, i+1);
            em.persist(u);
            for (int j=1; j<3; j++) {
                party.setUser(u);
                party.setPartyCode(String.format("00%d", j));
                party.setPartyTitle(String.format("%d-%d", i, j));
//                party.setPartyContent(String.format("%d", i*111));
                party.setPartyContent("ㅈㄱㄴ");
                party.setPartyBookmarkCount(0);
                party.setPartyRegDt(LocalDateTime.now());
                party.setPartyRdvLat(String.format("%d%d", i, j));
                party.setPartyRdvLng(String.format("%d%d", i, j));
                party.setPartyMemberNumTotal(3);
                party.setPartyMemberNumCurrent(2);
                party.setPartyRdvDt(LocalDateTime.now());
                party.setPartyAddr(String.format("addr%d", i));
                party.setPartyAddrDetail(String.format("addrDetail%d", j));
                party.setPartyStatus(0);
                party.setItemLink(String.format("itemLink_%d-%d", i, j));
                party.setTotalAmount(String.format("%d0000%d", i, j));
                em.persist(party);
            }
        }
        em.flush();
        em.clear();
    }
}

