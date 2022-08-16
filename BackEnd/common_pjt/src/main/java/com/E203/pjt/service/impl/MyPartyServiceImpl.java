package com.E203.pjt.service.impl;

import com.E203.pjt.model.dto.req.MyPartyReqVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.MyPartyPK;
import com.E203.pjt.repository.MyPartyRepository;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.service.MyPartyService;
import com.E203.pjt.service.PartyService;
import com.E203.pjt.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MyPartyServiceImpl implements MyPartyService {
    private final MyPartyRepository myPartyRepository;
    private final PartyRepository partyRepository;
    private final UserRepository userRepository;

    @Override
    public void insertMyParty(MyPartyReqVO myPartyReqVO) {
        MyPartyPK myPartyPK = new MyPartyPK();
        myPartyPK.setPartySeq(myPartyReqVO.getPartySeq());
        myPartyPK.setUserSeq(myPartyReqVO.getUserSeq());
        MyParty myParty = new MyParty();
        myParty.setMyPartyPK(myPartyPK);
        myParty.setParty(partyRepository.findByPartySeq(myPartyReqVO.getPartySeq()));
        myParty.setUser(userRepository.findByUserSeq(myPartyReqVO.getUserSeq()));
        myParty.setMyPartyRole(myPartyReqVO.getMyPartyRole());
        myPartyRepository.save(myParty);
    }

    @Override
    public void deleteMyParty(MyPartyReqVO myPartyReqVO) {
        MyPartyPK myPartyPK = new MyPartyPK();
        myPartyPK.setPartySeq(myPartyReqVO.getPartySeq());
        myPartyPK.setUserSeq(myPartyReqVO.getUserSeq());
        MyParty myParty = myPartyRepository.findByMyPartyPK(myPartyPK);
        myPartyRepository.delete(myParty);
    }
}
