package com.E203.pjt.repository;

import com.E203.pjt.model.dto.req.MyPartyReqVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.QMyParty;
import com.E203.pjt.model.entity.QParty;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MyPartyRepositorySupport {
    @Autowired
    private JPAQueryFactory jpaQueryFactory;

    QParty party = QParty.party;
    QMyParty myParty = QMyParty.myParty;


}
