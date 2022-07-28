package com.E203.pjt.repository;

import com.E203.pjt.model.entity.Party;
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

//    public List<Party> findDynamicQueryMyPartyList(Integer userSeq){
//        List<Party> result = jpaQueryFactory
//                .select(Party.class)
//                .from(party)
//                .fetch();
//        return null;
//    }
}
