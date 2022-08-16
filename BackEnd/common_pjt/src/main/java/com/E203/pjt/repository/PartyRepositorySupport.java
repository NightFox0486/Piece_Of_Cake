package com.E203.pjt.repository;

import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.QMyParty;
import com.E203.pjt.model.entity.QParty;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartyRepositorySupport {
    @Autowired
    private JPAQueryFactory jpaQueryFactory;

    QParty party = QParty.party;
    QMyParty myParty = QMyParty.myParty;

    public Long dynamicQueryPartyMemberNumCurrent(Integer partySeq) {
        Long result = jpaQueryFactory
                .select(myParty.user.userSeq)
                .from(myParty)
                .where(myParty.party.partySeq.eq(partySeq))
                .stream().count();
        return result;
    }

    // 파티 목록 최신순
    public List<Party> dynamicQueryPartyList() {
        List<Party> result = jpaQueryFactory
                .select(party)
                .from(party)
                .where(party.partyStatus.eq(1))
                .orderBy(party.partyRegDt.desc())
                .fetch();
        return result;
    }

    // 최신 파티 목록 10개
    public List<Party> dynamicQueryLatestPartyList() {
        List<Party> result = jpaQueryFactory
                .select(party)
                .from(party)
                .where(party.partyStatus.eq(1))
                .orderBy(party.partyRegDt.desc())
                .limit(10)
                .fetch();
        return result;
    }

    // 사용자가 참여한 모든 파티
    public List<MyParty> findDynamicQueryMyPartyList(Integer userSeq){
        List<MyParty> result = jpaQueryFactory
                .selectFrom(myParty)
                .where(myParty.user.userSeq.eq(userSeq))
                .fetch();
        return result;
    }

//    // 사용자가 호스트인 파티
//    public List<Party> dynamicQueryPartyHostList(Integer userSeq) {
//        List<Party> result = jpaQueryFactory
//                .select(party)
//                .from(party, myParty)
//                .where(party.partySeq.eq(myParty.party.partySeq)
//                        .and(myParty.partyListCode.eq("host")))
//                .fetch();
//        return result;
//    }
    public List<Party> dynamicQueryPartyHostList(Integer userSeq) {
        List<Party> result = jpaQueryFactory
                .selectFrom(party)
                .from(party, myParty)
                .where(party.partySeq.eq(myParty.party.partySeq)
                        .and(myParty.myPartyRole.eq("host")))
                .fetch();
        return result;
    }



    // 사용자가 게시트인 파티
    public List<Party> dynamicQueryPartyGuestList(Integer userSeq) {
        List<Party> result = jpaQueryFactory
                .select(party)
                .from(party, myParty)
                .where(party.partySeq.eq(myParty.party.partySeq)
                        .and(myParty.myPartyRole.eq("guest")))
                .fetch();
        return result;
    }

    public List<Party> findDynamicQueryOngoingMyPartyList(Integer userSeq) {
        List<Party> result = jpaQueryFactory
                .selectFrom(party)
                .where(party.user.userSeq.eq(userSeq)
                        .and(party.partyStatus.eq(0))
                )
                .fetch();
        for (Party p : result) {
            System.out.println(p);
            System.out.println(p.getPartySeq());
        }
        return result;
    }

    public List<Party> findDynamicQueryDoneMypartyList(Integer userSeq) {
        List<Party> result = jpaQueryFactory
                .selectFrom(party)
                .where(party.user.userSeq.eq(userSeq)
                        .and(party.partyStatus.eq(1))
                )
                .fetch();
        for (Party p : result) {
            System.out.println(p);
            System.out.println(p.getPartySeq());
        }
        return result;
    }
}
