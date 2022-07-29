// package com.E203.pjt;

// import com.E203.pjt.model.entity.Party;
// import com.E203.pjt.model.entity.QParty;
// import com.E203.pjt.repository.PartyRepositorySupport;
// import com.querydsl.jpa.impl.JPAQueryFactory;
// import org.junit.jupiter.api.Test;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.boot.test.context.SpringBootTest;
// import org.springframework.test.annotation.Rollback;
// import org.springframework.transaction.annotation.Transactional;

// import java.util.List;

// @SpringBootTest
// @Transactional
// @Rollback(value = false)
// public class QueryTests {
//     @Autowired
//     private JPAQueryFactory jpaQueryFactory;

//     QParty party = QParty.party;

//     @Autowired
//     PartyRepositorySupport partyRepositorySupport;

//     @Test
//     void getMyPartyDynamicQueryTest() {
//         partyRepositorySupport.findDynamicQueryMyPartyList(1);
//     }

//     @Test
//     void getMyPartyHostDynamicQueryTest() {
//         List<Party> partyList = partyRepositorySupport.findDynamicQueryMyPartyHostList(1);
//         System.out.println("총 개수: "+partyList.size());
//         for (Party p : partyList) {
//             System.out.println("party seq: "+p.getPartySeq());
//         }
//     }

//     @Test
//     void getMyPartyGuestDynamicQueryTest() {
//         List<Party> partyList = partyRepositorySupport.findDynamicQueryMyPartyGuestList(1);
//         System.out.println("총 개수: "+partyList.size());
//         for (Party p : partyList) {
//             System.out.println("party seq: "+p.getPartySeq());
//         }
//     }

//     @Test
//     void getOngoingMyPartyDynamicQueryTest() {
//         partyRepositorySupport.findDynamicQueryOngoingMyPartyList(1);
//     }

//     @Test
//     void getDoneMyPartyDynamicQueryTest() {
//         partyRepositorySupport.findDynamicQueryDoneMypartyList(1);
//     }
// }
