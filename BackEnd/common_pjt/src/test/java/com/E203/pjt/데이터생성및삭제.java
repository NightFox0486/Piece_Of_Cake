package com.E203.pjt;// package com.E203.pjt;
import com.E203.pjt.model.dto.req.MyPartyReqVO;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.service.MyPartyService;
import com.E203.pjt.service.PartyService;
import com.E203.pjt.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.annotation.Rollback;

@SpringBootTest
@Transactional
@Rollback(value = false)
public class 데이터생성및삭제 {
    @Autowired
    UserService userService;
    @Autowired
    PartyService partyService;
    @Autowired
    MyPartyService myPartyService;
    @Autowired
    PartyRepository partyRepository;

//    @Test
//    void 게스트_파티참여() {
//        Integer partySeq = 1;
//        Integer userSeq = 1;
//        MyPartyReqVO myPartyReqVO = new MyPartyReqVO();
//        myPartyReqVO.setPartySeq(partySeq);
//        myPartyReqVO.setUserSeq(userSeq);
//        myPartyReqVO.setMyPartyRole("guest");
//        myPartyService.insertMyParty(myPartyReqVO);
//        Party party = partyRepository.findByPartySeq(1);
//        System.out.println(party.getPartyMemberNumCurrent());
//    }
//
//    @Test
//    void 게스트_파티참여취소() {
//        Integer partySeq = 1;
//        Integer userSeq = 1;
//        MyPartyReqVO myPartyReqVO = new MyPartyReqVO();
//        myPartyReqVO.setPartySeq(partySeq);
//        myPartyReqVO.setUserSeq(userSeq);
//        myPartyReqVO.setMyPartyRole("guest");
//        myPartyService.deleteMyParty(myPartyReqVO);
//        Party party = partyRepository.findByPartySeq(1);
//        System.out.println(party.getPartyMemberNumCurrent());
//    }
}