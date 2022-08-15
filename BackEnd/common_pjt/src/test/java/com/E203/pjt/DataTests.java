package com.E203.pjt;

import com.E203.pjt.model.dto.req.PartyReqVO;
import com.E203.pjt.model.dto.req.UserReqVO;
import com.E203.pjt.model.dto.req.BookmarkReqVO;
import com.E203.pjt.model.dto.res.PartyResVO;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.PartyRepositorySupport;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.service.PartyService;
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
import java.util.List;

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
    PartyRepositorySupport partyRepositorySupport;

    @Autowired
    BookmarkService bookmarkService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    PartyService partyService;

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
    void makeParties() {
        for (int i=0; i<5; i++) {
//            User u = em.find(User.class, i+1);
//            em.persist(u);
            User u = userRepository.findByUserSeq(i+1);
            for (int j=1; j<6; j++) {
                PartyReqVO partyReqVO = new PartyReqVO();
                partyReqVO.setUserSeq(u.getUserSeq());
                partyReqVO.setPartyCode(String.format("00%d", j));
                partyReqVO.setPartyTitle(String.format("%d-%d", i, j));
                //                party.setPartyContent(String.format("%d", i*111));
                partyReqVO.setPartyContent("ㅈㄱㄴ");
                partyReqVO.setPartyBookmarkCount(0);
                partyReqVO.setPartyRdvLat(String.format("%d%d", i, j));
                partyReqVO.setPartyRdvLng(String.format("%d%d", i, j));
                partyReqVO.setPartyMemberNumTotal(3);
                partyReqVO.setPartyMemberNumCurrent(2);
                partyReqVO.setPartyRdvDt(LocalDateTime.now());
                partyReqVO.setPartyAddr(String.format("addr%d", i));
                partyReqVO.setPartyAddrDetail(String.format("addrDetail%d", j));
                partyReqVO.setPartyStatus(1);
                partyReqVO.setItemLink(String.format("itemLink_%d-%d", i, j));
                partyReqVO.setTotalAmount(String.format("%d0000%d", i, j));
                partyReqVO.setPartyMainImageUrl(String.format("%d", i*111111));
                partyService.createParty(partyReqVO);
            }
        }

//        em.flush();
//        em.clear();
    }

    @Test
    void makeBookmark() {
        for (int i=1; i<10; i++) {
            for (int j=1; j<5; j++) {
            BookmarkReqVO bookmarkReqVO = new BookmarkReqVO();
            bookmarkReqVO.setUserSeq(j);
            bookmarkReqVO.setPartySeq(i);
            bookmarkService.insertBookmark(bookmarkReqVO);
            }
        }
    }

    @Test
    void fetchPartyListInProgress() {
        List<Party> partyList = partyRepository.findAllByPartyStatus(1);
        for (Party party : partyList) {
        System.out.println(party.toString());
        }
    }

    @Test
    void fetchPartyHostList() {
        Integer userSeq = 1;
        System.out.println("repo");
        List<Party> partyList = partyRepositorySupport.dynamicQueryPartyHostList(userSeq);
        for (Party party : partyList) {
        System.out.println(party.getPartyTitle());
        }
//        System.out.println("service");
//        List<PartyResVO> partyResVOList = partyService.listPartyHost(userSeq);
//        for (PartyResVO partyResVO : partyResVOList) {
//            System.out.println(partyResVO.toString());
//        }
        System.out.println("end");
    }

    @Test
    void fetchPartyGuestList() {
        Integer userSeq = 1;
        List<Party> partyList = partyRepositorySupport.dynamicQueryPartyGuestList(userSeq);
        for (Party party : partyList) {
        System.out.println(party.getPartyTitle());
        }
    }

    @Test
    void checkCreatePartyReturnValue() {
        PartyReqVO partyReqVO = new PartyReqVO();
        User u = em.find(User.class, 8);
        int i = 7, j = 8;
        partyReqVO.setUserSeq(u.getUserSeq());
        partyReqVO.setPartyCode(String.format("00%d", j));
        partyReqVO.setPartyTitle(String.format("%d-%d", i, j));
        //                party.setPartyContent(String.format("%d", i*111));
        partyReqVO.setPartyContent("ㅈㄱㄴ");
        partyReqVO.setPartyBookmarkCount(0);
//        partyReqVO.setPartyRegDt(LocalDateTime.now());
        partyReqVO.setPartyRdvLat(String.format("%d%d", i, j));
        partyReqVO.setPartyRdvLng(String.format("%d%d", i, j));
        partyReqVO.setPartyMemberNumTotal(3);
        partyReqVO.setPartyMemberNumCurrent(2);
        partyReqVO.setPartyRdvDt(LocalDateTime.now());
        partyReqVO.setPartyAddr(String.format("addr%d", i));
        partyReqVO.setPartyAddrDetail(String.format("addrDetail%d", j));
        partyReqVO.setPartyStatus(1);
        partyReqVO.setItemLink(String.format("itemLink_%d-%d", i, j));
        partyReqVO.setTotalAmount(String.format("%d0000%d", i, j));
        PartyResVO result = partyService.createParty(partyReqVO);
        System.out.println("result: "+result.toString());
    }

    @Test
    void checkDeletePartyCascade() {
//        Party party = partyRepository.findByPartySeq(1);
        partyService.deleteParty(1);

    }
}

