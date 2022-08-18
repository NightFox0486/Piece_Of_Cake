package com.E203.pjt;// package com.E203.pjt;
import com.E203.pjt.model.dto.req.MyPartyReqVO;
import com.E203.pjt.model.dto.req.PartyReqVO;
import com.E203.pjt.model.entity.Party;
import com.E203.pjt.model.entity.Photo;
import com.E203.pjt.model.entity.User;
import com.E203.pjt.repository.PartyRepository;
import com.E203.pjt.repository.PhotoRepository;
import com.E203.pjt.repository.UserRepository;
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
    UserRepository userRepository;
    @Autowired
    PartyRepository partyRepository;
    @Autowired
    PhotoRepository photoRepository;

    Integer partySeqHostPartyCreateDelete = 15;

//    @Test
//    void 호스트_파티생성() {
//        Integer userSeq = 4;
//        PartyReqVO partyReqVO = new PartyReqVO();
//        partyReqVO.setUserSeq(userSeq);
//        partyReqVO.setPartyCode("002");
//        partyReqVO.setPartyTitle("유리가 만든 파티");
//        partyReqVO.setPartyContent("this is a party made by yuri");
//        partyReqVO.setPartyBookmarkCount(0);
//        partyReqVO.setPartyRdvLat("111");
//        partyReqVO.setPartyRdvLng("222");
//        partyReqVO.setPartyMemberNumTotal(2);
//        partyReqVO.setPartyMemberNumCurrent(1);
//        partyReqVO.setPartyAddr("부산광역시");
//        partyReqVO.setPartyAddrDetail("해운대");
//        partyReqVO.setPartyStatus(1);
//        partyReqVO.setItemLink("http://www.naver.com");
//        partyReqVO.setTotalAmount("1000");
//        partyReqVO.setPartyMainImageUrl("https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image8-0.jpg?alt=media&token=cc6741eb-ad77-4174-8482-3b354d1a4d39");
//        partyService.createParty(partyReqVO);
//
//        Photo photo = new Photo();
//        photo.setFileName("image-test/test-image-yuri.jpg");
//        photo.setFileUrl("https://firebasestorage.googleapis.com/v0/b/chat-ad85f.appspot.com/o/image-test%2Ftest-image8-0.jpg?alt=media&token=cc6741eb-ad77-4174-8482-3b354d1a4d39");
//        photo.setParty(partyRepository.findByPartySeq(partySeqHostPartyCreateDelete));
//        photoRepository.save(photo);
//    }
//
//    @Test
//    void 호스트_파티삭제() {
////        Party party = partyRepository.findByPartySeq(35);
//        Party party = partyRepository.findByPartySeq(partySeqHostPartyCreateDelete);
//        partyRepository.delete(party);
//    }

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