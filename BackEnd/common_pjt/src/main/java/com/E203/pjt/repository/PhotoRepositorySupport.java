package com.E203.pjt.repository;

import com.E203.pjt.model.entity.*;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PhotoRepositorySupport {
    @Autowired
    private JPAQueryFactory jpaQueryFactory;

    QPhoto photo = QPhoto.photo;

    public List<String> dynamicQueryListPartyPhoto(Integer partySeq) {
        List<String> result = jpaQueryFactory
                .select(photo.fileUrl)
                .from(photo)
                .where(photo.party.partySeq.eq(partySeq))
                .fetch();
        return result;
    }
}
