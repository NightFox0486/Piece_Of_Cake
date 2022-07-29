// package com.E203.pjt;

// import com.E203.pjt.model.entity.Party;
// import com.E203.pjt.model.entity.User;
// import org.junit.jupiter.api.Test;
// import org.springframework.boot.test.context.SpringBootTest;
// import org.springframework.test.annotation.Rollback;
// import org.springframework.transaction.annotation.Transactional;

// import javax.persistence.EntityManager;
// import javax.persistence.PersistenceContext;
// import java.time.LocalDateTime;

// @SpringBootTest
// @Transactional
// @Rollback(value = false)
// public class DataTests {

//     @PersistenceContext
//     EntityManager em;

//     @Test
//     void makeUsers() {
//         for (int i=0; i<5; i++) {
//             User user = new User();
//             user.setUserEmail(String.format("%d000@%d000.com", i, i));
//             user.setUserPhone(String.format("010-%d000-%d000", i, i));
//             user.setUserNickname(String.format("%d000",i));
//             user.setUserPassword(String.format("%d000",i));
//             user.setUserImage(String.format("%d000",i));
//             user.setUserRating(44);
//             user.setUserLat(String.format("%d",i*111));
//             user.setUserLng(String.format("%d",i*111));
//             user.setUserAccount(String.format("%d0000",i));
//             em.persist(user);
//             em.flush();
//             em.clear();
//         }
//     }

//     @Test
//     void makeParties() {
//         for (int i=0; i<5; i++) {
//             Party party = new Party();
//             User u = em.find(User.class, i+1);
//             em.persist(u);
//             for (int j=0; j<2; j++) {
//                 party.setUser(u);
//                 party.setPartyCode(String.format("00%d", j));
//                 party.setPartyTitle(String.format("%d-%d", i, j));
//                 party.setPartyContent("ㅈㄱㄴ");
//                 party.setPartyRegDt(LocalDateTime.now());
//                 party.setPartyRdvLat(String.format("%d%d", i, j));
//                 party.setPartyRdvLng(String.format("%d%d", i, j));
//                 party.setPartyMemberNumTotal(3);
//                 party.setPartyMemberNumCurrent(2);
//                 party.setPartyRdvDt(LocalDateTime.now());
//                 party.setPartyAddr(String.format("addr%d", i));
//                 party.setPartyAddrDetail(String.format("addrDetail%d", j));
//                 party.setPartyStatus(0);
//                 party.setItemLink(String.format("itemLink_%d-%d", i, j));
//                 party.setTotalAmount(String.format("%d0000%d", i, j));
//                 em.persist(party);
//             }
//         }
//         em.flush();
//         em.clear();
//     }
// }

