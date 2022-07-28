package com.E203.pjt.repository;

import com.E203.pjt.model.entity.Party;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PartyRepositorySupport {
    @Autowired
    private JPAQueryFactory jpaQueryFactory;


    public List<Party> findDynamicQueryMyPartyList(){

        return null;
    }
}
