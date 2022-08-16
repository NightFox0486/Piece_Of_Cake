package com.E203.pjt.service.impl;

import com.E203.pjt.model.dto.req.MyPartyReqVO;
import com.E203.pjt.model.entity.MyParty;
import com.E203.pjt.model.entity.MyPartyPK;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.MyPartyRepository;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.UserRepository;
import com.E203.pjt.service.MyPartyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MyPartyServiceImpl implements MyPartyService {
    private final MyPartyRepository myPartyRepository;
    private final PartyRepository partyRepository;
    private final UserRepository userRepository;

    @Override
    public Boolean insertMyParty(MyPartyReqVO myPartyReqVO) {
        Party party = partyRepository.findByPartySeq(myPartyReqVO.getPartySeq());
        User user = userRepository.findByUserSeq(myPartyReqVO.getUserSeq());
        MyPartyPK myPartyPK = new MyPartyPK();
        myPartyPK.setPartySeq(myPartyReqVO.getPartySeq());
        myPartyPK.setUserSeq(myPartyReqVO.getUserSeq());
        MyParty myParty = new MyParty();
        myParty.setMyPartyPK(myPartyPK);
        myParty.setParty(party);
        myParty.setUser(user);
        myParty.setMyPartyRole(myPartyReqVO.getPartyRole());
        MyParty result = myPartyRepository.save(myParty);
        if (result!=null) {
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void deleteMyParty(MyPartyReqVO myPartyReqVO) {
        MyParty myParty = detailMyParty(myPartyReqVO);
        myPartyRepository.delete(myParty);
    }

    @Override
    public MyParty detailMyParty(MyPartyReqVO myPartyReqVO) {
        MyPartyPK myPartyPK = new MyPartyPK();
        myPartyPK.setPartySeq(myPartyReqVO.getPartySeq());
        myPartyPK.setUserSeq(myPartyReqVO.getUserSeq());
        MyParty myParty = myPartyRepository.findByMyPartyPKAndAndMyPartyRole(myPartyPK, myPartyReqVO.getPartyRole()).get(0);
        return myParty;
    }


}
